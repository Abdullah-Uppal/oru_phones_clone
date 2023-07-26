import 'package:flutter/widgets.dart';
import 'package:oru_phones/models/mobile/mobile.dart';
import 'package:oru_phones/network/oru_phones_api.dart';

class AppState extends ChangeNotifier {
  late Future<List<Mobile>> mobiles;
  int _currentPage = 1;
  bool isAlreadyLoading = false;
  bool noMoreData = false;
  ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  AppState() {
    initState();
  }
  void initState() {
    _currentPage = 1;
    mobiles = OruPhonesApi().getMobiles(10, _currentPage++);
    mobiles.then((value) => notifyListeners());
    controller.addListener(scrollHandler);
  }

  void fetchMore() {
    isAlreadyLoading = true;
    controller.removeListener(scrollHandler);
    notifyListeners();
    var res = OruPhonesApi().getMobiles(10, _currentPage++);
    res.then((resValue) {
      mobiles = mobiles.then((value) {
        if (resValue.isNotEmpty) {
          value.addAll(resValue);
        } else {
          noMoreData = true;
        }
        return value;
      });
      controller.addListener(scrollHandler);
      isAlreadyLoading = false;
      notifyListeners();
    });
  }

  void scrollHandler() {
    if (controller.offset >= controller.position.maxScrollExtent * 0.7) {
      if (isAlreadyLoading) {
        return;
      }
      if (noMoreData) {
        return;
      }
      fetchMore();
    }
  }
}
