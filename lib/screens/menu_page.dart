import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0;

  final List<String> _types = [
    "|Recommended |",
    "|Most Popular |",
    "|Specials |",
    "|High Demand |",
    "|Limited |",
  ];
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
          ],
        ),
      ),
    );
  }
}
