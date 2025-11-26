import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:foodify/widget/food_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Food> favoritedFoods;
  const FavoritePage({super.key, required this.favoritedFoods});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedFoods.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Image.asset("assets/images/empty-state.png"),
                  ),
                  Text(
                    "There Is Nothing Here",
                    style: TextStyle(
                      color: Constants.primaryColor.withOpacity(0.8),
                      fontFamily: "QuickBold",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              height: size.height,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewFoodWidget(
                    foodList: widget.favoritedFoods,
                    index: index,
                  );
                },
                itemCount: widget.favoritedFoods.length,
              ),
            ),
    );
  }
}
