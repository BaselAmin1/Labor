import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void pushReplacementNamed(String screen){
    Navigator.of(this).pushReplacementNamed(screen);
  }
   void pushNamed(String screen){
    Navigator.of(this).pushNamed(screen);
  }
    void pop(String screen){
    Navigator.of(this).pop(screen);
  }
}
