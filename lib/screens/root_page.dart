import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:foodify/screens/cart_page.dart';
import 'package:foodify/screens/favorite_page.dart';
import 'package:foodify/screens/menu_page.dart';
import 'package:foodify/screens/profile_page.dart';
import 'package:foodify/screens/scan_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;

  List<Food> favorites = [];
  List<Food> myCart = [];

  List<Widget> get pages => [
        MenuPage(),
        FavoritePage(favoritedFoods: favorites),
        CartPage(addedToCartFoods: myCart),
        ProfilePage(),
      ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titles = ["Home", "Favorites", "Basket", "Profile"];

  void refreshLists() {
    favorites = Food.getFavoritedFoods();
    myCart = Food.getSelectedFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titles[bottomIndex],
                style: TextStyle(
                    color: Colors.grey, fontFamily: "QuickBold"),
              ),
              Icon(Icons.notifications, color: Colors.grey),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: ScanPage(),
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        shape: CircleBorder(),
        child: Image.asset("assets/images/Scan.png", height: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
            refreshLists();
          });
        },
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.grey,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
      ),
    );
  }
}
