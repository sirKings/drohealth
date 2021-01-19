import 'package:Drohealth/src/blocs/login/login_bloc.dart';
import 'package:Drohealth/src/blocs/login/login_event.dart';
import 'package:Drohealth/src/blocs/login/login_state.dart';
import 'package:Drohealth/src/di/injection_container.dart';
import 'package:Drohealth/src/values/dimens.dart' as dimens;
import 'package:Drohealth/src/views/widgets/button.dart';
import 'package:Drohealth/src/views/widgets/edit_text.dart';
import 'package:Drohealth/src/views/widgets/logo.dart';
import 'package:Drohealth/src/views/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final _emailTextController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoginBloc _loginBloc = injector.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        cubit: _loginBloc,
        listener: (_, state) {
          if (state is LoginFailure) {
            debugPrint("error message is ${state.error}");
            CustomToast.show(state.error);
          }

          if (state is LoginSuccessFul) {
            // Navigate away || show a Toast
            CustomToast.show("Success");
          }
        },
        builder: (context, state) {
          // return widget here based on BlocA's state
          return Container(
            padding: EdgeInsets.all(dimens.margin),
            child: Padding(
              padding: EdgeInsets.all(dimens.margin),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Logo(),
                    SizedBox(height: 20),
                    EditText(
                      placeholder: "Email",
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    EditText(
                      placeholder: "Password",
                      password: true,
                      controller: _passwordEditingController,
                    ),
                    SizedBox(height: 20),
                    showLoadingOrBtn(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void loginInUser() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final email = this._emailTextController.text.toString().trim();
      final password = this._passwordEditingController.text.toString().trim();
      debugPrint("email is $email and password is $password");
      _loginBloc.add(LoginButtonPressed(email: email, password: password));
    }
  }

  Widget showLoadingOrBtn(LoginState state) {
    if (state is LoginLoading) {
      return CircularProgressIndicator(backgroundColor: Colors.lightBlue);
    } else {
      return CustomButton(
        label: "Sign In",
        onPress: () => loginInUser(),
      );
    }
  }
}
