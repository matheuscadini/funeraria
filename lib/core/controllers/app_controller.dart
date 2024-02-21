import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_funeraria/modules/venda/ui/vendas_screen.dart';
import 'package:get/get.dart';

import '../../modules/caixoes/ui/caixoes_screen.dart';
import '../../modules/dashboard/dashboard_screen.dart';
import '../../modules/main_layout_home/ui/screen/main_layout_home.dart';

class AppController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final _selectedScreen = 'Dashboard'.obs;
  String get selectedScreen => _selectedScreen.value;
  set selectedScreen(value) => _selectedScreen.value = value;

  logout() {
    _firebaseAuth.signOut();
  }

  getBody(String viewName) {
    return drawerItems.firstWhere((element) => element.title == viewName).page;
  }

  List<MenuItemModel> drawerItems = [
    MenuItemModel(
      title: 'Dashboard',
      page: const DashboardScreen(),
    ),
    MenuItemModel(
      title: 'Caixões Cadastrados',
      page: const CaixoesScreen(),
    ),
    MenuItemModel(
      title: 'Vendas',
      page: const VendasScreen(),
    ),
    //  MenuItemModel(
    //   title: 'Lotes',
    //   page: const LoteScreen(
    //       ),
    // ),
  ];
}
