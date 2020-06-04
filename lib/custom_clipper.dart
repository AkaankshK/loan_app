
import 'package:flutter/material.dart';

class MyCustomClipPath extends CustomClipper<Path> {

//  var radius = 10.0;
  @override
  Path getClip(Size size) {
//    size = size / 2;
    final double startMargin = size.width / 5;
    final double x = size.width;
    final double y = size.height;
    final Path path = Path()

      ..lineTo(startMargin, 0)

      ..quadraticBezierTo(0, (y-60)/2, startMargin, y/2 + 30)
//    ..arcToPoint(Offset(0, y-8), radius: Radius.elliptical(100, 70))
      ..arcToPoint(Offset(0, y), radius: Radius.elliptical(100, 70))
      ..arcToPoint(Offset(startMargin, y), radius: Radius.zero)

      ..lineTo(x - startMargin, y)
//      ..quadraticBezierTo(x-startMargin, y, x, y/2)
      ..quadraticBezierTo(x, y/2, x - startMargin, 0)
//      ..lineTo(x - startMargin, 0)

      ..close();

    //    print('S1:$s1 SH:${size.height / 2} S2:$s2');
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;


}