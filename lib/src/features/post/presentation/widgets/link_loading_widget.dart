import 'package:brandie_assignment/src/features/post/providers/post_share_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// Shareable link generation dialog
class LinkGenerationAlertDialog extends ConsumerStatefulWidget {
  const LinkGenerationAlertDialog({
    super.key,
  });

  @override
  ConsumerState<LinkGenerationAlertDialog> createState() =>
      _LinkGenerationAlertDialogState();
}

class _LinkGenerationAlertDialogState
    extends ConsumerState<LinkGenerationAlertDialog> {
  String statusText = 'Generating your sales link..';

  void setStatusText(double value) {
    if (value > 0.75) {
      statusText = 'Preparing the content for social media';
      return;
    }
    if (value > 0.5) {
      statusText = 'Saving the content to your profile';
      return;
    }
    if (value > 0.25) {
      statusText = 'Copying the caption to clipboard';
      return;
    }
  }

  Future<void> _launchUrl() async {
    final url = ref.read(sharePostServiceNotifierProvider);
    final _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsPadding: EdgeInsets.all(0),
      actions: [
        TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 10),
            onEnd: () async {
              context.pop();
              await _launchUrl();
            },
            builder: (context, value, _) {
              setStatusText(value);
              return DialogContents(
                statusText: statusText,
                value: value,
              );
            })
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}

// Icon, Status and Progress bar for the AlertDialog
class DialogContents extends StatelessWidget {
  const DialogContents({
    super.key,
    required this.statusText,
    required this.value,
  });

  final String statusText;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          // Icon
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('assets/icons/oriflame-logo-loading.png'),
              ),
            ),
          ),

          // Status
          Text(
            statusText,
            maxLines: 1,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(177, 177, 177, 1),
            ),
          ),

          // Progress Indicator
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 15,
              backgroundColor: Color.fromRGBO(238, 243, 240, 1),
              color: Color.fromRGBO(157, 217, 189, 1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
