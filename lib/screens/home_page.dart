import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 10,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 25),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontFamily: "QuickBold"),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: _pageController,
            children: [
              CreatePage(
                image: "assets/images/burger-one.png",
                title: Constants.titleOne,
                desc: Constants.descOne,
              ),
              CreatePage(
                image: "assets/images/burger-two.png",
                title: Constants.titleTwo,
                desc: Constants.descTwo,
              ),
              CreatePage(
                image: "assets/images/buritto.png",
                title: Constants.titleThree,
                desc: Constants.descThree,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(children: _buildIndicator()),
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String desc;

  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250, child: Image.asset(image)),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontFamily: "QuickBold",
              fontSize: 20,
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            desc,
            style: TextStyle(fontFamily: "QuickRegular", fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
