// lib/core/user/user_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_spiders/core/user/user_state.dart';
import 'package:learning_spiders/core/user/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

   Future<void> submitAuthForm({
            required String name,
            required String password,
            required bool isLoginMode,
            String? gender, //  <--  اختياري، فقط للتسجيل
          }) async {
            try {
              emit(state.copyWith(isLoading: true, error: null, user: null));
              await Future.delayed(const Duration(seconds: 1));

              if (isLoginMode) {
                // تسجيل الدخول
                if (name.isNotEmpty && password.isNotEmpty) {
                  UserModel loggedInUser = UserModel(
                      id: 1,
                      name: name,
                      gender: 'unknown',
                      creationDate: DateTime.now().toString());
                  emit(state.copyWith(user: loggedInUser, isLoading: false));
                } else {
                  emit(state.copyWith(
                      error: 'Login failed: Incorrect username or password.',
                      isLoading: false));
                }
              } else {
                // التسجيل
                if (name.isNotEmpty && password.isNotEmpty && gender != null) {
                  final newUser = UserModel(
                      name: name,
                      password: password,
                      gender: gender,
                      creationDate: DateTime.now().toString());
                  emit(state.copyWith(user: newUser, isLoading: false));
                } else {
                   emit(state.copyWith(
                      error: 'Registration failed: Incomplete data.',
                      isLoading: false));
                }
              }
            } catch (e) {
              emit(state.copyWith(isLoading: false, error: e.toString()));
            }
          }

  Future<void> updateUser(UserModel updatedUser) async {
    emit(state.copyWith(isLoading: true, error: null));
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(user: updatedUser, isLoading: false));
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}
