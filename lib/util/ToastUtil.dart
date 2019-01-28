import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///显示Toast
class ToastUtil {
  ///短时Toast显示
  static showMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showMessageLong(String message) {
    Fluttertoast.showToast(msg: null);
  }
}
