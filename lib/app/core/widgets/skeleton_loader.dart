import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  final double height;
  final double width;

  const SkeletonLoader(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800],
      highlightColor: Colors.grey[700],
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}