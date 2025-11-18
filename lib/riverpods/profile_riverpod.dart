import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileData {
  final String name;
  final String email;
  final int avatarIndex;

  const ProfileData({
    required this.name,
    required this.email,
    required this.avatarIndex,
  });

  ProfileData copyWith({String? name, String? email, int? avatarIndex}) {
    return ProfileData(
      name: name ?? this.name,
      email: email ?? this.email,
      avatarIndex: avatarIndex ?? this.avatarIndex,
    );
  }
}

class ProfileNotifier extends Notifier<ProfileData> {
  @override
  ProfileData build() {
    return const ProfileData(
      name: 'Cinebee User',
      email: 'cinebee@example.com',
      avatarIndex: 0,
    );
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateAvatar(int index) {
    state = state.copyWith(avatarIndex: index);
  }
}

final profileRiverpod =
    NotifierProvider.autoDispose<ProfileNotifier, ProfileData>(
      ProfileNotifier.new,
    );
