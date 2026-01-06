import 'package:intl/intl.dart';

String formatTime(DateTime dateTime) {
  return DateFormat('h:mm a').format(dateTime);
}
