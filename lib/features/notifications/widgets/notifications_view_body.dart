import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/notifications/data/models/notification_model.dart';
import 'notification_item.dart';
import 'notification_empty_state.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({Key? key}) : super(key: key);

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  List<NotificationModel> _notifications = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    setState(() => _isLoading = true);

    // Simulate loading delay
    await Future.delayed(const Duration(seconds: 1));

    // TODO: Replace with actual data from repository/bloc
    setState(() {
      _notifications = _getMockNotifications();
      _isLoading = false;
    });
  }

  void _handleNotificationTap(NotificationModel notification) {
    // Mark as read
    setState(() {
      final index = _notifications.indexWhere((n) => n.id == notification.id);
      if (index != -1) {
        _notifications[index] = notification.copyWith(isRead: true);
      }
    });

    // Navigate based on notification type
    // TODO: Implement navigation logic
    print('Notification tapped: ${notification.id}');
  }

  void _handleNotificationDismiss(NotificationModel notification) {
    setState(() {
      _notifications.removeWhere((n) => n.id == notification.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notification dismissed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _notifications.add(notification);
              _notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));
            });
          },
        ),
      ),
    );
  }

  List<NotificationModel> _getMockNotifications() {
    return [
      NotificationModel(
        id: '1',
        title: 'AI Match Found! 95% Match',
        body: 'We found an iPhone 14 Pro that matches your lost item search',
        type: NotificationType.match,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        title: 'New Message from Ahmed Ali',
        body: 'I think I found your wallet! Can you confirm the details?',
        type: NotificationType.message,
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        isRead: false,
      ),
      NotificationModel(
        id: '3',
        title: 'Item Reported Found',
        body: 'Someone reported finding a black leather wallet near your location',
        type: NotificationType.itemFound,
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        isRead: true,
      ),
      NotificationModel(
        id: '4',
        title: 'New Lost Item Report',
        body: 'A Golden Retriever dog was reported lost in your area',
        type: NotificationType.itemLost,
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        isRead: true,
      ),
      NotificationModel(
        id: '5',
        title: 'AI Search Complete',
        body: 'Your AI visual search has found 5 potential matches',
        type: NotificationType.match,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
      NotificationModel(
        id: '6',
        title: 'Message from Sara Mohammed',
        body: 'Is this your dog? I found it near the park',
        type: NotificationType.message,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
      NotificationModel(
        id: '7',
        title: 'System Update',
        body: 'New AI features are now available! Check them out.',
        type: NotificationType.system,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color:AppColors.primary,
        ),
      );
    }

    if (_notifications.isEmpty) {
      return const NotificationEmptyState();
    }

    // Separate unread and read notifications
    final unreadNotifications = _notifications.where((n) => !n.isRead).toList();
    final readNotifications = _notifications.where((n) => n.isRead).toList();

    return RefreshIndicator(
      onRefresh: _loadNotifications,
      color:  AppColors.primary,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // Unread section
          if (unreadNotifications.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Text(
                    'New',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color:  AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${unreadNotifications.length}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:AppTextStyle.medium14.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...unreadNotifications.map((notification) => NotificationItem(
                  notification: notification,
                  onTap: () => _handleNotificationTap(notification),
                  onDismiss: () => _handleNotificationDismiss(notification),
                )),
          ],

          // Read section
          if (readNotifications.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                unreadNotifications.isNotEmpty ? 16 : 8,
                16,
                8,
              ),
              child: Text(
                'Earlier',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTextStyle.medium14.color,
                ),
              ),
            ),
            ...readNotifications.map((notification) => NotificationItem(
                  notification: notification,
                  onTap: () => _handleNotificationTap(notification),
                  onDismiss: () => _handleNotificationDismiss(notification),
                )),
          ],
        ],
      ),
    );
  }
}