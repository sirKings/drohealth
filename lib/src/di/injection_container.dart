import 'package:Drohealth/src/di/network/network_module.dart' as NetworkModule;
import 'package:Drohealth/src/di/repositories/repository_module.dart' as RepositoryModule;
import 'package:Drohealth/src/di/services/service_module.dart' as ServiceModule;
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

Future<void> init() async {
  // Network Modules
  NetworkModule.init(injector);

  // Repository Modules
  RepositoryModule.init(injector);

  // Service Modules
  ServiceModule.init(injector);
}
