import 'package:clock_app/screens/widgets/analog_clock.dart';
import 'package:clock_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'digital_clock.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Box with specified width and/or height
    return SizedBox(
      // fill all the parent space ( double infinity )
      width: double.infinity,
      child: Column(children: [
        Text(
          "Kharkiv UA | GMT+3",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        DigitalClock(),
        AnalogClock(),
      ]),
    );
  }
}
