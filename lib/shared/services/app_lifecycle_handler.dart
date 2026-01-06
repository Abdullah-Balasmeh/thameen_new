import 'package:flutter/material.dart';
import 'package:thameen/shared/services/user_presence_service.dart';

class AppLifecycleHandler extends WidgetsBindingObserver {
  final String userId;
  final UserPresenceService service;

  AppLifecycleHandler(this.userId, this.service);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      service.setOnline(userId);
    } else {
      service.setOffline(userId);
    }
  }
}
