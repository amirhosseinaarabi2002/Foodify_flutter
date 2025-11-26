import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:foodify/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';

class NewFoodWidget extends StatelessWidget {
  final List<Food> _foodList;
  final int index;
  const NewFoodWidget({
    super.key,
    required List<Food> foodList,
    required this.index,
  }) : _foodList = foodList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        height: 70,
        width: size.width,
        margin: EdgeInsets.only(bottom: 10, top: 10),
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Constants.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Constants.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(_foodList[index].image),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _foodList[index].type,
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "QuickSemiBold",
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        _foodList[index].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "QuickSemiBold",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              r"$" + _foodList[index].price.toString(),
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 16,
                fontFamily: "QuickMedium",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
