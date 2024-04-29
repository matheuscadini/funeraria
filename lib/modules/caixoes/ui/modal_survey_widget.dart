import 'package:flutter/material.dart';
import 'package:flutter_funeraria/modules/caixoes/application/caixao_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ModalSurveyWidget extends StatelessWidget {
  final CaixaoController caixaoController;
  const ModalSurveyWidget({
    Key? key,
    required this.caixaoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Obx(
      () {
        return SimpleDialog(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 42, 32, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enquete",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            alignment: Alignment.topRight,
                            icon: SvgPicture.asset(
                              'assets/icons/download.svg',
                              height: 24,
                              width: 24,
                            ),
                            onPressed: () => Get.back(),
                          ),
                          IconButton(
                            alignment: Alignment.topRight,
                            icon: SvgPicture.asset(
                              'assets/icons/close_round.svg',
                              height: 24,
                              width: 24,
                            ),
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    height: 10,
                  ).paddingOnly(bottom: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 40,
                        child: SizedBox(
                          height: 369,
                          width: 292,
                          child: Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                  "fir-funeraria.appspot.com/WIN_20230602_18_22_39_Pro.jpg"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Data de criação'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                              height: 10,
                            ).paddingSymmetric(vertical: 32),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 25,
                                          width: 94,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          )),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 60),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]);
      },
    );
  }
}
