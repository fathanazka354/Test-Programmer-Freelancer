import 'package:intl/intl.dart';

String convertStringToDatetime(String inputString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(inputString);

  // Format the DateTime object according to the desired output format
  final formatter = DateFormat('EEEE, dd MMMM yyyy HH:mm', 'id_ID'); // Indonesian locale
  String formattedString = formatter.format(dateTime);

  return formattedString;
}