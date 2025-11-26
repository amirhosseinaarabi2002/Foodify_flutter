import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:foodify/screens/cart_page.dart';
import 'package:page_transition/page_transition.dart';

class DetailPage extends StatefulWidget {
  final String foodId; // <-- change to String
  const DetailPage({super.key, required this.foodId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Center(child: Image.asset("assets/images/success.png")),

          content: Text(
            "The item has been added to your basket successfully.",
            style: TextStyle(
              color: Constants.primaryColor.withOpacity(0.8),
              fontFamily: "QuickBold",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: TextStyle(
                  fontFamily: "QuickBold",
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: TextStyle(
                              fontSize: 30,
                              color: Constants.primaryColor,
                              fontFamily: "QuickBold",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            r"$" + food.price.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                              fontFamily: "QuickBold",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            food.score,
                            style: TextStyle(
                              fontSize: 23,
                              color: Constants.primaryColor,
                              fontFamily: "QuickBold",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    food.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: "QuickMedium",
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1.1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: InkResponse(
                  onTap: () {
                    setState(() {
                      bool isSelected = toggleIsSelected(food.isSelected);

                      food.isSelected = isSelected;
                    });

                    showSuccessDialog();
                  },
                  child: Center(
                    child: Text(
                      "Add To Basket",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "QuickBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   PageTransition(
                //     type: PageTransitionType.scale,
                //     child: CartPage(addedToCartFoods: Food.sampleFoods),
                //   ),
                // );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1.1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ),
          ],
        ),
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
