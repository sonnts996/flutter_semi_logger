package com.semi.flutter_semi_logger

import androidx.annotation.NonNull
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterSemiLoggerPlugin */
class FlutterSemiLoggerPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_semi_logger")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "print") {
            var content: String? = call.argument("content")
            var type: String? = call.argument("type");
            var tag: String? = call.argument("tag");
            if (content != null && tag != null) {
                when (type) {
                    "verbose" -> Log.v(tag, content);
                    "debug" -> Log.d(tag, content);
                    "error" -> Log.e(tag, content);
                    "info" -> Log.i(tag, content);
                    "warn" -> Log.w(tag, content);
                    "assertLog" -> Log.println(Log.ASSERT, tag, content);
                    else -> println(content);
                }
            } else {
                println(content)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
