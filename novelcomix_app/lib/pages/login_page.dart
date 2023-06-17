import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/pages/home_page.dart';
import 'package:novelcomix_app/pages/signup_page.dart';
import 'package:novelcomix_app/widgets/textfieldWidget.dart';
import 'package:novelcomix_app/design/widgets.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 200,
                    child: Center(
                      child: Text(
                        'NovelComix',
                        style: signinTitle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        child: forTextField(
                            "Email", Icons.email, false, _emailTextController),
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

                      //Login Button
                      Container(
                        height: 45,
                        width: 250,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF731942)),
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(comicList: [], novelList: [],)));
                            }).onError((error, stackTrace) {
                              final snackbar = SnackBar(
                                content: const Text("Sorry, Invalid Email or Password.."),
                                action: SnackBarAction(label: 'OK', onPressed: (){}),);
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            });
                          },
                          icon: Icon(
                            Icons.login,
                          ),
                          label: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ), //Need to add button
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            label: const Text("Sign Up Here"),
            backgroundColor: Color(0xFF731942),
            icon: const Icon(
              Icons.app_registration,
            ),
          ),
        ),
      ],
    );
  }
}
