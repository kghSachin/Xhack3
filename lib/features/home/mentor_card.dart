
import 'package:flutter/material.dart';
import 'package:frontend/features/home/home_page.dart';

import '../chat/constants.dart';

class MentorCard extends StatelessWidget {
  const MentorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(
            16,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      16,
                    )),
                padding: EdgeInsets.all(4),
                child: const CachedNetworkImageWrapper(
                  imageUrl:
                      "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
                  height: 80,
                  width: 80,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(
                      16,
                    )),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sudip Adhikari",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Computer Teacher",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            height: 1.45,
                            color: Theme.of(context)
                                .indicatorColor
                                .withOpacity(0.8),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 20,
                            color: index < 4
                                ? Colors.amber
                                : Colors.grey,
                          );
                        })
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 220,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              "I am Sudip adhikari, a computer teacher, I have been teaching for more than 10 years. I have taught in many schools and colleges in India and abroad. I am a certified teacher and have been teaching for over 10 years. I have taught in many schools and colleges in India and abroad. I am a certified teacher and have been teaching for over 10 years.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
          MaterialButton(
            minWidth: 200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            color: Theme.of(context).cardColor,
            padding: EdgeInsets.all(8),
            child: const Text(
              "View Profile",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}