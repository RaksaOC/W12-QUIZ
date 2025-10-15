class CustomDuration {
  int _milliseconds = 0;

  CustomDuration(int ms) {
    if (ms < 0) {
      throw Exception('cannot be negative');
    }
    _milliseconds = ms;
  }

  CustomDuration.fromHours(int hrs) {
    if (hrs < 0) {
      throw Exception('cannot be negative');
    }
    _milliseconds = hrs * 3600000;
  }
  CustomDuration.fromMinutes(int mins) {
    if (mins < 0) {
      throw Exception('Minutes cannot be negative');
    }
    _milliseconds = mins * 60000;
  }

  CustomDuration.fromSeconds(int secs) {
    if (secs < 0) {
      throw Exception('Seconds cannot be negative');
    }
    _milliseconds = secs * 1000;
  }

  bool isNotEqual(CustomDuration other) {
    return _milliseconds != other._milliseconds;
  }

  CustomDuration addTwoDuration(CustomDuration other) {
    return CustomDuration(_milliseconds + other._milliseconds);
  }

  CustomDuration minusTwoDuration(CustomDuration other) {
    if (_milliseconds < other._milliseconds) {
      throw Exception('Resulting duration cannot be negative');
    }
    return CustomDuration(_milliseconds - other._milliseconds);
  }
}

main() {
  
  var duration1 = CustomDuration.fromHours(2);

  var duration2 = CustomDuration.fromMinutes(30);

  var duration3 = CustomDuration.fromSeconds(9000);

  print('duration 1: ${duration1._milliseconds}ms');
  
  print('duration 2: ${duration2._milliseconds}ms');

  print('duration 3: ${duration3._milliseconds}ms');

  // comparing the two durations
  if (duration1.isNotEqual(duration2)) {
    print('One of them is greater than the other');
  } else {
    print('duration 1 is equal to duration 2');
  }

  CustomDuration addedDuration = duration1.addTwoDuration(duration2);
  print('added duration: ${addedDuration._milliseconds}ms');

  CustomDuration subtractedDuration = duration1.minusTwoDuration(duration2);
  
  
  print('subtracted duration: ${subtractedDuration._milliseconds}ms');
}
