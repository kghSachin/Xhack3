import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:frontend/features/chat/constants.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../maps/google_map.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const UserInfoContainer(),
                const SizedBox(
                  height: 24,
                ),
                NeomorphsSearchBar(controller: TextEditingController()),
                const SizedBox(
                  height: 24,
                ),
                CarouselWidget(),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Top Mentors",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CachedNetworkImageWrapper(
                              imageUrl:
                                  "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
                              height: 150,
                              width: 200,
                            ),
                            Text(
                              "Sudip Adhikari",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            children: [
              ...List.generate(5, (index) {
                return const FractionallySizedBox(
                  widthFactor: 0.95,
                  child: CachedNetworkImageWrapper(
                    imageUrl:
                        "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
                  ),
                );
              }),
            ],
          ),
          Positioned(
            bottom: 8,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 10,
                activeDotColor: Colors.orange,
                dotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NeomorphsSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;

  const NeomorphsSearchBar({
    super.key,
    required this.controller,
    this.hintText = "Search",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      debounceDuration: Duration(seconds: 1),
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.grey,
                )),
            fillColor: Colors.blueGrey.withOpacity(0.5),
            filled: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        );
      },
      itemBuilder: (context, value) {
        return ListTile(
          title: Text(value),
        );
      },
      onSelected: (value) {},
      suggestionsCallback: (search) {
        print(search);
        if (search.isEmpty) {
          return null;
        } else {
          return suggestions
              .where((element) => element.contains(search))
              .toList();
        }
      },
    );
  }
}

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Sachin",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              "What would you like to learn today?\n Search below",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                )),
          ),
        )
      ],
    );
  }
}

class CachedNetworkImageWrapper extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const CachedNetworkImageWrapper(
      {super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return const Skeletonizer(
            effect: PulseEffect(),
            child: SizedBox(
              height: 200,
              width: double.maxFinite,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.error_outline, color: Colors.grey.shade400),
            ),
          );
        },
      ),
    );
  }
}

class TestTile extends ConsumerWidget {
  const TestTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => ,
        //   ),
        // );
      },
      leading: const CachedNetworkImageWrapper(
        imageUrl:
            "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
        height: 150,
        width: 80,
      ),
      title: const Text("Mock Test Series "),
      subtitle: RichText(
          text: TextSpan(children: [
        TextSpan(text: "Quiz", style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(text: "  |  ", style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(
            text: "10 questions",
            style: Theme.of(context).textTheme.bodyMedium),
      ])),
      trailing: const Icon(Icons.arrow_forward_ios),
      splashColor: Colors.blueGrey.shade100,
    );
  }
}
