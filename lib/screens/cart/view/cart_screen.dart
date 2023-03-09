import 'package:flutter/material.dart';
import 'package:watchlux/core/constant.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(backgroundColor: kBackgroundclr,
      appBar: AppBar(backgroundColor: kBackgroundclr,elevation: 0,),
      body: Center(child: Text('Cart Screen'),),);
  }
}
