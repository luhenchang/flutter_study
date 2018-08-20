package com.example.flutterstudy

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel


class MainActivity() : FlutterActivity() {
    private val CHANNEL = "demo.plugin"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 自定义插件
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler(object : MethodCallHandler {
            override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
             //   if (call.method == "interaction") {
                    val intent = Intent(this@MainActivity, MainActivityOragnal::class.java)
                    intent.putExtra("putstr",call.method);
                    this@MainActivity.startActivity(intent)
                    result.success("success")
              /*  } else {
                    result.notImplemented()
                }*/
            }
        })
        GeneratedPluginRegistrant.registerWith(this)

    }
}
