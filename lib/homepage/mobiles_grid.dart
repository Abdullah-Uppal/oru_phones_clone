import 'package:flutter/material.dart';
import 'package:oru_phones/homepage/widgets/mobile_tile.dart';

class MobilesGrid extends StatefulWidget {
  final List<Widget> mobiles;
  const MobilesGrid({super.key, required this.mobiles});

  @override
  State<MobilesGrid> createState() => _MobilesGridState();
}

class _MobilesGridState extends State<MobilesGrid> {
  late final mobiles = widget.mobiles;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverGrid.builder(
        // cacheExtent: 10,
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          // crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.7,
        ),
        itemBuilder: (context, index) {
          return mobiles[index];
        },
        itemCount: mobiles.length,
      ),
    );
  }
}
