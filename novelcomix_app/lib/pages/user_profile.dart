import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../design/background_image.dart';
import '../widgets/textfieldWidget.dart';
import 'login_page.dart';

class UserProfile extends StatefulWidget {
  static String routeName = '/UserProfile';

  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _fullnameTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();

  late String _fullname = '';
  late String _username = '';
  late String _email = '';
  late String _gender = '';
  late String _selectedGender = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign out function
  Future<void> signOut() async {
    await _auth.signOut();
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  // Fetch user data from Firestore
  Future fetchUserData() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        final userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: uid)
            .limit(1)
            .get();
        if (userSnapshot.docs.isNotEmpty) {
          final userData = userSnapshot.docs.first.data();
          setState(() {
            _fullname = userData['fullname'] ?? '';
            _username = userData['username'] ?? '';
            _email = userData['email'] ?? '';
            _gender = userData['gender'] ?? '';
            _selectedGender = _gender;
            _fullnameTextController.text = _fullname;
            _usernameTextController.text = _username;
          });
        }
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  // Update user data
  Future<void> updateUserData() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        final userQuerySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: uid)
            .limit(1)
            .get();

        if (userQuerySnapshot.docs.isNotEmpty) {
          final userDoc = userQuerySnapshot.docs.first;
          final userRef =
              FirebaseFirestore.instance.collection('users').doc(userDoc.id);

          await userRef.update({
            'fullname': _fullnameTextController.text,
            'username': _usernameTextController.text,
            'gender': _selectedGender,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User data updated successfully :D')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User not found, WHO ARE YOU???')),
          );
        }
      }
    } catch (error) {
      print('Error updating user data: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update user data :(')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: forTextField(
                      "Full Name",
                      Icons.drive_file_rename_outline_sharp,
                      false,
                      _fullnameTextController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: forTextField(
                      "Username",
                      Icons.person,
                      false,
                      _usernameTextController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: forReadTextField(
                      "Email",
                      Icons.email,
                      false,
                      true,
                      _email,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (_gender == '')
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              const Text('Male'),
                              Radio<String>(
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              const Text('Female'),
                            ],
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      child: forReadTextField(
                        "Gender",
                        Icons.transgender,
                        false,
                        true,
                        _gender,
                      ),
                    ),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 45,
                    width: 250,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF731942),
                      ),
                      onPressed: () {
                        updateUserData();
                      },
                      icon: const Icon(
                        Icons.system_update_alt,
                      ),
                      label: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
