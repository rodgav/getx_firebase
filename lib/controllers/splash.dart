import 'package:get/get.dart';
import 'package:getx_firebase/controllers/auth.dart';
import 'package:getx_firebase/routes/route_names.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _check();
    super.onReady();
  }

  _check() async {
    final appUser = await AuthController.instance.isLogged();
    if (appUser != null) {
      Get.offNamed(RouteNames.HOME);
    } else {
      Get.offNamed(RouteNames.LOGIN);
    }
  }
}
