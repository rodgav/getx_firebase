import 'package:get/get.dart';
import 'package:getx_firebase/controllers/auth.dart';

class AppBindins extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
