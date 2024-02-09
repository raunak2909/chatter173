part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class CreateUserEvent extends RegisterEvent{
  UserModel newUser;
  String pass;
  CreateUserEvent({required this.newUser, required this.pass});
}
