import 'package:flutter/cupertino.dart';

class People extends ChangeNotifier {
  String name;

  People({required this.name});

  setName(String peopleName) {
    name = peopleName;
    notifyListeners();
  }

  getName() {
    return name;
  }
}
