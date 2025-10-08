import 'package:broadcast/features/auth/data/models/user_model.dart';

abstract interface class AuthRepository {
  Future<UserModel?> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel?> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();
}
