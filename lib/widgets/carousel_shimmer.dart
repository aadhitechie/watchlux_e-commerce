import 'package:flutter/material.dart';
import 'package:watchlux/widgets/shimmer.dart';

import '../core/constant.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        SizedBox(
          width: double.infinity,
          child: ShimmerWidget.rectangle(height: 150, width: double.infinity),
        ),
        kHeight10,
      ],
    );
  }
}
