import 'package:Drohealth/src/blocs/login/login_bloc.dart';
import 'package:Drohealth/src/di/injection_container.dart' as di;
import 'package:Drohealth/src/values/theme.dart' as appTheme;
import 'package:Drohealth/src/views/ui/auth/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => di.injector<LoginBloc>(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, theme: appTheme.theme, home: LoginPage()),
    );
  }
}
