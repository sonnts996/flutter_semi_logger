/*
 Created by Thanh Son on 20/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:flutter/services.dart';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

typedef _SemiPrint = Pointer<Utf8> Function(Pointer<Utf8>);

DynamicLibrary _lib = Platform.isAndroid
    ? DynamicLibrary.open('libnative_app.so')
    : DynamicLibrary.process();

final Pointer<Utf8> Function(Pointer<Utf8> text) _semiPrintUtf8 =
    _lib.lookup<NativeFunction<_SemiPrint>>("semiPrint").asFunction();

enum ErrorLog {
  verbose,
  debug,
  error,
  info,
  warn,
  assertLog,
}

extension ErrorLogX on ErrorLog {
  String name() {
    switch (this) {
      case ErrorLog.verbose:
        return 'verbose';
      case ErrorLog.debug:
        return 'debug';
      case ErrorLog.error:
        return 'error';
      case ErrorLog.info:
        return 'info';
      case ErrorLog.warn:
        return 'warn';
      case ErrorLog.assertLog:
        return 'assertLog';
    }
  }
}

class ChannelConnect {
  static const MethodChannel _methodChannel =
      MethodChannel('flutter_semi_logger');

  void print(String message, {ErrorLog log = ErrorLog.assertLog, String? tag}) {
    _methodChannel.invokeMethod('print', {
      'content': message,
      'type': log.name(),
      'tag': tag,
    });
  }

  void semiPrint(String text) {
    var rs = _semiPrintUtf8(text.toNativeUtf8());
    print(rs.toDartString());
  }
}
