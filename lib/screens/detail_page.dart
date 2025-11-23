import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';

class DetailPage extends StatefulWidget {
  final String foodId; // <-- change to String
  const DetailPage({super.key, required this.foodId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Food> foodList = Food.sampleFoods;

    final food = foodList.firstWhere((e) => e.id == widget.foodId);

    return Scaffold(
      body: Stack(
        children: [
          //appbar
          Positioned(
            right: 20,
            left: 20,
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(Icons.close, color: Constants.primaryColor),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    food.isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 100,
            left: 10,
            right: 0,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  //image
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 425,
                      width: 225,
                      child: Image.asset(food.image),
                    ),
                  ),
                  //features
                  Positioned(
                    top: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        FoodFeature(title: "Size", foodFeature: food.size),
                        SizedBox(height: 30),
                        FoodFeature(title: "Tag", foodFeature: food.tag),
                        SizedBox(height: 30),
                        FoodFeature(title: "Type", foodFeature: food.type),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Icon(Icons.star), Text("score")],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("name"),
                          Text("price")
                        ],
                      ),
                    ],
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

class FoodFeature extends StatelessWidget {
  final String title;
  final String foodFeature;
  const FoodFeature({
    super.key,
    required this.title,
    required this.foodFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: "QuickBold",
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          foodFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontFamily: "QuickBold",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
