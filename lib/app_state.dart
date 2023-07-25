import 'dart:isolate';

import 'package:flutter/widgets.dart';
import 'package:oru_phones/network/models/mobile/mobile.dart';
import 'package:oru_phones/network/oru_phones_api.dart';

class AppState extends ChangeNotifier {
  late final Future<List<Mobile>> mobiles;
  AppState() {
    initState();
  }
  void initState() {
    mobiles = OruPhonesApi().getMobiles(100, 1);
    mobiles.then((value) => notifyListeners());
  }
}
