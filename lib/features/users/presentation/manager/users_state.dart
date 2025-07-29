import 'package:ni_angelos/features/users/data/models/users_model.dart';

abstract class UsersState {}

class UsersInitState extends UsersState {}

class UsersErrorState extends UsersState {
  String errorMessage;
  UsersErrorState(this.errorMessage);
}

class UsersLoadingState extends UsersState {}

class UsersSuccessState extends UsersState {
  final List<User> users;
  final List<User> selectedUsers;
  UsersSuccessState({required this.users, required this.selectedUsers});
}