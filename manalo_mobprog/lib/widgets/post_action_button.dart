import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

/// Enhancement 3: one reusable widget for every action under a post
/// (Like, Comment, Share) instead of repeating TextButton.icon three times.
class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? FB_PRIMARY : Colors.grey.shade700;
    return Expanded(
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: ScreenUtil().setSp(18)),
        label: CustomText(
          text: label,
          fontSize: ScreenUtil().setSp(12),
          color: color,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

/// Like button that keeps its own liked/unliked state and like count.
class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.initialLikes});

  final int initialLikes;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _liked = false;

  void _toggle() => setState(() => _liked = !_liked);

  @override
  Widget build(BuildContext context) {
    final count = widget.initialLikes + (_liked ? 1 : 0);
    return PostActionButton(
      icon: _liked ? Icons.thumb_up : Icons.thumb_up_outlined,
      label: 'Like · $count',
      isActive: _liked,
      onPressed: _toggle,
    );
  }
}
