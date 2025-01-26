import 'package:flutter/material.dart';
import 'package:frontend/features/chat/constants.dart';
import 'package:frontend/features/home/constants.dart';

class SubjectContent extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subtitle;
  const SubjectContent(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'lib/assets/images/pollination.jpg',
      'lib/assets/images/photosynthesis.jpg',
      'lib/assets/images/the_universe.jpg'
    ];
    List<String> title = ['Pollination', 'Photosynthesis', 'The Universe'];
    List<String> subTitle = [
      'Pollination is the transfer of pollen grains from the stamens (the flower parts that produce them) to the ovule-bearing organs or to the ovules (seed precursors) themselves.As a prerequisite for fertilization, pollination is essential to the perpetuation of the vast majority of the world’s wild plants as well as to the production of most fruit and seed crops.',
      'Photosynthesis is the process by which green plants and certain other organisms transform light energy into chemical energy. During photosynthesis in green plants, light energy is captured and used to convert water, carbon dioxide, and minerals into oxygen and energy-rich organic compounds.',
      'The universe encompasses all of space and time, including all matter and energy. It is estimated to be about 13.787 billion years old, based on the Big Bang theory.',
    ];
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
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
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 8);
                  },
                  itemCount: title.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: cardColor,
                      minLeadingWidth: 70,
                      minTileHeight: 120,
                      contentPadding: EdgeInsets.all(0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          imagePath[index],
                          width: 100,
                          // height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        title[index],
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        subTitle[index],
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
