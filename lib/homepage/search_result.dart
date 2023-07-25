import 'package:flutter/material.dart';
import 'package:oru_phones/network/oru_phones_api.dart';

class SearchResult extends StatefulWidget {
  final String query;
  const SearchResult({super.key, required this.query});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return widget.query.isNotEmpty
        ? FutureBuilder(
            future: OruPhonesApi().search(widget.query),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.makes.isEmpty &&
                    snapshot.data!.models.isEmpty) {
                  if (widget.query.isNotEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text("No results found"),
                      ),
                    );
                  }
                  return Container();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Brand",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.makes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.makes[index]),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Mobile Model",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.models.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.models[index]),
                        );
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("ERROR");
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )
        : Container();
  }
}
