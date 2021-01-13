import 'package:Drohealth/src/data/sources/network/repository/auth_repository.dart';
import 'package:Drohealth/src/data/sources/network/repository/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

// A DI module for injecting our repositories

Future<void> init(GetIt injector) async {
  /** AuthRepository*/
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authService: injector.get()));
}
