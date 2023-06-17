import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/design/widgets.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/widgets/textfieldWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
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
                              child: forTextField(
                                  "Display Name",
                                  Icons.person_2,
                                  false,
                                  _displaynameTextController),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                child: forReadTextField(
                                    "Username", Icons.person_2, false, email)),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: forTextField("Email", Icons.email, false,
                                  _emailTextController),
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
