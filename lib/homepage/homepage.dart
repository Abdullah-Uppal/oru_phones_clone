import 'package:flutter/material.dart';
import 'package:oru_phones/app_state.dart';
import 'package:oru_phones/homepage/mobiles_grid.dart';
import 'package:oru_phones/homepage/offers.dart';
import 'package:oru_phones/homepage/search_result.dart';
import 'package:oru_phones/homepage/top_brands_row.dart';
import 'package:oru_phones/homepage/widgets/mobile_tile.dart';
import 'package:provider/provider.dart';
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
                // grid
              ],
            ),
          ),
          Consumer<AppState>(builder: (context, appState, child) {
            return FutureBuilder(
                future: appState.mobiles,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MobilesGrid(
                      mobiles:
                          snapshot.data!.map((e) => MobileTile(e)).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(snapshot.error.toString()),
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 70.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                });
          }),
        ],
      ),
    );
  }
}
