import 'dart:math';

import 'package:Drohealth/src/blocs/login/login_event.dart';
import 'package:Drohealth/src/blocs/login/login_state.dart';
import 'package:Drohealth/src/data/sources/network/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(AuthRepository repository)
      : assert(repository != null),
        _authRepository = repository,
        super(LoginInitial()); // LoginInitial is the state before any event is added to our bloc stream

  final AuthRepository _authRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield* _mapLoginButtonPressedEventToState(event.email, event.password);
    }
  }

  Stream<LoginState> _mapLoginButtonPressedEventToState(String email, String password) async* {
    /** A simulated display to get things up and running for now*/
    yield LoginLoading();
    await Future.delayed(Duration(seconds: 5)); // 5 seconds simulated delay
    bool success = Random().nextBool();
    if (success) {
      yield LoginSuccessFul();
      yield LoginInitial();
    } else {
      yield LoginFailure(error: "User does not exist");
      yield LoginInitial();
    }

    /** Actual network call being made to our Back-end server*/
    // final state = await _authRepository.login(email, password);
    // if (state is SuccessState) {
    //   debugPrint("successfully logged in user ${state.value}");
    //   yield LoginSuccessFul();
    //   yield LoginInitial();
    // } else if (state is ErrorState) {
    //   // we can now cast the state to a ServerErrorModel since dart does not support Reflection
    //   final error = state.value as ServerErrorModel;
    //   yield LoginFailure(error: error.errorMessage ?? "User does not exist");
    //   yield LoginInitial();
    // }
  }
}
