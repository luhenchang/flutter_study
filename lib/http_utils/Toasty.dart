import 'dart:async';

import 'package:flutter/services.dart';

class Toasty {
  static const MethodChannel _channel =
  const MethodChannel('toasty');

  static success (String content) async {
    await _channel.invokeMethod('success', {
      "message": content,
    });
  }
  static info (String content) async {
    await _channel.invokeMethod('info', {
      "message": content,
    });
  }
  static warning (String content) async {
    await _channel.invokeMethod('warning', {
      "message": content,
    });
  }
  static normal (String content) async {
    await _channel.invokeMethod('normal', {
      "message": content,
    });
  }
  static error (String content) async {
    await _channel.invokeMethod('error', {
      "message": content,
    });
  }
}