import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images-workbench.99static.com/49sz9cRILfJeKRgtezbtD7g_1JY=/99designs-contests-attachments/48/48941/attachment_48941398'),
        ),
      ]),
    );
  }
}
