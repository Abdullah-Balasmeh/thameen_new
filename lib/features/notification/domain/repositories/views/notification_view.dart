import 'package:flutter/material.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = 'notification_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        showButtonBack: true,
        showButtonActions: false,
        title: 'Notifications',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(
        child: Text('Notifications'),
      ),
    );
  }
}
