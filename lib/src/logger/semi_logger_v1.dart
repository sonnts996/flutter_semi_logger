/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
part of 'semi_logger.dart';

/// The logger is static in app.
/// That mean is the logger config will be apply on all logger object
/// on your app.
/// Use instance for custom a special logger.
///
class _SemiLoggerV1 extends SemiLogger {
  const _SemiLoggerV1({
    name,
    styleData,
    separatorChar,
    separatorLength,
  }) : super._(
          styleData: styleData,
          name: name,
          separatorChar: separatorChar,
          separatorLength: separatorLength,
        );

  @override
  bool get debugMode => kDebugMode;

  core.String get _header => _delegate.apply(name, styleData.header.styles);

  LogDelegate get _delegate {
    if (debugMode) {
      if (Platform.isIOS) {
        return IosDebugDelegate();
      } else if (Platform.isAndroid) {
        return AndroidDebugDelegate();
      }
    }
    return ReleaseDelegate();
  }

  /// print your object without format
  /// doesn't depend on debugMode
  @override
  void print(core.dynamic object, [SemiLogLevel level = SemiLogLevel.debug]) {
    _delegate.print(object, level: level, tag: _header);
  }

  /// print the message with level format in debugMode
  /// except error, warning and info
  @override
  void log({
    SemiLogLevel level = SemiLogLevel.debug,
    required core.String message,
    core.bool hasHeader = true,
  }) {
    if (level == SemiLogLevel.print) {
      _delegate.print(message,
          level: level, header: hasHeader ? _header : null, tag: _header);
    } else {
      _delegate.print(_delegate.apply(message, styleData.getStyle(level)),
          level: level, header: hasHeader ? _header : null, tag: _header);
    }
  }

  /// print a line with custom
  @override
  void custom(List<SemiLogContent> contents,
      {String separator = ' ',
      hasHeader = true,
      SemiLogLevel level = SemiLogLevel.debug}) {
    String msg = contents
        .map(
          (e) => _delegate.apply(e.msg, e.styles),
        )
        .join(separator);
    _delegate.print(msg,
        level: level, header: hasHeader ? _header : null, tag: _header);
  }

  /// print the multi line message
  @override
  void block(
    List<SemiLogData> messages, {
    core.String? linePrefix,
    core.bool lineNumber = false,
    bool headerSeparator = false,
  }) {
    headerSeparator ? separator('', true) : log(message: '');
    int padRight = messages.length.toString().length;
    for (int i = 0; i < messages.length; i++) {
      final data = messages[i];
      var msg = data.msg;
      if (data.level == SemiLogLevel.separator) {
        separator(msg, false);
      } else {
        if (linePrefix != null) {
          msg = '$linePrefix $msg';
        }
        if (lineNumber) {
          msg = '${i.toString().padRight(padRight)} $msg';
        }
        log(message: msg, level: data.level, hasHeader: false);
      }
    }
  }

  /// print the message in error level
  @override
  void e(core.String message) {
    log(message: message, level: SemiLogLevel.error);
  }

  /// print the message in info level
  @override
  void i(core.String message) {
    log(message: message, level: SemiLogLevel.info);
  }

  /// print the message in warning level
  @override
  void w(core.String message) {
    log(message: message, level: SemiLogLevel.warn);
  }

  /// print the message in debug level
  @override
  void d(core.String message) {
    log(message: message, level: SemiLogLevel.debug);
  }

  /// print the start line
  @override
  void separator([core.String message = '', bool hasHeader = false]) {
    log(
      message: message.padRight(separatorLength, separatorChar),
      level: SemiLogLevel.separator,
      hasHeader: hasHeader,
    );
  }

  /// print the message in success level
  @override
  void success(core.String message) {
    log(message: message, level: SemiLogLevel.success);
  }

  /// print the message in fail level
  @override
  void fail(core.String message) {
    log(message: message, level: SemiLogLevel.fail);
  }

  /// print empty line
  @override
  void breakLine() {
    log(message: '', level: SemiLogLevel.info, hasHeader: false);
  }
}
