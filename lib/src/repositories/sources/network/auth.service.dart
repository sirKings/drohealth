import 'package:Drohealth/src/helpers/http/http.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.keys.dart';
import 'package:Drohealth/src/models/response.model.dart';
import 'package:Drohealth/src/models/user.model.dart';
import './base/endpoints.dart' as Endpoints;

class AuthService{
  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();
    UserModel user;

    final String url = Endpoints.login.auth;

    final payload = {login, senha};
    
    final retAuth = HttpHelper.post(url, body: payload);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.login, login);
      StorageHelper.set(StorageKeys.senha, senha);

      user = UserModel.fromJson(res.data);

      response.status = res.statusCode;
      response.data = user;
      response.message = res.statusMessage;
    })
    .catchError((e) {
      StorageHelper.set(StorageKeys.token, "");
      StorageHelper.set(StorageKeys.login, "");
      StorageHelper.set(StorageKeys.senha, "");
      
      response.status = 500;
      response.data = e;
      response.message = "User not found";
    });
    
    return response;
  }
}
