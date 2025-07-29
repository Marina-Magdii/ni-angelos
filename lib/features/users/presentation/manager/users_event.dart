import 'package:ni_angelos/features/users/data/models/users_model.dart';

abstract class UsersEvent {}

class UsersDataEvent extends UsersEvent {}

class UsersSearchEvent extends UsersEvent {
  final String searchQuery;
  UsersSearchEvent (this.searchQuery);
}

class UsersSelectEvent extends UsersEvent {
  User selectedUser;
  UsersSelectEvent(this.selectedUser);
}

class UsersSelectAllEvent extends UsersEvent {}