import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  String categoryName ;
  CategoryItem({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Color(0xFFB5B4B4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(categoryName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFB5B4B4)),),
        ],
      ),
    );
  }

}