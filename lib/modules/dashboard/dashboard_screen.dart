import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 220,
                    height: 60,
                   
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 220,
                    height: 60,
                    
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 220,
                    height: 60,
                  
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
