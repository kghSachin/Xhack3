import 'package:flutter/material.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      child: Image.asset(
                        'lib/assets/images/snake.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    'Nischal Kafle',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    'Teacher · Maths',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'My name is Nischal Kafle. I am currently studying B.Sc. CSIT in Mahendra Morang Adarsha Multiple Campus, Biratnagar. I am proficient in teaching English, Maths, Science, Computer etc.',
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Posts',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      shadowColor: Colors.grey,
                      child: Text('HEllo'),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 125.0,
                left: 40.0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/assets/images/snake.jpg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
