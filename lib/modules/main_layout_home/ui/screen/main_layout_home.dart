import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funeraria/core/styles/text_extension.dart';
import 'package:flutter_funeraria/modules/funeraria/application/funeraria_controller.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/app_controller.dart';
import '../../../../core/routes/routes_getx.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/widgets/menu_item_widget.dart';
import '../../../login/application/check_user.dart';

class MenuItemModel {
  String title;
  Widget page;
  MenuItemModel({
    required this.title,
    required this.page,
  });
}

class MainLayoutScreen extends StatelessWidget {
  final AppController appController;

  MainLayoutScreen({
    Key? key,
    required this.appController,
  }) : super(key: key);
  FunerariaController funerariaController = Get.find();
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    User? user = firebaseAuth.currentUser;

    FunerariaController funerariaController = Get.find();

    return (user == null || funerariaController.localStorage == null)
        ? CheckUser()
        : Obx(
            () => Scaffold(
              appBar: AppBar(
                backgroundColor: CustomColors.background,
                elevation: 0,
                title: Column(
                  children: [
                    Text(funerariaController.funerariaSelecionada.value.nome
                        .toString()),
                    Text(funerariaController
                            .funerariaSelecionada.value.proprietario
                            .toString())
                        .proprietatioMainLayout,
                  ],
                ),
                centerTitle: true,
                leadingWidth: 150,
                leading: const Center(
                  child: Text(
                    'CoffinSystem',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Center(
                        child: Text(user.displayName ?? "sem nome cadastrado")),
                  ),
                ],
              ),
              backgroundColor: CustomColors.backgroundpages,
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: CustomColors.background,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...appController.drawerItems.map<MenuItemWidget>(
                                (item) => MenuItemWidget(
                                    title: item.title,
                                    isSelected: appController.selectedScreen ==
                                        item.title,
                                    onClick: () {
                                      appController.selectedScreen = item.title;
                                    })),
                            Expanded(child: Container()),
                            MenuItemWidget(
                              title: 'Logout',
                              isSelected: false,
                              onClick: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Deseja sair?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              {Navigator.of(context).pop()},
                                          child: const Text(
                                            'Cancelar',
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              AppController().logout();
                                              Get.offAllNamed(
                                                  RoutesGetx.checkUser);
                                              funerariaController.localStorage
                                                  .clear();
                                            },
                                            child: const Text('Sair'))
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Container(
                      color: CustomColors.backgroundScaffold,
                      child:
                          appController.getBody(appController.selectedScreen),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
