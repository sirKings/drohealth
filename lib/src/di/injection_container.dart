import 'package:Drohealth/src/data/sources/network/auth/auth_service.dart';
import 'package:Drohealth/src/data/sources/network/auth/auth_service_impl.dart';
import 'package:Drohealth/src/data/sources/network/repository/auth_repository.dart';
import 'package:Drohealth/src/data/sources/network/repository/auth_repository_impl.dart';
import 'package:Drohealth/src/helpers/http/http.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.keys.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

// Todo split up this class into separate modules
Future<void> init() async {
  /** AuthRepository*/
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authService: injector.get()));

  /** HttpHelper*/
  injector.registerFactory(() => HttpHelper());

  /** AuthService*/
  injector.registerLazySingleton<AuthService>(() => AuthServiceImpl(httpClient: injector.get()));

  // External libraries
  /** Dio*/
  injector.registerFactoryAsync((() async {
    // Factory Async will always return a new instance whenever this class is called
    final Dio dioClient = Dio();
    final storageToken = await StorageHelper.get(StorageKeys.token);

    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    if (storageToken != null) headers['Authorization'] = 'Bearer $storageToken';

    dioClient.options.headers = headers;
    return dioClient;
  }));
}
