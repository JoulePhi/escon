import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../global_widgets/const.dart';
import '../global_widgets/dashboard/list_room.dart';
import '../global_widgets/dashboard/add_device.dart';
import 'package:escon/app/controllers/rooms_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final c = Get.put(RoomsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff6f8fc),
        body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
            child: GetBuilder(
              id: 'datas',
              init: RoomsController(),
              builder: ((controller) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                      height: 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppConst.dashTitle,
                              style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff262647))),
                          Text(c.roomSelected.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: Get.width,
                        height: Get.height * 0.22,
                        child: listRoom()),
                    const SizedBox(
                      width: 100,
                      height: 20,
                    ),
                    Text(
                      AppConst.dashDevice,
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff262647)),
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(5),
                    ),
                    Container(
                      height: 2,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Color(0x44262647),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    SizedBox.fromSize(
                      size: const Size(0, 20),
                    ),
                    (c.datas.isEmpty)
                        ? Expanded(
                            child: SizedBox(
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Device Empty",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 173, 179, 189)),
                                ),
                                SizedBox.fromSize(
                                  size: const Size(0, 10),
                                ),
                                Text("Press + icon to add Device",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 173, 179, 189))),
                              ],
                            )),
                          ))
                        : Expanded(
                            child: Scrollbar(
                              thickness: 5,
                              radius: const Radius.circular(20),
                              child: GridView(
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: (1 / .8),
                                ),
                                scrollDirection: Axis.vertical,
                                children: c.datas.map((e) {
                                  return GridTile(
                                      child: InkWell(
                                    borderRadius: BorderRadius.circular(25),
                                    onTap: () {
                                      final id = e['deviceId'];
                                      final name = e['deviceName']
                                          .toString()
                                          .replaceAll(' ', '-');
                                      Get.toNamed("/switch-page/$id/$name");
                                    },
                                    onLongPress: () {
                                      Get.dialog(AlertDialog(
                                        title: const Text(
                                            'Are you sure want to delete this device?'),
                                        actions: [
                                          SizedBox(
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Color(0xff685ee9)),
                                                )),
                                          ),
                                          SizedBox(
                                              height: 40,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              const Color(
                                                                  0xff685ee9)),
                                                  onPressed: (() {
                                                    c.deleteDevice(e);
                                                    Get.back();
                                                  }),
                                                  child: const Text('Yes')))
                                        ],
                                      ));
                                    },
                                    child: Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x22685ee9),
                                              spreadRadius: 0,
                                              blurRadius: 2,
                                              offset: Offset(0,
                                                  10), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white,
                                          // border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(50, 50),
                                            child: Image.asset(
                                              e['deviceIcon'],
                                              color: const Color(0xff685ee9),
                                            ),
                                          ),
                                          SizedBox.fromSize(
                                            size: const Size(0, 10),
                                          ),
                                          Text(
                                            e['deviceName']
                                                .toString()
                                                .toUpperCase(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff93939b)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                                }).toList(),
                              ),
                            ),
                          ),
                  ],
                );
              }),
            )),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {
              addDevice();
            },
            backgroundColor: const Color(0xff685ee9),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
