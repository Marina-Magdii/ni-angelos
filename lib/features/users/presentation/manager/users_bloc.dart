import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';
import 'package:ni_angelos/features/users/domain/repositories/users_repo_contract.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_event.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_state.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  @factoryMethod
  UsersBloc(this.usersRepo) : super(UsersInitState()) {
    on<UsersDataEvent>(getAllUsers);
    on<UsersSelectEvent>(selectUser);
    on<UsersSearchEvent>(searchUsers);
    on<UsersSelectAllEvent>(selectAllUsers);
  }
  UsersRepoContract usersRepo;

  getAllUsers(UsersDataEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    try {
      var response = await usersRepo.getAllUsers();
      response.fold(
        (users) {
          emit(
            UsersSuccessState(
              users: users,
              selectedUsers: [],
              filteredUsers: users,
            ),
          );
          return Left(users);
        },
        (error) {
          emit(UsersErrorState(error.toString()));
          return Right(error.toString());
        },
      );
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }

  selectUser(UsersSelectEvent event, Emitter<UsersState> emit) {
    if (state is UsersSuccessState) {
      final currentState = state as UsersSuccessState;
      final selectedUsers = List<User>.from(currentState.selectedUsers);

      if (selectedUsers.contains(event.selectedUser)) {
        selectedUsers.remove(event.selectedUser);
      } else {
        selectedUsers.add(event.selectedUser);
      }

      emit(
        UsersSuccessState(
          users: currentState.users,
          selectedUsers: selectedUsers,
          filteredUsers: [],
        ),
      );
    }
  }

  searchUsers(UsersSearchEvent event, Emitter<UsersState> emit) {
    if (state is UsersSuccessState) {
      final currentState = state as UsersSuccessState;
      final allUsers = currentState.users;

      final filteredUsers =
          allUsers
              .where(
                (user) =>
                    user.usersData.name?.toLowerCase().contains(
                      event.searchQuery.toLowerCase(),
                    ) ??
                    false,
              )
              .toList();

      emit(
        UsersSuccessState(
          users: currentState.users, // Keep full list
          selectedUsers: currentState.selectedUsers,
          filteredUsers: filteredUsers, // Optionally add this field
        ),
      );
    }
  }

  selectAllUsers(UsersSelectAllEvent event, Emitter<UsersState> emit) {
    if (state is UsersSuccessState) {
      final users = (state as UsersSuccessState).users;
      emit(
        UsersSuccessState(
          users: users,
          selectedUsers: List.from(users),
          filteredUsers: [],
        ),
      );
    }
  }
}
