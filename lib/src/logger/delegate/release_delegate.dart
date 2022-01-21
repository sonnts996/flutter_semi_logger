/*
 Created by Thanh Son on 21/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:flutter_semi_logger/src/logger/colored.dart';
import 'package:flutter_semi_logger/src/logger/delegate/log_delegate.base.dart';
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';
import 'package:flutter_semi_logger/src/native/channel_connect.dart';

class ReleaseDelegate extends LogDelegate {

  @override
  String apply(String text, Set<ANSIStyles> styles) {
    return text;
  }

  @override
  void print(String message,
      {String? header, SemiLogLevel? level, String tag = ''}) {
    ErrorLog? error;
    switch (level) {
      case SemiLogLevel.warn:
        error = ErrorLog.warn;
        break;
      case SemiLogLevel.error:
        error = ErrorLog.error;
        break;
      case SemiLogLevel.info:
        error = ErrorLog.info;
        break;
      case SemiLogLevel.print:
      case SemiLogLevel.header:
      case SemiLogLevel.separator:
        error = ErrorLog.assertLog;
        break;
      case SemiLogLevel.debug:
      case SemiLogLevel.success:
      case SemiLogLevel.fail:
      default:
        break;
    }
    if (error == null) return;
    final String msg;
    if (message is String) {
      msg = message;
    } else {
      msg = message.toString();
    }
    ChannelConnect().print(msg, log: error, tag: header ?? tag);
  }
}
