import 'package:flutter/material.dart';
import 'package:getx_firebase/controllers/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appUser = AuthController.instance.appUser;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appUser!.id),
          Text(appUser.username),
          Text(appUser.email),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                AuthController.instance.signOut();
              },
              child: Text('Sign out'))
        ],
      ),
    ));
  }
}
