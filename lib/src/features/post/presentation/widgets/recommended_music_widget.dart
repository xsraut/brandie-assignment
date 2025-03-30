import 'package:brandie_assignment/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PostRecommendedMusic extends StatelessWidget {
  const PostRecommendedMusic({
    super.key,
    required this.recommendedMusic,
  });

  final Map<String, String> recommendedMusic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(49, 49, 49, 0.39),
          borderRadius: BorderRadius.circular(8)),
      child: RichText(
        text: TextSpan(children: [
          WidgetSpan(
            child: SvgPicture.asset(
              'assets/icons/music.svg',
              width: 12,
            ),
          ),
          WidgetSpan(child: gapW8),
          TextSpan(
            children: [
              TextSpan(
                text: 'Recommended : ',
              ),
              TextSpan(
                text: recommendedMusic['music'] ?? 'song name',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: ' by ${recommendedMusic['artist'] ?? 'artist'}',
              )
            ],
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
          ),
        ]),
      ),
    );
  }
}
