import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/switch_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchPage extends StatelessWidget {
  SwitchPage({super.key});
  final c = Get.put(SwitchController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            Get.parameters['name'].toString().replaceAll('-', ' '),
            style: const TextStyle(
                fontFamily: "Poppins-SemiBold",
                fontSize: 20,
                color: Colors.black87),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Device Id',
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  "${Get.parameters['id']}",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                Obx((() => Expanded(
                      child: SizedBox(
                        child: Center(
                          child: (c.isLoading.value)
                              ? const CircularProgressIndicator()
                              : FlutterSwitch(
                                  activeColor: Colors.green.withOpacity(.8),
                                  inactiveColor: Colors.red.withOpacity(.8),
                                  activeText: 'ON',
                                  inactiveText: 'OFF',
                                  showOnOff: true,
                                  activeIcon: const Icon(
                                    Icons.power_settings_new_rounded,
                                    color: Colors.green,
                                  ),
                                  inactiveIcon: const Icon(
                                    Icons.power_settings_new_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  width: 250,
                                  height: 100,
                                  valueFontSize: 50.0,
                                  toggleSize: 100.0,
                                  borderRadius: 50,
                                  value: c.isOn.value,
                                  onToggle: (a) {
                                    c.changeState(a);
                                  },
                                ),
                        ),
                      ),
                    ))),
                Obx(() {
                  return Text(
                    "Status : ${c.status.value}",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
