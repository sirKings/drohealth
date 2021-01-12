import 'package:Drohealth/src/helpers/connection.helper.dart';
import 'package:Drohealth/src/models/response.model.dart';
import 'package:Drohealth/src/repositories/sources/network/auth.service.dart';

class AuthRepository {
  AuthService api = AuthService();

  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.login(login, senha);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
