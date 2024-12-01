import 'package:flutter_riverpod/flutter_riverpod.dart';

// Profile data model
class Profile {
  String name;
  String bio;
  int age;
  String address;

  Profile({
    required this.name,
    required this.bio,
    required this.age,
    required this.address,
  });
}

// Define a StateNotifier to manage the profile state
class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier()
      : super(Profile(
          name: 'Guest',
          bio: 'A new user',
          age: 18,
          address: '123 Main Street',
        ));

  // Method to update the profile
  void updateProfile(Profile newProfile) {
    state = newProfile;
  }
}

// Define a provider for the ProfileNotifier
final profileProvider =
    StateNotifierProvider<ProfileNotifier, Profile>((ref) {
  return ProfileNotifier();
});
