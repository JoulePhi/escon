import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconController extends GetxController {
  var path = 'lib/app/ui/utils/icon_picker/power.png'.obs;
  List imagesPath = [
    'lib/app/ui/utils/icon_picker/bulb.png',
    'lib/app/ui/utils/icon_picker/cooling-fan.png',
    'lib/app/ui/utils/icon_picker/monitor.png',
    'lib/app/ui/utils/icon_picker/power.png',
    'lib/app/ui/utils/icon_picker/switch.png',
    'lib/app/ui/utils/icon_picker/thunder.png',
  ];
  void changeIcon() {
    Get.dialog(
        AlertDialog(
          title: const Center(child: Text('Select Icon')),
          content: SizedBox(
            width: Get.width,
            height: Get.height * 0.4,
            child: GridView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                childAspectRatio: (1 / .5),
              ),
              scrollDirection: Axis.vertical,
              children: imagesPath
                  .map((e) => GestureDetector(
                        onTap: () {
                          path.value = e;
                          Get.back();
                        },
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            e,
                            color: const Color(0xff685ee9),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
