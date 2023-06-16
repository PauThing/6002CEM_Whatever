import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/design/widgets.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/widgets/bottom_navigation_bar.dart';
import 'package:novelcomix_app/widgets/textfieldWidget.dart';

class UserProfile extends StatefulWidget {
  static String routeName = '/UserProfile';
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _fullnameTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.only(top: 60, left: 30, right: 30,),
                        child: Column(
                          children: [
                            Container(
                              child: forTextField("Full Name", Icons.person_2,
                                  false, _fullnameTextController),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: forTextField("Username", Icons.person,
                                  false, _usernameTextController),
                            ),
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
                                onPressed: () {
                                  // FirebaseAuth.instance
                                  //     .createUserWithEmailAndPassword(
                                  //         email: _emailTextController.text,
                                  //         password: _passwordTextController.text)
                                  //     .then((value) {
                                  //   final snackbar = SnackBar(
                                  //     content: const Text("Yay, Account Created!"),
                                  //     action: SnackBarAction(
                                  //         label: 'OK', onPressed: () {}),
                                  //   );
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(snackbar);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                  // }).onError((error, stackTrace) {
                                  //   print("Error ${error.toString()}");
                                  // });
                                },
                                icon: Icon(
                                  Icons.check_circle,
                                ),
                                label: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  LoginPage.routeName,
                                );
                              },
                              child: Text(
                                "Already have an account? Click here.",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline,
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
