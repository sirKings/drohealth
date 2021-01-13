import 'package:Drohealth/src/data/sources/network/auth/auth_service.dart';
import 'package:Drohealth/src/models/state.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({this.authService});

  @override
  Future<State> login(String name, String email) async {
    return authService.login(name, email);
  }
}
