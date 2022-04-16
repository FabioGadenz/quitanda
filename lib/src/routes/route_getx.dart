import 'package:get/get_navigation/get_navigation.dart';
import 'package:quitanda/src/pages/auth/sign_in_screen.dart';
import 'package:quitanda/src/pages/base/base_screen.dart';
import 'package:quitanda/src/pages/home/home_tab.dart';

import '../pages/auth/sign_up_screen.dart';

class RoutesGetx {
  static const signInScreen = '/Signin';
  static const signUpScreen = '/SignUp';
  static const homeTab = '/HomeTab';
  static const baseScreen = '/BaseScreen';
  //Para  dar o get e acessa a pagina usamos o Get.toNamed('/BaseScreen');

  static List<GetPage> routes = [
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: homeTab,
      page: () => HomeTab(),
    ),
    GetPage(name: baseScreen, page: ()=> BaseScreen(),
    )
  ];
}
