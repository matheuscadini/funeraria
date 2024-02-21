import 'package:get/get.dart';

import '../../modules/funeraria/ui/select_funeraria.dart';
import '../../modules/login/application/check_user.dart';
import '../../modules/login/ui/screen/login_screen.dart';
import '../../modules/main_layout_home/ui/screen/main_layout_home.dart';

class RoutesGetx {
  static const checkUser = '/checkUser';
  static const mainLayoutScreen = '/mainLayoutScreen';
  static const loginScreen = '/loginScreen';
  static const enrollmentUser = '/enrrolmentUser';
  static const selectFarm = '/selectFarm';

  static List<GetPage> routes = [
    GetPage(
      name: mainLayoutScreen,
      page: () => MainLayoutScreen(
        appController: Get.find(),
      ),
    ),
    GetPage(
      name: checkUser,
      page: () => CheckUser(),
    ),
    // GetPage(
    //   name: enrollmentUser,
    //   page: () => const CadastroUserScreen(),
    // ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: selectFarm,
      page: () => const SelectFarm(),
    ),
  ];
}
