import 'package:flutter/material.dart';
class CategoryContainer extends StatelessWidget {
  final String title;
  const CategoryContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}
