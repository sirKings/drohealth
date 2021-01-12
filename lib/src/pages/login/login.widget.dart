import 'package:flutter/material.dart';
import 'package:Drohealth/src/blocs/auth.bloc.dart';
import 'package:Drohealth/src/widgets/button.dart';
import 'package:Drohealth/src/widgets/edit_text.dart';
import 'package:Drohealth/src/widgets/logo.dart';
import 'package:Drohealth/src/values/dimens.dart' as dimens;

class LoginWidget {
  Widget form(BuildContext context, AuthBloc bloc) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),

          SizedBox(height: 20),

          EditText(
            placeholder: "LOGIN",
            value: bloc.login,
            onChange: (value) => bloc.setLogin(value),
          ),

          SizedBox(height: 10),

          EditText(
            placeholder: "PASSWORD",
            value: bloc.password,
            onChange: (value) => bloc.setPassword(value),
          ),

          SizedBox(height: 20),

          CustomButton(
            label: "Sign In",
            onPress: () => bloc.signIn(),
          )
        ],
      ),
    );
  }
}