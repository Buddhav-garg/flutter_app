const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

String formatDate(DateTime date) => '${date.day.toString().padLeft(2,'0')} ${_months[date.month-1]} ${date.year}';

String formatDateTime(DateTime date){
  final hour12 = date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
  final ampm = date.hour >= 12 ? 'PM' : 'AM';
  return '${formatDate(date)} $hour12:${date.minute.toString().padLeft(2,'0')} $ampm';
}

String greetingFor(DateTime now){
  if(now.hour < 12) return 'morning';
  if(now.hour < 17) return 'afternoon';
  return 'evening';
}

