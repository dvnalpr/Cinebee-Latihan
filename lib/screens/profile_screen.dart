import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpods/profile_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileRiverpod);
    final notifier = ref.read(profileRiverpod.notifier);

    final avatars = const [Icons.person, Icons.movie, Icons.star];

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFFFFD700),
              child: Icon(
                avatars[profile.avatarIndex],
                size: 60,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            _buildEditableField(
              label: 'Name',
              value: profile.name,
              onChanged: notifier.updateName,
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              label: 'Email',
              value: profile.email,
              onChanged: notifier.updateEmail,
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose Avatar',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              children: List.generate(avatars.length, (index) {
                final isSelected = profile.avatarIndex == index;
                return GestureDetector(
                  onTap: () => notifier.updateAvatar(index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFFFFD700)
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      child: Icon(avatars[index], color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            const Text(
              'Cinebee • Movie Streaming App',
              style: TextStyle(fontSize: 12, color: Colors.white54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: const Color(0xFFFFD700),
          controller: TextEditingController()..text = value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
