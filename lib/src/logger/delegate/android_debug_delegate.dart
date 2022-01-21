/*
 Created by Thanh Son on 21/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:flutter_semi_logger/src/logger/colored.dart' as colored;
import 'package:flutter_semi_logger/src/logger/delegate/log_delegate.base.dart';
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';
import 'package:flutter_semi_logger/src/native/channel_connect.dart';

class AndroidDebugDelegate extends LogDelegate {

  @override
  String apply(String text, Set<colored.ANSIStyles> styles) {
    return colored.apply(text, styles);
  }

  @override
  void print(dynamic message, {String? header, SemiLogLevel? level, String tag = ''}) {
    var error = ErrorLog.assertLog;
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
      case SemiLogLevel.debug:
        error = ErrorLog.debug;
        break;
      case SemiLogLevel.success:
      case SemiLogLevel.fail:
        error = ErrorLog.verbose;
        break;
      case SemiLogLevel.print:
      case SemiLogLevel.header:
      case SemiLogLevel.separator:
      default:
        error = ErrorLog.assertLog;
        break;
    }
    final String msg;
    if (message is String) {
      msg = message;
    } else {
      msg = message.toString();
    }
    ChannelConnect().print(msg, log: error, tag: header ?? tag);
  }
}
