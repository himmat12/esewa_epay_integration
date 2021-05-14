import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlatformService extends GetxController {
  static const platformChannel = MethodChannel('battery');
  var batteryPercentage = "".obs;

  Future<void> getBatteryPercentage() async {
    try {
      final int result =
          await platformChannel.invokeMethod('getBatteryPercentage');
      batteryPercentage.value = 'Battery Percent: $result';
    } on PlatformException catch (e) {
      batteryPercentage.value = 'Failed to get Battery Percent: $e';
    }
  }
}
