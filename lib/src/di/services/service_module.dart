// A DI module for injecting our repositories
import 'package:Drohealth/src/data/sources/network/auth/auth_service.dart';
import 'package:Drohealth/src/data/sources/network/auth/auth_service_impl.dart';
import 'package:get_it/get_it.dart';


Future<void> init(GetIt injector) async {
  /** AuthService*/
  injector.registerLazySingleton<AuthService>(() => AuthServiceImpl(httpClient: injector.get()));
}
