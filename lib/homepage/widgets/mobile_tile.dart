import 'package:flutter/material.dart';
import 'package:oru_phones/models/mobile/mobile.dart';
import 'package:intl/intl.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'dart:io' show Platform;

class MobileTile extends StatelessWidget {
  final Mobile mobile;
  const MobileTile(this.mobile, {super.key});

  bool _isMobile() {
    if (Platform.isAndroid || Platform.isIOS) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var half = MediaQuery.of(context).size.width ~/ 2;
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
                  child: _isMobile() ? OptimizedCacheImage(
                    imageUrl: mobile.defaultImage.fullImage ?? "",
                    maxWidthDiskCache: half,
                    memCacheWidth: half,
                    fadeInDuration: const Duration(milliseconds: 0),
                    fadeOutDuration: const Duration(milliseconds: 0),
                    errorWidget: (context, url, error) {
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
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            value: progress.progress,
                          ),
                        ),
                      );
                    },
                  ): Image.network(
                    mobile.defaultImage.fullImage ?? "",
                    cacheWidth: half,
                    width: half.toDouble(),
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
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
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
                          DateFormat("MMM dd").format(DateFormat("dd/MM/yyyy")
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
