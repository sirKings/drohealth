import 'package:Drohealth/src/blocs/auth.bloc.dart';
import 'package:Drohealth/src/values/dimens.dart' as dimens;
import 'package:Drohealth/src/views/widgets/button.dart';
import 'package:Drohealth/src/views/widgets/edit_text.dart';
import 'package:Drohealth/src/views/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  final AuthBloc authBloc;

  LoginBody(this.authBloc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
          SizedBox(height: 20),
          EditText(
            placeholder: "LOGIN",
            value: authBloc.login,
            onChange: (value) => authBloc.setLogin(value),
          ),
          SizedBox(height: 10),
          EditText(
            placeholder: "PASSWORD",
            value: authBloc.password,
            onChange: (value) => authBloc.setPassword(value),
          ),
          SizedBox(height: 20),
          CustomButton(
            label: "Sign In",
            onPress: () => authBloc.signIn(),
          )
        ],
      ),
    );
  }
}
