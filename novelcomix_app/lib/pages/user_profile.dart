import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/design/widgets.dart';
import 'package:novelcomix_app/widgets/textfieldWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_page.dart';

class UserProfile extends StatefulWidget {
  static String routeName = '/UserProfile';

  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _displaynameTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _uid = '';
  String _useremail = '';
  String _username = '';

  //signout function
  signOut() async {
    await _auth.signOut();
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  void getUserDetail() async {
    User? user = _auth.currentUser;
    if (user != null) {
      _uid = user.uid;
      final DocumentSnapshot<Map<String, dynamic>> userDetail =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();

      setState(() {
        _username = userDetail.get('username');
        _useremail = userDetail.get('email');

        _usernameTextController.text = _username;
        _emailTextController.text = _useremail;
      });
    } else {
      signOut();
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 30,
                          right: 30,
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: forTextField("Full Name", Icons.person_2,
                                  false, _displaynameTextController),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: _username,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              controller: _usernameController,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: forReadTextField(
                                  "Email", Icons.email, false, _useremail),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: forTextField("Password", Icons.lock, true,
                                  _passwordTextController),
                            ),

                            SizedBox(
                              height: 80,
                            ),

                            //Sign Up Button
                            Container(
                              height: 45,
                              width: 250,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF731942)),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.security_update_good,
                                ),
                                label: Text(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
