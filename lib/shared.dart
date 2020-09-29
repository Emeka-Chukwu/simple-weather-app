import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClipHere extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 75);
    var controllPoint = Offset(size.width, size.height / 2);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 95);
    var controlPath = Offset(size.width / 2, size.height);
    var endPath = Offset(size.width, size.height / 6);
    path.quadraticBezierTo(
        controlPath.dx, controlPath.dy, endPath.dx, endPath.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

const textInputDecorations = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green,
      width: 2.0,
    ),
  ),
);

var fonts = GoogleFonts.amaticSc(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  fontStyle: FontStyle.italic,
);
