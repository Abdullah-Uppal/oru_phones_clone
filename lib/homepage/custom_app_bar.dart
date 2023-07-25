import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final Iterable<Widget> Function(BuildContext, SearchController)
      suggestionsBuilder;
  const CustomAppBar({
    super.key,
    required this.suggestionsBuilder,
  });
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.location_on_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
        ),
      ],
      title: Image.asset(
        'assets/images/logo.png',
        color: Theme.of(context).colorScheme.onPrimary,
        height: 80,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: 110,
      floating: true,
      // snap: true,
      // search bar
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor.bar(
            constraints: const BoxConstraints(),
            barHintText: "Search with make and model...",
            barOverlayColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.onPrimary,
            ),
            suggestionsBuilder: widget.suggestionsBuilder,
            barElevation: MaterialStateProperty.all(0),
            barShape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // view configuration
            viewShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
