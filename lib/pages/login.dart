import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
              child: Form(
            key: _.formkey,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                width: size.width,
                height: size.height,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _.txtEmail,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: _.validateEmail,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _.txtPassw,
                      decoration: InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                      validator: _.validatePassword,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: Text('Sign Up')),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: _.submit,
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
