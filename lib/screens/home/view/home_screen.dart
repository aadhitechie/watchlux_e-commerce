import 'package:flutter/material.dart';

import '../../../widgets/home_carousel_screen.dart';
import '../../bottom nav/view/bottom_nav_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const CarouselScreen(),
        ],
      ),
    ));
  }
}
