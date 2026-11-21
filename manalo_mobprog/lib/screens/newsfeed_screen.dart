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
          userName: 'Andrea Santos',
          postContent: 'Kamusta! First week of the new term, let\'s go.',
          numOfLikes: 100,
          date: 'October 11',
          avatarPath: 'assets/images/avatar_andrea.jpg',
        ),
        // Post with an image and a user photo
        NewsFeedCard(
          userName: 'Miguel Reyes',
          postContent: 'Finally saw the fjords in person. Worth every hour of travel.',
          numOfLikes: 200,
          hasImage: true,
          imagePath: 'assets/images/post_fjord.jpg',
          date: 'November 2',
          avatarPath: 'assets/images/avatar_miguel.jpg',
        ),
        NewsFeedCard(
          userName: 'Paolo Cruz',
          postContent: 'Study session fuel for finals week.',
          numOfLikes: 85,
          hasImage: true,
          imagePath: 'assets/images/post_coffee.jpg',
          date: 'November 15',
          avatarPath: 'assets/images/avatar_paolo.jpg',
        ),
        // No avatar -> initials; hasImage is true but no file -> Placeholder
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
