import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_semi_logger/flutter_semi_logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Semi Logger'),
        ),
        body: Column(
          children: [
            const Text('Testing...'),
            ListTile(
              title: const Text('Log info'),
              subtitle: const Text('"Hello World!" will be print'),
              onTap: () => SemiLogger().e('Hello World!'),
            ),
            ListTile(
              title: const Text('Seperator'),
              subtitle: const Text('Print a separator'),
              onTap: () => SemiLogger().separator('Hello World!'),
            ),
            ListTile(
              title: const Text('Log error'),
              subtitle: const Text('And exception will be print'),
              onTap: () {
                SemiException(
                  SemiErrorCode.unknown,
                  error: Exception('This is an exception'),
                  stackTrace: StackTrace.current,
                  message: 'This exception was occus',
                  time: DateTime.now(),
                ).print();
              },
            ),
            ListTile(
              title: const Text('Log custom'),
              subtitle: const Text('"Hello World!" will be print with custom'),
              onTap: () => SemiLogger().custom([
                SemiLogContent.gennerate('H', underline: true),
                SemiLogContent.gennerate('e', color: ANSIStyles.red),
                SemiLogContent.gennerate('ll', color: ANSIStyles.red),
                SemiLogContent.gennerate('o', bg: ANSIStyles.yellow),
                SemiLogContent.gennerate(' ', bg: ANSIStyles.yellow),
                SemiLogContent.gennerate('Wo', color: ANSIStyles.yellow),
                SemiLogContent.gennerate(
                  'r',
                  color: ANSIStyles.green,
                  bold: true,
                ),
                SemiLogContent.gennerate(
                  'ld',
                  color: ANSIStyles.red,
                  bg: ANSIStyles.bgBlue,
                  underline: true,
                ),
                SemiLogContent.gennerate(
                  '!',
                  bg: ANSIStyles.bgBlue,
                  underline: true,
                ),
              ], separator: ''),
            )
          ],
        ),
      ),
    );
  }
}
