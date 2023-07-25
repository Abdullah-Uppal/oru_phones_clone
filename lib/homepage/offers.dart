import 'package:flutter/material.dart';
import 'package:oru_phones/homepage/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Offers extends StatelessWidget {
  Offers({super.key});
  final controller = PageController();
  final images = const [
    "assets/images/first.jpeg",
    "assets/images/second.jpg",
    "assets/images/third.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: images.length,
            itemBuilder: (context, index) => Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                if (index == 0)
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomButton(onPressed: (){}, child: const Text("Sell Now"),),
                          CustomButton(onPressed: (){}, child: const Text("Buy Now"),),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: controller,
          count: images.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            radius: 4,
            activeDotColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
