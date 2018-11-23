import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:socket_flutter_plugin/socket_flutter_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    print("hereee");
    SocketFlutterPlugin myIO = new SocketFlutterPlugin();
    Platform.isAndroid?myIO.socket(
        "https://stream.automatic.com?token=481164f7a6121b43d1a3:3407c890676a0b0a6a2145f77503db4acd27bc24"):
    myIO.socket(
        "https://stream.automatic.com", "481164f7a6121b43d1a3:3407c890676a0b0a6a2145f77503db4acd27bc24");
    myIO.connect();
    String jsonData = '{"content":"test"}';
    // myIO.emit("chat",jsonData);
    myIO.on("ignition:on", (data) {
      print("data in dart: ${data}");
    });
//    myIO.on("ignition:off", (data) {
//      print(data);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        // body: new Center(
        //   child: new Text('Running on: $_platformVersion\n'),
        // ),
      ),
    );
  }
}
