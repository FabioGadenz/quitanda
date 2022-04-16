import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quitanda/src/pages/auth/sign_up_screen.dart';
import 'package:quitanda/src/pages/home/home_tab.dart';

import 'src/pages/auth/sign_in_screen.dart';
import 'src/routes/route_getx.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialRoute: RoutesGetx.signInScreen,
      getPages: RoutesGetx.routes,
      // [
      //   GetPage(name: '/Signin', page: () => SignInScreen()),
      //   GetPage(name: '/SignUp', page:() => SignUpScreen()),
      //   GetPage(name: '/HomeTab', page: () => HomeTab()),
      // ],

      title: 'Quitanda',
      theme: ThemeData(


        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white70
      ),
      debugShowCheckedModeBanner: false,
      //home:  SignInScreen(),
    );
  }
}

