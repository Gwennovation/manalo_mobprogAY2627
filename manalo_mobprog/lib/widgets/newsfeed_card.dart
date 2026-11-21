import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';
import 'post_action_button.dart';
import 'user_avatar.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imagePath; // Enhancement 1: the post's image (optional)
  final String? avatarPath; // Enhancement 2: the user's photo (optional)

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imagePath,
    this.avatarPath,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: avatar, name, date
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserAvatar(userName: userName, imagePath: avatarPath),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),

            // Post content
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),

            // Enhancement 1: only build the image area when the post has one
            if (hasImage) _PostImage(imagePath: imagePath),

            // Enhancement 3: widget-based action buttons
            Row(
              children: [
                LikeButton(initialLikes: numOfLikes),
                PostActionButton(
                  icon: Icons.mode_comment_outlined,
                  label: 'Comment',
                  onPressed: () {},
                ),
                PostActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(height: 1),
            SizedBox(height: ScreenUtil().setHeight(8)),

            // Write a comment
            Row(
              children: [
                const UserAvatar(userName: 'Gwyneth Manalo', radius: 15),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(12),
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(30),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(15)),
                      ),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: FB_DARK_PRIMARY,
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the post image, or a Placeholder if no path was given
/// or the file fails to load.
class _PostImage extends StatelessWidget {
  const _PostImage({this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().setHeight(220);
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
        child: imagePath == null
            ? SizedBox(height: height, child: const Placeholder())
            : Image.asset(
                imagePath!,
                height: height,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    SizedBox(height: height, child: const Placeholder()),
              ),
      ),
    );
  }
}
