import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/api/my_api.dart';
import 'package:getx_firebase/controllers/auth.dart';
import 'package:getx_firebase/routes/route_names.dart';
import 'package:getx_firebase/utils/progress_dialog.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> _formkey = GlobalKey();

  GlobalKey<FormState> get formkey => _formkey;
  final txtEmail = TextEditingController();
  final txtPassw = TextEditingController();

  String? validateEmail(String? text) {
    if (text!.contains('@')) return null;
    return 'Invalid email';
  }

  String? validatePassword(String? text) {
    if (text!.trim().length > 5) return null;
    return 'Invalid password';
  }

  @override
  void onClose() {
    txtEmail.dispose();
    txtPassw.dispose();
    super.onClose();
  }

  Future<void> submit() async {
    final isOk = _formkey.currentState!.validate();
    if (isOk) {
      ProgressDialog progressDialog = ProgressDialog(Get.overlayContext!);
      progressDialog.show();
      final customToken = await MyApi.instance
          .login(email: txtEmail.text.trim(), password: txtPassw.text.trim());
      if (customToken != null) {
        await AuthController.instance.singWhitCustomToken(customToken);
        progressDialog.dismiss();
        Get.offNamed(RouteNames.HOME);
      } else {
        progressDialog.dismiss();
      }
    }
  }
}
