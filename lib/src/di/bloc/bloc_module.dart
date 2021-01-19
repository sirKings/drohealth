import 'package:Drohealth/src/blocs/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> init(GetIt injector) async {
  /** Login Bloc*/

  injector.registerFactory(() => LoginBloc(injector.get()));
}
