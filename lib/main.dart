import 'package:esewa_manual_api_integration/bindings.dart';
import 'package:esewa_manual_api_integration/esewa/esewa.dart';
import 'package:esewa_manual_api_integration/platform_service.dart';
import 'package:esewa_manual_api_integration/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBindings(),
      home: MyHome(),
      // home: Esewa(),
    );
  }
}

class MyHome extends StatelessWidget {
  final int? bateryPercentage;

  MyHome({Key? key, this.bateryPercentage}) : super(key: key);

  final controller = Get.put(PlatformService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Battery Percentage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ServiceClass.postData();
              },
              child: Text("post epay & make payment request"),
            ),
          ],
        ),
      ),
    );
  }
}
