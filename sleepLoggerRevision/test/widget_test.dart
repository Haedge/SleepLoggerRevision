// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sleeplogger/main.dart';

void main() {
  test('Testing the duration of sleep', () {
    expect(timeTracker(6), Duration(hours: 6));

    expect(timeTracker(30), Duration(days:1, hours: 6));

    expect(timeTracker(8), Duration(hours: 8));

    expect(timeTracker(48), Duration(days: 2));

  });
}


Duration timeTracker(int hours_slept){
  DateTime start = DateTime.now();
  DateTime end = start.add(new Duration(hours: hours_slept));
  Duration duration = end.difference(start);
  return duration;
}
