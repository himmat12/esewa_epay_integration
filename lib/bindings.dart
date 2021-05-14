import 'package:esewa_manual_api_integration/platform_service.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PlatformService());
  }
}
