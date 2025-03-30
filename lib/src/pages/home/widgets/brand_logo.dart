import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// The Oriflame logo widget at the top of homepage
class BrandLogo extends StatelessWidget {
  const BrandLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 120.w,
        vertical: 20.h,
      ),
      child: Image.asset('assets/icons/oriflame-logo.png',
          height: 50), // Replace with your app logo
    );
  }
}
