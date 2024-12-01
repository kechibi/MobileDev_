import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_notifier.dart';
import 'edit_profile_page.dart';
import 'login_page.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    Widget profileDetail(String label, String value) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                '$label: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Color(0xFFFFA07A), // Dark peach
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Navigate back to LoginPage and clear navigation history
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFFFDAB9), // Light peach
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Color(0xFFFFA07A), // Dark peach
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome, ${profile.name}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
              ),
              SizedBox(height: 20),
              profileDetail('Name', profile.name),
              profileDetail('Bio', profile.bio),
              profileDetail('Age', '${profile.age}'),
              profileDetail('Address', profile.address),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFA07A), // Dark peach
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.white),
                label: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
