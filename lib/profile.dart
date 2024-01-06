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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          _user = user;
          _userData = userData.data() as Map<String, dynamic>;
          _nameController.text = _userData['username'] ?? '';
          _emailController.text = _user!.email ?? '';
          _dobController.text = _userData['dob'] ?? '';
        });
      }
    }
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }

  void _updateProfile() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .update({
      'username': _nameController.text,
      'dob': _dobController.text,
    });

    setState(() {
      _userData['username'] = _nameController.text;
      _userData['dob'] = _dobController.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isEditing = true;
              });
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: _signOut,
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: _user != null
          ? Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue.shade400, Colors.blue.shade900],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topCenter,
                        child: _userData.containsKey('image')
                            ? CircleAvatar(
                                radius: 75,
                                backgroundImage:
                                    NetworkImage(_userData['image'] as String),
                              )
                            : SizedBox.shrink(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _isEditing
                                ? TextFormField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your name',
                                    ),
                                  )
                                : Text(
                                    '${_userData['username'] ?? 'N/A'}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                            const SizedBox(height: 16),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _isEditing
                                ? TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your email',
                                    ),
                                  )
                                : Text(
                                    '${_user!.email}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                            const SizedBox(height: 16),
                            Text(
                              'Date of Birth',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _isEditing
                                ? TextFormField(
                                    controller: _dobController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your date of birth',
                                    ),
                                  )
                                : Text(
                                    '${_userData['dob'] ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                            // Add other fields as needed based on your Firestore schema
                          ],
                        ),
                      ),
                      if (_isEditing)
                        ElevatedButton(
                          onPressed: _updateProfile,
                          child: Text('Save Changes'),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade400,
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
