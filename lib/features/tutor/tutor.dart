import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/chat/constants.dart';

class TutorPage extends ConsumerWidget {
  const TutorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 4,
        title: const Text(
          'Tutor',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 24,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    children: [
                      Text("My Location",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                      Text("Dharan-4, Purwanchal Campus",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text("Teachers near you",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
            SizedBox(
              height: 6,
            ),
            ...lists.map((e) => TeacherCard(
                  image: e,
                  name: name[lists.indexOf(e)],
                  category: address[lists.indexOf(e)],
                  location: position[lists.indexOf(e)],
                ))
          ],
        ),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final String name;
  final String location;
  final String category;
  final String image;
  const TeacherCard({
    super.key,
    required this.name,
    required this.location,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            height: 100,
            width: 100,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              Text(location,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
              Text(category,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
              Row(
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      size: 20,
                      color: index < 4 ? Colors.amber : Colors.grey,
                    );
                  })
                ],
              ),
            ],
          )),
          SizedBox(
            width: 6,
          ),
          Column(
            children: [
              MaterialButton(
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.white.withOpacity(0.6),
                onPressed: () {},
                child: Text(
                  "Follow",
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.blueGrey,
                onPressed: () {},
                child: Text("Profile",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

List<String> lists = [
  "https://th.bing.com/th/id/R.e61d848b84c59c6041776feabdfdd867?rik=TALWOKg0XU3ZVg&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/OIP.1VlsQbyV2OKVlmilViGTwAHaE7?w=725&h=483&rs=1&pid=ImgDetMain",
  "https://internationalteacherstraining.com/blog/wp-content/uploads/2018/08/171219-teacher-stock.jpg"
];

List<String> name = [
  "Shreya Niraula",
  "Nischal Kafle",
  "Sudip adhikari",
];
List<String> position = [
  "Instructor,Science",
  "Mentor, Maths",
  "Tutor, Account",
];
List<String> address = [
  "Dharan, Nepal",
  "Itahari, Nepal",
  "Biratnagar, Nepal",
];
