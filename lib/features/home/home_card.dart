import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCard extends ConsumerWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            "Explaining Pythagoras theorem in simple words",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                  color: Theme.of(context).indicatorColor,
                ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("3 min read",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Theme.of(context)
                                .indicatorColor
                                .withOpacity(0.6),
                          )),
                  Text("By: John Doe",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Theme.of(context)
                                .indicatorColor
                                .withOpacity(0.6),
                          )),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Published on: ${DateTime.now().toString().substring(0, 10)}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color:
                              Theme.of(context).indicatorColor.withOpacity(0.6),
                        ),
                  ),
                  Text(
                    "Wednesday, 12:00 PM",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color:
                              Theme.of(context).indicatorColor.withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            """Pythagoras theorem is a mathematical theorem in Euclidean geometry. It states that in a right triangle, the square of the length of the hypotenuse (the side opposite the right angle) is equal to the sum of the squares of the lengths of the other two sides. It is named after the ancient Greek mathematician Pythagoras, who discovered and proved the theorem.""",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                  height: 1.45,
                  color: Theme.of(context).indicatorColor.withOpacity(0.8),
                ),
            maxLines: 4,
            overflow: TextOverflow.fade,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "read more...",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    height: 1.45,
                    color: Theme.of(context).indicatorColor.withOpacity(0.5),
                  ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 280,
                imageUrl:
                    "https://th.bing.com/th/id/R.ba01d095b9f9a650e61d8f49d2b28519?rik=rVVFOj18ozgpZw&riu=http%3a%2f%2fwww.pixelstalk.net%2fwp-content%2fuploads%2f2016%2f05%2fMath-Mathematics-Formula-Wallpaper-for-PC.jpg&ehk=%2bfTho6j8Ym8wGaYhOjf%2bGXs56O7AyL38fNlEbHjIzqQ%3d&risl=&pid=ImgRaw&r=0",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200]),
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/navbar/bookmark.svg",
                height: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).indicatorColor,
                  BlendMode.srcATop,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
