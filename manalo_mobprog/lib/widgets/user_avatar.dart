import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

/// Enhancement 2: profile picture widget.
/// Shows the user's photo when [imagePath] is given; otherwise falls back
/// to a colored circle with the user's initials.
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.userName,
    this.imagePath,
    this.radius = 20,
  });

  final String userName;
  final String? imagePath;
  final double radius;

  String get _initials {
    final parts = userName.trim().split(RegExp(r'\s+'));
    return parts.take(2).map((p) => p[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final r = ScreenUtil().setSp(radius);
    return CircleAvatar(
      radius: r,
      backgroundColor: FB_LIGHT_PRIMARY,
      foregroundImage: imagePath != null ? AssetImage(imagePath!) : null,
      child: Text(
        _initials,
        style: TextStyle(
          color: FB_DARK_PRIMARY,
          fontWeight: FontWeight.bold,
          fontSize: r * 0.8,
        ),
      ),
    );
  }
}
