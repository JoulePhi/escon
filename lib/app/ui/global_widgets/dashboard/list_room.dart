import 'package:escon/app/controllers/rooms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget listRoom() {
  final c = Get.find<RoomsController>();
  return ListView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: [
      GestureDetector(
        onTap: () {
          c.changeSelected(1);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 30, bottom: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (1 == c.isSelected.value)
                      ? const Color(0x22685ee9)
                      : const Color(0x22e4cc74),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: (1 == c.isSelected.value)
                    ? const Color(0xff685ee9)
                    : const Color(0xffe4cc74),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: SizedBox(
            width: Get.width * 0.4,
            height: Get.height * 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: Image.asset(
                    c.roomsW[0].path.toString(),
                    color: const Color(0xff685ee9),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(10, 10),
                ),
                Text(
                  c.roomsW[0].name.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF8A8992), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          c.changeSelected(2);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 30, bottom: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (2 == c.isSelected.value)
                      ? const Color(0x22685ee9)
                      : const Color(0x22e4cc74),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: (2 == c.isSelected.value)
                    ? const Color(0xff685ee9)
                    : const Color(0xffe4cc74),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: SizedBox(
            width: Get.width * 0.4,
            height: Get.height * 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: Image.asset(
                    c.roomsW[1].path.toString(),
                    color: const Color(0xff685ee9),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(10, 10),
                ),
                Text(
                  c.roomsW[1].name.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF8A8992), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          c.changeSelected(3);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 30, bottom: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (3 == c.isSelected.value)
                      ? const Color(0x22685ee9)
                      : const Color(0x22e4cc74),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: (3 == c.isSelected.value)
                    ? const Color(0xff685ee9)
                    : const Color(0xffe4cc74),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: SizedBox(
            width: Get.width * 0.4,
            height: Get.height * 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: Image.asset(
                    c.roomsW[2].path.toString(),
                    color: const Color(0xff685ee9),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(10, 10),
                ),
                Text(
                  c.roomsW[2].name.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF8A8992), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          c.changeSelected(4);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 30, bottom: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (4 == c.isSelected.value)
                      ? const Color(0x22685ee9)
                      : const Color(0x22e4cc74),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: (4 == c.isSelected.value)
                    ? const Color(0xff685ee9)
                    : const Color(0xffe4cc74),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: SizedBox(
            width: Get.width * 0.4,
            height: Get.height * 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: Image.asset(
                    c.roomsW[3].path.toString(),
                    color: const Color(0xff685ee9),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(10, 10),
                ),
                Text(
                  c.roomsW[3].name.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF8A8992), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          c.changeSelected(5);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 30, bottom: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (5 == c.isSelected.value)
                      ? const Color(0x22685ee9)
                      : const Color(0x22e4cc74),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: (5 == c.isSelected.value)
                    ? const Color(0xff685ee9)
                    : const Color(0xffe4cc74),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: SizedBox(
            width: Get.width * 0.4,
            height: Get.height * 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: Image.asset(
                    c.roomsW[4].path.toString(),
                    color: const Color(0xff685ee9),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(10, 10),
                ),
                Text(
                  c.roomsW[4].name.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF8A8992), fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
