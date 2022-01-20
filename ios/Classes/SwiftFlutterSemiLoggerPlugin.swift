import Flutter
import UIKit
import os.log

public class SwiftFlutterSemiLoggerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_semi_logger", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSemiLoggerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "print" {
          let arg = call.arguments as? Dictionary<String, Any>;
          let content = arg?["content"];
          if(content != nil){
              print(content!)
          }
          
      }
  }
}
