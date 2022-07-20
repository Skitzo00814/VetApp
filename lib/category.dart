import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String categoryName;

  Category({
    super.key,
    required this.categoryName,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[100],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
