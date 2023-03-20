import 'package:flutter/material.dart';
import 'package:watchlux/core/constant.dart';

class CategoryMainScreen extends StatelessWidget {
  const CategoryMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                child: Image.network(
                    'https://cdn.dribbble.com/users/3480894/screenshots/17745481/boat-01_4x.png'),
                radius: 30,
                backgroundColor: kWhitecolor,
              ),
              title: Text("List item $index"));
        },
      ),
    );
  }
}
