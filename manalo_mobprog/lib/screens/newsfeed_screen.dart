import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Text-only post, user photo from assets
        NewsFeedCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
          avatarPath: 'assets/images/avatar_cyrus.png',
        ),
        // Post with an image, avatar falls back to initials
        NewsFeedCard(
          userName: 'Roben Juanatas',
          postContent: 'Kicking off the holiday season with ICpEP-NCR!',
          numOfLikes: 200,
          hasImage: true,
          imagePath: 'assets/images/post_holiday.png',
          date: 'December 2',
        ),
        // hasImage is true but no file given -> Placeholder widget
        NewsFeedCard(
          userName: 'Gwyneth Manalo',
          postContent: 'Photo coming soon!',
          numOfLikes: 12,
          hasImage: true,
          date: 'November 21',
        ),
      ],
    );
  }
}
