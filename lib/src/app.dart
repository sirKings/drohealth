import 'package:flutter/material.dart';
import 'package:Drohealth/src/blocs/base/bloc_provider.dart';
import 'package:Drohealth/src/values/theme.dart' as appTheme;

import 'package:Drohealth/src/pages/login/login.page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        home: LoginPage()
      ),
    );
  }
} 