class CustomDuration {
  int _milliseconds = 0;

  CustomDuration(int milliseconds) {
    if (milliseconds < 0) {
      throw Exception('Milliseconds cannot be negative');
    }
    _milliseconds = milliseconds;
  }

  CustomDuration.fromHours(int hours) {
    if (hours < 0) {
      throw Exception('Hours cannot be negative');
    }
    _milliseconds = hours * 3600000;
  }
  CustomDuration.fromMinutes(int minutes) {
    if (minutes < 0) {
      throw Exception('Minutes cannot be negative');
    }
    _milliseconds = minutes * 60000;
  }

  CustomDuration.fromSeconds(int seconds) {
    if (seconds < 0) {
      throw Exception('Seconds cannot be negative');
    }
    _milliseconds = seconds * 1000;
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

  print('Duration1: ${duration1._milliseconds}ms');
  print('Duration2: ${duration2._milliseconds}ms');

  print('Duration3: ${duration3._milliseconds}ms');

  // comparing the two durations
  if (duration1.isNotEqual(duration2)) {
    print('One of them is greater than the other');
  } else {
    print('Duration1 is equal to Duration2');
  }

  CustomDuration addedDuration = duration1.addTwoDuration(duration2);
  print('Added Duration: ${addedDuration._milliseconds}ms');

  CustomDuration subtractedDuration = duration1.minusTwoDuration(duration2);
  
  
  print('Subtracted Duration: ${subtractedDuration._milliseconds}ms');
}
