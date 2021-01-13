import 'package:Drohealth/src/models/state.dart';

abstract class AuthRepository {
  Future<State> login(String name, String email);
}
