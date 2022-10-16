import 'package:escon/app/controllers/icon_controller.dart';
import 'package:escon/app/controllers/rooms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void addDevice() {
  final c = Get.put(IconController());
  final rc = Get.find<RoomsController>();
  List datas = rc.data.get(rc.roomSelected) ?? [];
  Get.dialog(AlertDialog(
    title: const Center(
      child: Text('Add Device'),
    ),
    content: SizedBox(
        width: Get.width,
        height: 300,
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      c.changeIcon();
                    },
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          c.path.value,
                          color: const Color(0xff685ee9),
                        )),
                  );
                }),
                SizedBox.fromSize(
                  size: const Size(0, 5),
                ),
                Text(
                  'Tap the icon to change it',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                SizedBox.fromSize(
                  size: const Size(0, 40),
                ),
                TextField(
                  controller: rc.deviceName,
                  maxLength: 13,
                  decoration: InputDecoration(
                    labelText: 'Device Name',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color(0xffe4cc74), width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color(0xff685ee9), width: 2)),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(0, 10),
                ),
                TextField(
                  controller: rc.deviceId,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Device ID',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color(0xffe4cc74), width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color(0xff685ee9), width: 2)),
                  ),
                ),
              ],
            ),
          ),
        )),
    actions: [
      SizedBox(
        height: 40,
        child: TextButton(
            onPressed: () {
              rc.deviceName.text = "";
              rc.deviceId.text = "";
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xff685ee9)),
            )),
      ),
      SizedBox(
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff685ee9)),
              onPressed: (() {
                if (rc.deviceName.text.isEmpty || rc.deviceId.text.isEmpty) {
                  Get.snackbar("Data is Empty", 'Please fill the blank field',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                      backgroundColor: const Color(0xff2d3436),
                      colorText: Colors.white);
                } else {
                  datas.add({
                    'deviceName': rc.deviceName.text,
                    'deviceId': rc.deviceId.text,
                    'deviceIcon': c.path.value
                  });
                  rc.data.put(rc.roomSelected, datas);
                  rc.deviceName.text = "";
                  rc.deviceId.text = "";
                  rc.updateData();
                  Get.back();
                }
              }),
              child: const Text('Add')))
    ],
  ));
}
