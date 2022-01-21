/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:flutter_semi_logger/src/logger/colored.dart';
import 'package:flutter_semi_logger/src/logger/level/semi_log_level.dart';

part 'semi_log_style_data.dart';

Set<ANSIStyles> _generate({
  ANSIStyles? color,
  ANSIStyles? bg,
  bool bold = false,
  bool underline = false,
  bool blink = false,
  bool reverse = false,
  bool concealed = false,
  bool italic = false,
  bool dark = false,
}) {
  final Set<ANSIStyles> styles = {};
  if (color != null) styles.add(color);
  if (bg != null) styles.add(bg);
  if (bold) styles.add(ANSIStyles.bold);
  if (underline) styles.add(ANSIStyles.underline);
  if (blink) styles.add(ANSIStyles.blink);
  if (reverse) styles.add(ANSIStyles.reverse);
  if (concealed) styles.add(ANSIStyles.concealed);
  if (italic) styles.add(ANSIStyles.italic);
  if (dark) styles.add(ANSIStyles.dark);
  return styles;
}

/// The style for each level
///
class SemiLogStyle {
  const SemiLogStyle([this.styles = const {}]);

  /// another contructor
  factory SemiLogStyle.generate({
    ANSIStyles? color,
    ANSIStyles? bg,
    bool bold = false,
    bool underline = false,
    bool blink = false,
    bool reverse = false,
    bool concealed = false,
    bool italic = false,
    bool dark = false,
  }) =>
      SemiLogStyle(_generate(
          color: color,
          bg: bg,
          bold: bold,
          underline: underline,
          blink: blink,
          reverse: reverse,
          concealed: concealed,
          italic: italic,
          dark: dark));

  /// get text style
  final Set<ANSIStyles> styles;

  SemiLogContent toContent(String message) {
    return SemiLogContent(message, styles);
  }
}

class SemiLogContent extends SemiLogStyle {
  const SemiLogContent(this.msg, [Set<ANSIStyles> styles = const {}])
      : super(styles);

  /// another contructor
  factory SemiLogContent.generate(
    String msg, {
    ANSIStyles? color,
    ANSIStyles? bg,
    bool bold = false,
    bool underline = false,
    bool blink = false,
    bool reverse = false,
    bool concealed = false,
    bool italic = false,
    bool dark = false,
  }) =>
      SemiLogContent(
          msg,
          _generate(
              color: color,
              bg: bg,
              bold: bold,
              underline: underline,
              blink: blink,
              reverse: reverse,
              concealed: concealed,
              italic: italic,
              dark: dark));

  /// another contructor
  factory SemiLogContent.styles(String msg,
          {Set<ANSIStyles> styles = const {}}) =>
      SemiLogContent(msg, styles);

  /// The message
  final String msg;
}
