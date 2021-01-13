import 'package:Drohealth/src/data/sources/network/repository/auth_repository.dart';
import 'package:Drohealth/src/models/server_error_model.dart';
import 'package:Drohealth/src/models/state.dart';
import 'package:Drohealth/src/views/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository);

  final _loading = BehaviorSubject<bool>();
  final _login = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Observable<bool> get loading => _loading.stream;

  void _setLoading(bool value) => _loading.sink.add(value);

  Observable<String> get login => _login.stream;

  void setLogin(String value) => _login.sink.add(value);

  Observable<String> get password => _password.stream;

  void setPassword(String value) => _password.sink.add(value);

  void signIn() async {
    _setLoading(true);

    final state = await _authRepository.login(_login.value, _password.value);
    if (state is SuccessState) {
      debugPrint("successfully logged in user ${state.value}");
      CustomToast.show("Success");
    } else if (state is ErrorState) {
      // we can now cast the state to a ServerErrorModel since dart does not support Reflection
      final error = state.value as ServerErrorModel;
      CustomToast.show(error.errorMessage);
    }

    _setLoading(false);
  }

  void dispose() {
    _loading.close();
    _login.close();
    _password.close();
  }
}
