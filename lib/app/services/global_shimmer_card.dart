import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 50,
                    height: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
