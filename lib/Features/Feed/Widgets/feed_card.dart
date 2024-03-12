import 'package:flutter/material.dart';

import 'package:photography_flutter_firebase_fullstack_application/Core/Constants/pallete.dart';
import 'package:photography_flutter_firebase_fullstack_application/Features/Feed/Widgets/like_animation.dart';

class FeedCard extends StatelessWidget {
  final String description;
  final String image;
  final String username;
  final String postImage;
  const FeedCard(
      {super.key,
      required this.description,
      required this.image,
      required this.username,
      required this.postImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Pallete.bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Pallete.primaryTextColor,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      '30 sec ago',
                      style: TextStyle(
                        color: Pallete.secondaryTextColor,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Pallete.secondaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Image.network(
            fit: BoxFit.cover,
            postImage,
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              CustomLikeButton(
                onTap: () {},
              ),
              IconButton(
                onPressed: () {},
                icon: const Row(
                  children: [
                    Icon(
                      Icons.comment,
                      color: Pallete.secondaryTextColor,
                      size: 25,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '1 ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Sofia Pro",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(
            description,
            style: const TextStyle(
              color: Pallete.primaryTextColor,
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}