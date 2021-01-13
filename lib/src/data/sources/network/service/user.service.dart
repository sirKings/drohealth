import 'package:Drohealth/src/helpers/http/http.helper.dart';
import 'package:Drohealth/src/models/server_error_model.dart';
import 'package:Drohealth/src/models/state.dart';
import 'package:Drohealth/src/models/user.model.dart';

import '../base/endpoints.dart' as Endpoints;

class UserApiProvider {
  final HttpHelper _httpHelper;

  UserApiProvider(this._httpHelper);

  Future<State> list() async {
    final String url = Endpoints.myList.list;

    final response = await _httpHelper.get(url);

    if (response.statusCode == 200) {
      return State<List<UserModel>>.success(UserModel.fromJsonList(response.data));
    } else {
      return State<ServerErrorModel>.error(
        ServerErrorModel(statusCode: response.statusCode, errorMessage: "User not found", data: response.data),
      );
    }
  }
}
