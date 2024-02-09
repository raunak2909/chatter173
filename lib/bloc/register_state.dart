part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterLoadedState extends RegisterState {}
class RegisterErrorState extends RegisterState {
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}
