import 'package:Drohealth/src/blocs/auth.bloc.dart';
import 'package:Drohealth/src/views/ui/auth/login/login_body.dart';
import 'package:Drohealth/src/views/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(message: "Loading message", status: bloc.loading, child: Scaffold(body: Container(child: LoginBody(bloc))));
  }
}
