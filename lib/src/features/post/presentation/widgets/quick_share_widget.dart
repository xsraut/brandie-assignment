import 'dart:ui';
import 'package:brandie_assignment/src/constants/app_sizes.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/link_loading_widget.dart';
import 'package:brandie_assignment/src/features/post/providers/current_post_provider.dart';
import 'package:brandie_assignment/src/features/post/providers/post_share_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// Quickshare to social media section
class QucikShareWidget extends StatelessWidget {
  const QucikShareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Quick share to:',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          gapW8,
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  SocialMediaIcon(platformName: 'instagram'),
                  SocialMediaStoryIcon(
                      platformName: 'instagram',
                      borderColor: Color.fromRGBO(255, 100, 238, 1)),
                  SocialMediaIcon(
                    platformName: 'facebook',
                  ),
                  SocialMediaStoryIcon(
                      platformName: 'facebook',
                      borderColor: Color.fromRGBO(117, 165, 255, 1)),
                  SocialMediaIcon(platformName: 'messenger'),
                  SocialMediaIcon(platformName: 'tik-tok'),
                  SocialMediaIcon(platformName: 'whatsapp'),
                  SocialMediaIcon(platformName: 'whatsapp-business'),
                  SocialMediaIcon(platformName: 'telegram'),
                  gapW16
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SocialMediaIcon extends ConsumerWidget {
  const SocialMediaIcon({
    required this.platformName,
    super.key,
  });

  final String platformName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final postId = ref.read(currentPostNotifierProvider).postId;

        ref
            .read(sharePostServiceNotifierProvider.notifier)
            .generateLink(postId, platformName);

        showGeneralDialog(
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: LinkGenerationAlertDialog(),
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(254, 254, 254, 0.25),
            borderRadius: BorderRadius.circular(50)),
        child: Image.asset(
          'assets/icons/socials/$platformName.png',
          // fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class SocialMediaStoryIcon extends StatelessWidget {
  const SocialMediaStoryIcon({
    required this.platformName,
    required this.borderColor,
    super.key,
  });

  final String platformName;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: LinkGenerationAlertDialog(),
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(254, 254, 254, 0.25),
                borderRadius: BorderRadius.circular(50)),
            child: Image.asset(
              'assets/icons/socials/$platformName.png',
              // fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
