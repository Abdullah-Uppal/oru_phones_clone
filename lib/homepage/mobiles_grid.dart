import 'package:flutter/material.dart';

class MobilesGrid extends StatefulWidget {
  final List<Widget> mobiles;
  const MobilesGrid({super.key, required this.mobiles});

  @override
  State<MobilesGrid> createState() => _MobilesGridState();
}

class _MobilesGridState extends State<MobilesGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverGrid.builder(
        // cacheExtent: 10,
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          // crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return widget.mobiles[index];
        },
        itemCount: widget.mobiles.length,
      ),
    );
  }
}
