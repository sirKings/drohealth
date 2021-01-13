import 'package:Drohealth/src/blocs/base/bloc_provider.dart';
import 'package:Drohealth/src/values/theme.dart' as appTheme;
import 'package:Drohealth/src/views/ui/auth/login/login.page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(debugShowCheckedModeBanner: false, theme: appTheme.theme, home: LoginPage()),
    );
  }
} 