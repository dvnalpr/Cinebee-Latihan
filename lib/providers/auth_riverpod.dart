import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChanges;
});
