import 'package:Drohealth/src/blocs/auth.bloc.dart';
import 'package:Drohealth/src/blocs/drawer.bloc.dart';
import 'package:Drohealth/src/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
        providers: [Provider<AuthBloc>.value(value: new AuthBloc(injector.get())), Provider<DrawerBloc>.value(value: new DrawerBloc())], child: child);
  }
}
