import 'package:brandie_assignment/src/features/post/domain/post_model.dart';
import 'package:brandie_assignment/src/features/post/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Page to edit caption when clicked on caption
class EditCaptionPage extends ConsumerStatefulWidget {
  const EditCaptionPage({required this.post, super.key});
  final Post post;
  @override
  ConsumerState<EditCaptionPage> createState() => _EditCaptionPageState();
}

class _EditCaptionPageState extends ConsumerState<EditCaptionPage> {
  final _captionController = TextEditingController();

  // bool to check if caption is changed
  bool isCaptionChanged = false;

  @override
  void initState() {
    super.initState();
    _captionController.text = widget.post.caption;
  }

  @override
  void dispose() {
    super.dispose();
    _captionController.dispose();
  }

  void _savePost() {
    if (!isCaptionChanged) return;
    ref
        .read(postNotifierPorvider.notifier)
        .updatePost(widget.post.postId, _captionController.text);
    context.pop();
  }

  // Sets isCaptionChanged bool true if caption is changed
  void onCaptionChanged(_) {
    setState(() {
      isCaptionChanged = widget.post.caption != _captionController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Caption',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // close button
        leading: GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: Icon(
            Icons.close_sharp,
          ),
        ),
        actions: [
          // Save Button
          GestureDetector(
            onTap: _savePost,
            child: Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isCaptionChanged
                    ? Color.fromRGBO(115, 191, 152, 0.9)
                    : Color.fromRGBO(126, 192, 134, 0.2),
              ),
              child: Text(
                'Save',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: _captionController,
          onChanged: onCaptionChanged,
          maxLines: null,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
