import 'dart:io';
import 'package:busticketbooking/firebase_auth_implementaion/firebase_auth_services.dart';
import 'package:busticketbooking/form_container_widget.dart';
import 'package:busticketbooking/global/common/toast.dart';
import 'package:busticketbooking/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // If you're using Firestore

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ImagePicker _picker = ImagePicker();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;
  XFile? _imageFile;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;
        Navigator.pushNamed(context, "/home");

        if (user != null) {
          // Perform actions after signing in with Google
          // For example, you can navigate to a new screen or fetch user details
          // You can access user details like user.displayName, user.email, etc.
          print('Signed in with Google! User: ${user.displayName}');
        }
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("SignUp"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _selectImage();
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(
                    child: _imageFile == null
                        ? const Text('Select Profile Image')
                        : Image.file(File(_imageFile!.path)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.grey[300],
                  child: Center(
                    child: _selectedDate == null
                        ? const Text('Select Birthday')
                        : Text(
                            'Selected Date: ${_selectedDate!.toString()}',
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _signUp();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(33, 150, 243, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: isSigningUp
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _signInWithGoogle();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sign up with Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _selectImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _imageFile = pickedImage;
        });
      }
    } catch (e) {
      print('Error selecting image: $e');
      // Handle the error here, show a message, or perform necessary actions
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        String userId = userCredential.user!.uid; // Get the user's unique ID

        // Save user details to Firestore under 'users' collection
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'username': username,
          'email': email,
          'dob': _selectedDate.toString()
          // Other user details like birthday, profile image URL, etc., can be added here
        });

        if (_imageFile != null) {
          String userId = userCredential.user!.uid;
          Reference storageReference = FirebaseStorage.instance
              .ref()
              .child('user_images')
              .child('user_$userId.jpg');

          await storageReference.putFile(File(_imageFile!.path));
          // Get the download URL of the uploaded image
          String imageUrl = await storageReference.getDownloadURL();

          // Now you can save the imageUrl along with other user details in your database or perform necessary operations
          // For example, you might use Firebase Firestore or Firebase Realtime Database to store user data
          // Here, we're just printing the imageUrl
          print('Image URL: $imageUrl');
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({
            'image': imageUrl, // Add the image URL to the user document
          });

          // Show a success message
          showToast(message: "User is successfully created with image");
          Navigator.pushNamed(context, "/bus_booking_main_page");
        } else {
          showToast(message: "Please select an image");
        }
      }
    } catch (e) {
      showToast(message: "Error creating user: $e");
    }

    setState(() {
      isSigningUp = false;
    });
  }
}
