import 'package:flutter/foundation.dart';

import 'dart:collection';

import 'eachtag.dart';

class TagData extends ChangeNotifier {
  List<EachTag> _datalist = [];

  UnmodifiableListView<EachTag> get getAllData {
    return UnmodifiableListView(_datalist);
  }

  int get dataCount {
    return _datalist.length;
  }

  void addTask(String name, String des, String tag) {
    final data = EachTag(name, des, tag);
    _datalist.add(data);
    notifyListeners();
  }
}
