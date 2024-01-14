import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class SwitchController extends GetxController {
  var isOn = false.obs;
  final client = MqttServerClient('broker.emqx.io', 'flutter_client');
  var pongCount = 0; // Pong counter
  var isLoading = false.obs;
  var status = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await init();
    subscribe('escon/device/id/${Get.parameters['id']}');
  }

  @override
  void onClose() {
    super.onClose();
    client.disconnect();
  }

  void changeState(a) {
    isOn.value = a;
    Map data = {"device": !a};
    publish('escon2024/${Get.parameters['id']}', data.toString());
  }

  Future<void> init() async {
    isLoading.value = true;
    status.value = 'Connecting';
    client.logging(on: true);
    client.setProtocolV311();
    client.keepAlivePeriod = 20;
    client.connectTimeoutPeriod = 2000;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;
    final connMess = MqttConnectMessage()
        .withClientIdentifier('flutter_client${Get.parameters['id']}')
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      Get.snackbar("No Connection", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xff2d3436),
          colorText: Colors.white);
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      Get.snackbar("No Connection", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xff2d3436),
          colorText: Colors.white);
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      isLoading.value = false;
      status.value = "Connected";
      Get.snackbar("Connected", 'Client Connected',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xff2d3436),
          colorText: Colors.white);
    } else {
      isLoading.value = false;
      Get.snackbar("Failed", '${client.connectionStatus}',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: const Color(0xff2d3436),
          colorText: Colors.white);
      client.disconnect();
    }
  }

  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atMostOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      if (pt == 'true') {
        isOn.value = true;
      } else if (pt == 'false') {
        isOn.value = false;
      }
    });
  }

  void publish(String topic, String val) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(val);
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
    builder.clear();
  }

  void unSubscribe(String topic) {
    client.unsubscribe(topic);
  }

  void onSubscribed(String topic) {}

  /// The unsolicited disconnect callback
  void onDisconnected() {
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      // Get.snackbar("No Connection", 'Connection solicited',
      //     snackPosition: SnackPosition.BOTTOM,
      //     duration: const Duration(seconds: 2),
      //     backgroundColor: const Color(0xff2d3436),
      //     colorText: Colors.white);
    } else {
      exit(-1);
    }
    if (pongCount == 3) {
      // Get.snackbar("Pong", 'POng count is correct',
      //     snackPosition: SnackPosition.BOTTOM,
      //     duration: const Duration(seconds: 2),
      //     backgroundColor: const Color(0xff2d3436),
      //     colorText: Colors.white);
      // } else {
      //   Get.snackbar("Pong", 'POng count is incorrect',
      //       snackPosition: SnackPosition.BOTTOM,
      //       duration: const Duration(seconds: 2),
      //       backgroundColor: const Color(0xff2d3436),
      //       colorText: Colors.white);
    }
  }

  /// The successful connect callback
  void onConnected() {}

  /// Pong callback
  void pong() {
    pongCount++;
  }
}
