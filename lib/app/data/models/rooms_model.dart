import 'package:flutter/material.dart';

class RoomModel {
  String? name;
  IconData? icon;
  String? path;
  bool? selected = false;
  int id;
  RoomModel.fromId({required this.id}) {
    switch (id) {
      case 1:
        name = "Bedroom";
        icon = Icons.bed_outlined;
        path = "lib/app/ui/utils/rooms_icon/bedroom.png";
        selected = true;
        break;
      case 2:
        name = "Living Room";
        icon = Icons.bed_outlined;
        path = "lib/app/ui/utils/rooms_icon/living-room.png";
        selected = false;
        break;
      case 3:
        name = "Guest Room";
        icon = Icons.bed_outlined;
        path = "lib/app/ui/utils/rooms_icon/guest-room.png";
        selected = false;
        break;
      case 4:
        name = "Kitchen";
        icon = Icons.bed_outlined;
        path = "lib/app/ui/utils/rooms_icon/kitchen.png";
        selected = false;
        break;
      case 5:
        name = "Bathroom";
        icon = Icons.bed_outlined;
        path = "lib/app/ui/utils/rooms_icon/bathroom.png";
        selected = false;
        break;
    }
  }
}
