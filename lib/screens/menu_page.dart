import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:foodify/screens/detail_page.dart';
import 'package:foodify/widget/food_widget.dart';
import 'package:page_transition/page_transition.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0;

  bool toggleIsFavorite(bool isFavorited) {
    return !isFavorited;
  }

  final List<String> _types = [
    "| Recommended |",
    "| Most Popular |",
    "| Specials |",
    "| High Demand |",
    "| Limited |",
  ];

  final List<Food> _foodList = Food.sampleFoods;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search
            SizedBox(height: 20),
            Center(
              child: Container(
                width: size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Constants.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Constants.primaryColor,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: "QuickMedium",
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.mic, color: Colors.grey),
                  ],
                ),
              ),
            ),
            // Category
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 70,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _types[index],
                        style: TextStyle(
                          fontFamily: "QuickMedium",
                          fontSize: 16,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _types.length,
              ),
            ),

            // menu list
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: DetailPage(foodId: _foodList[index].id),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // ignore: deprecated_member_use
                        color: Constants.primaryColor.withOpacity(0.8),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 20,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorite(
                                      (_foodList[index].isFavorited),
                                    );

                                    _foodList[index].isFavorited = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  _foodList[index].isFavorited == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Constants.primaryColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_foodList[index].image),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _foodList[index].type,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: "QuickSemiBold",
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  _foodList[index].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "QuickSemiBold",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 15,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r"$" + _foodList[index].price.toString(),
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                  fontFamily: "QuickMedium",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _foodList.length,
              ),
            ),

            //new collections
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
              child: Text(
                "New Foodify",
                style: TextStyle(
                  fontFamily: "QuickBold",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              height: size.height * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewFoodWidget(foodList: _foodList, index: index);
                },
                itemCount: _foodList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
