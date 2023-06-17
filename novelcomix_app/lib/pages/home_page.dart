import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:novelcomix_app/models/novel_model.dart';
import 'package:novelcomix_app/pages/bookmark_page.dart';
import 'package:novelcomix_app/pages/comic_list_page.dart';
import 'package:novelcomix_app/pages/comic_page.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/pages/novel_page.dart';
import 'package:novelcomix_app/pages/user_profile.dart';
import 'package:novelcomix_app/design/widgets.dart';
import 'package:novelcomix_app/widgets/bottom_navigation_bar.dart';
import 'package:novelcomix_app/data/comic.dart';
import 'package:novelcomix_app/data/novel.dart';

class HomePage extends StatefulWidget {
  final List<ComicModel> comicList;
  final List<NovelModel> novelList;

  static String routeName = '/HomePage';

  const HomePage({Key? key, required this.comicList, required this.novelList}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List screens = [Home(), BookmarkPage(), ComicPage(), NovelPage()];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onClicked: onClicked,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false, //disable back button
        title: Text(
          "NovelComix",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(UserProfile.routeName);
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("You are about to log out!"),
                            content: Text(
                                "Are you sure you want to proceed to Log In Page?"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  signOut();
                                },
                              )
                            ],
                          );
                        });
                  },
                  child: Icon(
                    Icons.logout,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: screens.elementAt(selectedIndex),
      ),
    );
  }
}

//Home
class Home extends StatelessWidget {
  final ongoingComics = comicList.where((comic) => comic.status == 'Ongoing').toList();
  final ongoingNovels = novelList.where((novel) => novel.status == 'Ongoing').toList();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Ongoing Comics",
                      style: homepageText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 330,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ongoingComics.length,
                      itemBuilder: (context, index) {
                        ComicModel comic = ongoingComics[index];
                        return Container(
                          width: 210,
                          child: ListTile(
                            title: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: 2/3,
                                    child: Image.network(
                                        comic.imageUrl,
                                        fit: BoxFit.cover,
                                    ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  comic.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Ongoing Novels",
                      style: homepageText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 330,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ongoingNovels.length,
                      itemBuilder: (context, index) {
                        NovelModel novel = ongoingNovels[index];
                        return Container(
                          width: 210,
                          child: ListTile(
                            title: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 2/3,
                                  child: Image.network(
                                    novel.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  novel.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
