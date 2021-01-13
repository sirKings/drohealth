import 'package:Drohealth/src/models/state.dart';

abstract class AuthService {
  Future<State> login(String name, String email);
}
