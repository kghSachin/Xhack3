import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/home/home_card.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
            child: Stack(
              children: [
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 170,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://th.bing.com/th/id/R.ba01d095b9f9a650e61d8f49d2b28519?rik=rVVFOj18ozgpZw&riu=http%3a%2f%2fwww.pixelstalk.net%2fwp-content%2fuploads%2f2016%2f05%2fMath-Mathematics-Formula-Wallpaper-for-PC.jpg&ehk=%2bfTho6j8Ym8wGaYhOjf%2bGXs56O7AyL38fNlEbHjIzqQ%3d&risl=&pid=ImgRaw&r=0",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Text(
                      'Nischal Kafle',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      'Teacher · Maths',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '40',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '5/5',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Posts'),
                        Text('Rating'),
                        Text('Students'),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'About Me',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'My name is Nischal Kafle. I am currently studying B.Sc. CSIT in Mahendra Morang Adarsha Multiple Campus, Biratnagar. I am proficient in teaching English, Maths, Science, Computer etc.',
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Posts',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    HomeCard()
                  ],
                ),
                Positioned(
                  top: 125.0,
                  left: 40.0,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(
                        "https://thewarriormessenger.com/wp-content/uploads/2016/11/Liu_1-900x826.jpg"),
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
