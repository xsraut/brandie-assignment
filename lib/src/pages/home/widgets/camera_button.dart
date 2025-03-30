import 'package:flutter/material.dart';

// Camera button placeholder widget
class CameraButton extends StatelessWidget {
  const CameraButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Open Camera
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(115, 191, 152, 0.9),
            borderRadius: BorderRadius.circular(360)),
        child: Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
