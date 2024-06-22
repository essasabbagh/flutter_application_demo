import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/core/enums/connectivity_status.dart';

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();

  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisonnected;
    }
    lastResult = ConnectivityStatus.notDetermined;
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      // This condition is for demo purposes only to explain every connection type.
      // Use conditions which work for your requirements.
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        // Mobile network available.
        newState = ConnectivityStatus.isConnected;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        // Wi-fi is available.
        // Note for Android:
        // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
        newState = ConnectivityStatus.isConnected;
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        // Ethernet connection available.
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        // Vpn connection active.
        // Note for iOS and macOS:
        // There is no separate network interface type for [vpn].
        // It returns [other] on any device (also simulator)
      } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
        // Bluetooth connection available.
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        // Connected to a network which is not in the above mentioned networks.
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        // No available network types
        newState = ConnectivityStatus.isDisonnected;
      }

      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
