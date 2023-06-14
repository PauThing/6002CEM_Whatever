import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/design/widgets.dart';
import 'package:novelcomix_app/widgets/bottom_navigation_bar.dart';

class UserProfile extends StatefulWidget {
  static String routeName = '/UserProfile';
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
        ),
      ],
    );
  }
}
