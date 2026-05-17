// class MyDuration {
  
  

// // Display the duration in a readable format
//   @override
//   String toString() {
//     int seconds = (_milliseconds / 1000).round();
//     int minutes = (seconds / 60).floor();
//     seconds = seconds % 60;
//     int hours = (minutes / 60).floor();
//     minutes = minutes % 60;
//     return '$hours hours, $minutes minutes, $seconds seconds';
//   }
// }

// void main() {
//   MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
//   MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
//   print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
//   print(duration1>duration2); //true

//   try {
//     print(duration2 - duration1); // This will throw an exception
//   } catch (e) {
//     print(e); 
//   }
// }

class MyDuration {
  final int _milliseconds;
  const MyDuration._internal(this._milliseconds);

  factory MyDuration.fromHours(int hours) {
    final ms = hours * 3600000;
    if (ms < 0) throw Exception('Duration cannot be negative');
    return MyDuration._internal(ms);
  }

  factory MyDuration.fromMinutes(int minutes) {
    final ms = minutes * 60000;
    if (ms < 0) throw Exception('Duration cannot be negative');
    return MyDuration._internal(ms);
  }

  factory MyDuration.fromSeconds(int seconds) {
    final ms = seconds * 1000;
    if (ms < 0) throw Exception('Duration cannot be negative');
    return MyDuration._internal(ms);
  }

  // Q2 - Operator overloading

  // +: adds two durations
  MyDuration operator +(MyDuration other) {
    return MyDuration._internal(_milliseconds + other._milliseconds);
  }

  // -: subtracts two durations, throws if result is negative
  MyDuration operator -(MyDuration other) {
    final result = _milliseconds - other._milliseconds;
    if (result < 0) throw Exception('Duration cannot be negative: result is below 0');
    return MyDuration._internal(result);
  }

  // >: compares two durations
  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3);    // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes

  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // throws because 45min - 3h is negative
  } catch (e) {
    print(e);
  }
}