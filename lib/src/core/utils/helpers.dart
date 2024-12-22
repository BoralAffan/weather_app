import 'package:intl/intl.dart';

class Helpers{
    static String formatDate(String dateTime){
  final date = DateTime.parse(dateTime);
  final day = date.day;
  final month = _getMonthName(date.month);
  final year = date.year;
  return '$day, $month $year';
  }
 

static String _getMonthName(int month) {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  return months[month - 1];
}

static String extractTime(String dateTime) {
  final date = DateTime.parse(dateTime);
  final hour = date.hour;
  final minute = date.minute.toString().padLeft(2, '0');  
  final period = hour >= 12 ? 'PM' : 'AM';
   return '$hour:$minute $period';
}

static String formatDateToDayMonth(String dateString) {
  try {
     DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);

     return DateFormat('EEEE, dd MMM').format(date);
  } catch (e) {
    return 'Invalid Date';
  }
}


}