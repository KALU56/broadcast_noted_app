import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryImpl authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  // Register user
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signUp(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        password: password,
      );

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError("Registration failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Login user
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signIn(
        email: email,
        password: password,
      );

      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError("Login failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Logout user
  Future<void> signOut() async {
    await authRepository.signOut();
    emit(AuthUnauthenticated());
  }

  // Check current user
  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
