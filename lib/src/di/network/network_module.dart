// Inject all network dependencies here

import 'package:Drohealth/src/helpers/http/http.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.keys.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init(GetIt injector) async {
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

  /** HttpHelper*/
  injector.registerFactory(() => HttpHelper());
}
