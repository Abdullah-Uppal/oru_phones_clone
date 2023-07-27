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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: Provider.of<AppState>(context).controller,
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
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              const Text("Taking too long. Maybe your internet is down"),
                              const SizedBox(height: 10),
                              FilledButton.tonalIcon(
                                  onPressed: () {
                                    appState.initState();
                                  },
                                  icon: Icon(Icons.refresh_rounded),
                                  label: Text("Retry"))
                            ],
                          ),
                        ),
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
          Consumer<AppState>(
            builder: (context, appState, child) {
              return SliverToBoxAdapter(
                child: appState.isAlreadyLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.0, bottom: 50),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}
