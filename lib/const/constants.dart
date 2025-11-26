import 'package:flutter/material.dart';

class Food {
  final String id;
  final String title;
  final String image;
  final double price;
  final String type;
  bool isFavorited;
  final String description;
  final String size;
  final String tag;
  final String score;
  bool isSelected;

  Food({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.type,
    required this.isFavorited,
    required this.description,
    required this.size,
    required this.tag,
    required this.score,
    required this.isSelected,
  });

  static final List<String> types = [
    "Recommended",
    "Most Popular",
    "Specials",
    "High Demand",
    "Limited",
  ];

  // --- STATIC TEST DATA ---
  static final List<Food> sampleFoods = [
    Food(
      id: "1",
      title: "Cheese Burger",
      image: "assets/images/hamburger.png",
      price: 8.99,
      type: "Recommended",
      isFavorited: true,
      description:
          "A juicy burger with melted cheese, fresh lettuce, and soft buns.",
      size: "Medium",
      tag: "Special",
      score: '3.0',
      isSelected: false,
    ),
    Food(
      id: "2",
      title: "Pepperoni Pizza",
      image: "assets/images/pizza.png",
      price: 12.50,
      type: "Most Popular",
      isFavorited: false,
      description:
          "Cheesy pizza topped with crispy pepperoni and rich tomato sauce.",
      size: "Large",
      tag: "Hot",
      score: '3.5',
      isSelected: false,
    ),
    Food(
      id: "3",
      title: "Fried Chicken",
      image: "assets/images/chicken.png",
      price: 15.99,
      type: "High Demand",
      isFavorited: false,
      description:
          "Crispy fried chicken with signature spices and golden crust.",
      size: "Medium",
      tag: "Chef’s Choice",
      score: '4.0',
      isSelected: false,
    ),
    Food(
      id: "4",
      title: "Spicy Tacos",
      image: "assets/images/groupBeef.png",
      price: 9.49,
      type: "Specials",
      isFavorited: false,
      description:
          "Spicy tacos filled with seasoned beef, fresh veggies, and sauce.",
      size: "Small",
      tag: "New",
      score: '4.5',
      isSelected: false,
    ),
    Food(
      id: "5",
      title: "Double Beef",
      image: "assets/images/buritto.png",
      price: 11.20,
      type: "Limited",
      isFavorited: false,
      description:
          "Big double-layer beef burger packed with flavor and freshness.",
      size: "Large",
      tag: "Limited Offer",
      score: '2.5',
      isSelected: false,
    ),
  ];

  // ---- FIXED STATIC METHODS ----
  static List<Food> getFavoritedFoods() {
    return sampleFoods.where((food) => food.isFavorited).toList();
  }

  static List<Food> getSelectedFoods() {
    return sampleFoods.where((food) => food.isSelected).toList();
  }
}

class Constants {
  static Color primaryColor = const Color(0xFFFE8C00);
  static String titleOne = "Discover Deliciousness";
  static String descOne =
      "Explore thousands of mouth-watering recipes and food ideas tailored just for you.";
  static String titleTwo = "Cook Smarter, Not Harder";
  static String descTwo =
      "Get step-by-step guidance, smart timers, and tips that make cooking easier than ever.";
  static String titleThree = "Your Kitchen, Upgraded";
  static String descThree =
      "Save favorite recipes, track ingredients, and plan meals effortlessly with Foodify.";
}
