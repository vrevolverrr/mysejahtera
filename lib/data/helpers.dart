import 'dart:math';

String formatNumber(int number) {
  // Returns a comma delimited formatted string of an integer
  return number.toString().replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}

double getLargestValue(List<double> array) {
  // Returns the largest double in a list
  array = List.from(array);
  if (array.length == 1) return array[0];

  array.remove(min(array[0], array[1]));

  return getLargestValue(array);
}

String timestampToString(int millisecondsSinceEpoch) {
  /// Formats thetimestamp as datetime string
  /// Eg:
  DateTime datetime =
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

  const months = [
    "January",
    "February",
    "March",
    "April",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  return '${datetime.day} ${months[datetime.month - 1]} ${datetime.year} ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
}

class Question {
  final String title;
  final String subtitle;

  Question(this.title, this.subtitle);
}
