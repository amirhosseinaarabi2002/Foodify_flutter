import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:foodify/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: size.height,
        child: Column(
          children: [
            Center(
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(0.5),
                    width: 5,
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage("assets/images/avatar.png"),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(
                  height: 20,
                  child: Image.asset("assets/images/Medal.png"),
                ),
                SizedBox(width: 3),
                Text(
                  "Amirhossein",
                  style: TextStyle(fontFamily: "QuickMedium", fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "amiraarabisw2002@gmail.com",
              style: TextStyle(
                fontFamily: "QuickMedium",
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            // end profile
            SizedBox(height: 60),

            Column(
              children: [
                BuildOptions(icon: Icons.person, title: 'My Profile'),
                SizedBox(height: 50),
                BuildOptions(icon: Icons.settings, title: 'Setting'),
                SizedBox(height: 50),
                BuildOptions(icon: Icons.notifications, title: 'Notifications'),
                SizedBox(height: 50),
                BuildOptions(icon: Icons.share, title: 'Share'),
                SizedBox(height: 50),
                BuildOptions(icon: Icons.logout, title: 'LogOut'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
