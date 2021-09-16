import 'dart:async';

import 'package:clock_app/size_config.dart';
import 'package:flutter/material.dart';

class DisplayTime extends StatefulWidget {
  @override
  _DisplayTime createState() => _DisplayTime();
}

class _DisplayTime extends State<DisplayTime> {
  // Time During the day representing hour:minute pair
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  // Call once, when stateful widget inserted in the widget tree
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // hourOfPeriod: 12-hour clock, hour 24h
          "${_timeOfDay.hour}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 5),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        ),
      ],
    );
  }
}
