import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:randomchat/models/user_model.dart';

import '../firebase/firebase_provider.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  FirebaseProvider firebaseProvider;
  RegisterBloc({required this.firebaseProvider}) : super(RegisterInitialState()) {
    on<CreateUserEvent>((event, emit) async {

      emit(RegisterLoadingState());

      try {
        await firebaseProvider.createUser(
          mUser: event.newUser, mPass: event.pass,);
        emit(RegisterLoadedState());
      } catch (e){
        emit(RegisterErrorState(errorMsg: e.toString()));
      }

    });
  }
}
