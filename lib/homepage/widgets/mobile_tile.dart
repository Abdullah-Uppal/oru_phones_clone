import 'package:flutter/material.dart';
import 'package:oru_phones/network/models/mobile/mobile.dart';
import 'package:intl/intl.dart';

class MobileTile extends StatelessWidget {
  final Mobile mobile;
  const MobileTile(this.mobile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () {},
          ),
        ),
        Positioned.fill(
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    mobile.defaultImage.fullImage ?? "",
                    cacheWidth: MediaQuery.of(context).size.width ~/ 2,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ));
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          Text(
                            "Failed to fetch",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rs. ${mobile.listingNumPrice}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      mobile.model,
                      style:
                          const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "${mobile.deviceStorage} | ",
                          style: const TextStyle(fontSize: 11),
                        ),
                        Text(
                          "Condition: ${mobile.deviceCondition}",
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          mobile.listingLocation,
                          style: const TextStyle(fontSize: 11),
                        ),
                        Text(
                          DateFormat("MMM dd").format(
                          DateFormat("dd/MM/yyyy")
                              .parse(mobile.listingDate)),
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
