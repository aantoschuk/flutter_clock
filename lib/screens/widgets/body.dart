import 'package:clock_app/screens/widgets/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'digital_clock.dart';
import '../widgets/country_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Box with specified width and/or height
    return SafeArea(
      child: SizedBox(
        // fill all the parent space ( double infinity )
        width: double.infinity,
        child: Column(children: [
          Text(
            "Kharkiv UA | GMT+3",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DigitalClock(),
          AnalogClock(),
          Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CountryCard(
                  time: "9:20",
                  period: "PM",
                  timeZone: "+3 HRS | EST",
                  country: "New York, USA",
                  iconSrc: "assets/icons/liberty.svg",
                ),
                CountryCard(
                  time: "1:20",
                  period: "AM",
                  country: "Sydney, AU",
                  timeZone: "+19 HRS | AEST",
                  iconSrc: "assets/icons/sydney.svg",
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
