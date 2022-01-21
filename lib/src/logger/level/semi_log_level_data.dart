/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/

part of 'semi_log_level.dart';

extension SemiLogLevelX on SemiLogLevel {
  /// use for log a block
  SemiLogData msg(String message) {
    return SemiLogData(this, message);
  }

  /// another log print
  void log(String message) {
    SemiLogger().log(message: message, level: this);
  }

  /// convert to SemiLogContent
  SemiLogContent toContent(String message) {
    return SemiLogContent.styles(
      message,
      styles: SemiLogger().styleData.getStyle(this),
    );
  }
}

/// data for block print
///
class SemiLogData {
  const SemiLogData(this.level, this.msg);

  /// massage use for block print
  final String msg;

  /// level use for block print
  final SemiLogLevel level;
}
