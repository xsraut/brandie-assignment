import 'package:brandie_assignment/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget on top-left containing avatar , "Ready to share" text and other texts

class AvatarSection extends StatelessWidget {
  const AvatarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User profile pic
        ProfilePicture(),

        gapW8,
        //Ready to share
        SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ReadyToShareWidget(), SubtitleTextWidget()],
          ),
        )
      ],
    );
  }
}

//Profile Picture
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(
            'assets/images/userProfilePic.png'), // Replace with user's profile image
      ),
    );
  }
}

// Ready to share
class ReadyToShareWidget extends StatelessWidget {
  const ReadyToShareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/images/grdaient.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(104, 52, 172, 1), BlendMode.dstATop)),
      ),
      child: RichText(
        text: TextSpan(children: [
          WidgetSpan(
            child: SvgPicture.asset(
              'assets/icons/stars.svg',
            ),
          ),
          TextSpan(
            text: ' Ready to share',
            style:
                GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}

// Subtite
class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Text(
        'High-Converting in Oriflame Community',
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 10),
      ),
    );
  }
}
