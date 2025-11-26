import 'package:flutter/material.dart';

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  const BuildOptions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.black54),
            SizedBox(width: 3),
            Text(
              title,
              style: TextStyle(
                fontFamily: "QuickMedium",
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      ],
    );
  }
}