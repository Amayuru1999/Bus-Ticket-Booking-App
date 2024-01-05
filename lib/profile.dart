import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? _user;
  late Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get user data from Firestore
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          _user = user;
          _userData = userData.data() as Map<String, dynamic>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: _user != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${_userData['username'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Email: ${_user!.email}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Date of Birth: ${_userData['dob'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  _userData.containsKey('image')
                      ? Image.network(
                          _userData['image'],
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(),
                  // Add other fields as needed based on your Firestore schema
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
