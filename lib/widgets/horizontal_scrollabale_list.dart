import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalScrollableList extends StatelessWidget {
  const HorizontalScrollableList({super.key});

  @override
  Widget build(BuildContext context) {
    // List of destinations with image paths, titles, and locations
    final List<Map<String, String>> destinations = [
      {
        "imagePath": "assets/images/beach.jpeg",
        "title": "Coconut Tree Hill",
        "location": "Mirissa, Sri Lanka"
      },
      {
        "imagePath": "assets/images/tea.jpeg",
        "title": "Tea estate",
        "location": "Thalawakale, Sri Lanka"
      },
      {
        "imagePath": "assets/images/sigiriya.jpeg",
        "title": "Sigiriya",
        "location": "Sigiriya, Sri Lanka"
      },
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        final destination = destinations[index];
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: DestinationCard(
            imagePath: destination["imagePath"]!,
            title: destination["title"]!,
            location: destination["location"]!,
          ),
        );
      },
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;

  const DestinationCard({
    required this.imagePath,
    required this.title,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          location,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
