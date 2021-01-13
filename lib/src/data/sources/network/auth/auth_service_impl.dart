import 'package:Drohealth/src/helpers/http/http.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.helper.dart';
import 'package:Drohealth/src/helpers/storage/storage.keys.dart';
import 'package:Drohealth/src/models/server_error_model.dart';
import 'package:Drohealth/src/models/state.dart';
import 'package:Drohealth/src/models/user.model.dart';

import '../base/endpoints.dart' as Endpoints;
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final HttpHelper httpClient;

  AuthServiceImpl({this.httpClient});

  @override
  Future<State> login(String name, String email) async {
    final String url = Endpoints.login.auth;
    final payload = {name, email};
    final response = await httpClient.post(url, body: payload);

    if (response.statusCode == 200) {
      String token = response.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.login, name);
      StorageHelper.set(StorageKeys.senha, email);
      return State<UserModel>.success(UserModel.fromJson(response.data));
    } else {
      return State<ServerErrorModel>.error(
        ServerErrorModel(statusCode: response.statusCode, errorMessage: "User not found", data: response.data),
      ); // A custom error class can be used instead
    }
  }
}
