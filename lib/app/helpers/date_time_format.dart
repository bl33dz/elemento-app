import 'package:intl/intl.dart';

String dateFormat(DateTime? time) {
  return DateFormat("d MMMM yyyy", "id_ID").format(time ?? DateTime.now());
}
