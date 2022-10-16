import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../data/models/rooms_model.dart';

class RoomsController extends GetxController {
  var isSelected = 1.obs;
  late Box data;
  List datas = [];
  final Map<int, String> rooms = {
    1: "Bedroom",
    2: "LivingRoom",
    3: "GuestRoom",
    4: "Kitchen",
    5: "Bathroom"
  };
  String roomSelected = "Bedroom";
  RxList<RoomModel> roomsW = <RoomModel>[].obs;
  TextEditingController deviceName = TextEditingController();
  TextEditingController deviceId = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    roomsW.value = List.generate(5, (index) {
      return RoomModel.fromId(id: index + 1);
    });
    data = Hive.box('devicesData');
    datas = data.get(roomSelected) ?? [];
    update(['datas']);
  }

  void changeSelected(int i) {
    isSelected.value = i;
    roomSelected = rooms[i].toString();
    datas = data.get(roomSelected) ?? [];
    update(['datas']);
  }

  void updateData() {
    datas = data.get(roomSelected) ?? [];
    update(['datas']);
  }

  void deleteDevice(e) {
    List allData = data.get(roomSelected) ?? [];
    final i =
        allData.indexWhere((element) => element['deviceId'] == e['deviceId']);
    allData.removeAt(i);
    data.put(roomSelected, allData);
    updateData();
  }
}
