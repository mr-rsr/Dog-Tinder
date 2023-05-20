import 'package:dogtinder/Services/modal.dart';
import 'package:dogtinder/Services/networking.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final networking = Networking();

enum cardStatus { red, blue, black }

class CardProvider extends ChangeNotifier {
  late int _blue, _red, _black;
  Dog? data;
  List<String>? _urlImages = [];
  getDogImages() async {
    data = await networking.apiFetch();
    _urlImages = data?.message;
    notifyListeners();
  }

  //save red,black and blue heart to shared preference
  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('red', _red);
    prefs.setInt('blue', _blue);
    prefs.setInt('black', _black);
  }
//get red,black and blue heart from shared preference

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    _red = prefs.getInt('red') ?? 0;
    _blue = prefs.getInt('blue') ?? 0;
    _black = prefs.getInt('black') ?? 0;
    notifyListeners();
  }

  int get red => _red;
  int get blue => _blue;
  int get black => _black;
  set red(int value) {
    _red = value;
    notifyListeners();
  }

  set blue(int value) {
    _blue = value;
    notifyListeners();
  }

  set black(int value) {
    _black = value;
    notifyListeners();
  }

  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  List<String>? get urlImages => _urlImages;

  bool get isDragging => _isDragging;
  Offset get position => _position;
  Size _screenSize = Size.zero;
  double get angle => _angle;
  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void setScreenSize(Size size) {
    _screenSize = size;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();
    final status = getStatus();
    switch (status) {
      case cardStatus.red:
        BlueHeart();
        break;
      case cardStatus.black:
        RedHeart();
        break;
      case cardStatus.blue:
        BlackHeart();
        break;
      default:
        resetPosition();
    }
  }

  void BlueHeart() {
    _angle = 20;
    _position += Offset(_screenSize.width / 2, 0);
    _blue++;
    nextCard();
    saveData();
    notifyListeners();
  }

  void RedHeart() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _black++;
    nextCard();
    saveData();
    notifyListeners();
  }

  Future nextCard() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _urlImages!.removeLast();
    resetPosition();
    //getDogImages();
  }

  void BlackHeart() {
    _angle = 0;
    _position += Offset(0, _screenSize.height);
    _red++;
    nextCard();
    saveData();
    notifyListeners();
  }

  cardStatus? getStatus() {
    final x = _position.dx;
    final y = _position.dy;
    final delta = 100;
    final forceBlackLike = x.abs() < 20;
    if (x >= delta) {
      return cardStatus.red;
    } else if (x <= -delta) {
      return cardStatus.blue;
    } else if (y >= delta / 2 && forceBlackLike) {
      return cardStatus.black;
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }
}
