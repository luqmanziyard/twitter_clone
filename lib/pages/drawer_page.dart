import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:twitter_clone/screens/login_screen.dart';
import 'package:twitter_clone/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    @required this.width,
    @required this.height,
  });

  final double width;
  final double height;

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: widget.width,
            height: widget.height * 0.29,
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 27,
                  backgroundColor: kLightBlue,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Mark Zuck',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '@zuck',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '7',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'following',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'followers',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                )
              ],
            ),
            color: kDarkBlue,
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: kDarkBlue,
              child: ListView(
                children: <Widget>[
                  DrawerItem(
                    title: 'profile ',
                    icon: Icons.person,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.list,
                    title: 'List',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.flash_on,
                    title: 'Topics',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.bookmark,
                    title: 'Bookmarks',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.flash_on,
                    title: 'Moments',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.people,
                    title: 'Follow requests',
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'Settings and Privacy',
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'Sign out',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({this.title, this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(
          icon,
          color: kGrey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
