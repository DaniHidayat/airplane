import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      print('err${e.toString()}');
      emit(AuthFailed('username atau password salah!'));
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String name,
      required String konfirmasiPassword}) async {
    try {
      emit(AuthLoading());
      if (password == konfirmasiPassword) {
        UserModel user = await AuthService().signUp(
            email: email,
            password: password,
            name: name,
            konfirmasiPassword: konfirmasiPassword);

        emit(AuthSuccess(user));
      } else {
        emit(AuthFailed('password tidak sama!'));
      }
    } catch (e) {
      print('eee${e}');
      emit(AuthFailed('Email Sudah di gunakan!'));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());

      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
