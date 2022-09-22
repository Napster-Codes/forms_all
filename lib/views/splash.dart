import 'package:flutter/material.dart';
import 'package:forms_and_fields/views/registration_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    runScreen();
    super.initState();
  }

  void runScreen() {
    Future.delayed(
      Duration(seconds: 5),
      () async {
        Get.off(RegisterPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => AnimatedOpacity(
          opacity: 1,
          duration: Duration(seconds: 5),
          child: Center(
            child: Image.network(
              'https://cdn.dribbble.com/users/4017890/screenshots/15698413/media/5784967e37c43d949ee5074189601159.gif',
              // 'https://cdn.dribbble.com/users/712682/screenshots/11956378/media/50c8e606db69f492200555d72b34f308.gif',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}


// SplashScreen(
//       seconds: 5,
//       navigateAfterSeconds: RegisterPage(),
//       loaderColor: Colors.blue,
//       image: Image.network(
//           'https://cdn.dribbble.com/users/712682/screenshots/11956378/media/50c8e606db69f492200555d72b34f308.gif'),
//     );