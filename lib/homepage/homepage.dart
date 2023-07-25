import 'package:flutter/material.dart';
import 'package:oru_phones/homepage/offers.dart';
import 'package:oru_phones/homepage/search_result.dart';
import 'package:oru_phones/homepage/top_brands_row.dart';
import 'custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // bar
          CustomAppBar(
            suggestionsBuilder: (context, query) {
              return [
                SearchResult(query: query.text),
              ];
            },
          ),

          // main section
          SliverToBoxAdapter(
            child: Column(
              children: [
                const TopBrands(),
                Offers(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
