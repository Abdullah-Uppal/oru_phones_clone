import 'package:flutter/material.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({super.key});
  final List<String> images = const [
    "assets/images/apple-logo.png",
    "assets/images/oneplus.png",
    "assets/images/oppo-logo.png",
    "assets/images/samsung-logo.png",
    "assets/images/vivo-logo.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Buy Top Brands",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          height: 80,
          color: Colors.grey.shade100.withOpacity(0.5),
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              elevation: 0,
              surfaceTintColor: Colors.white,
              child: Image.asset(
                images[index],
                width: 100,
                height: 80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
