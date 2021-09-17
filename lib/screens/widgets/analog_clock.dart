import 'dart:async';
import 'dart:math';

import 'package:clock_app/models/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/constants.dart';
import 'package:clock_app/screens/widgets/clock_painter.dart';
import 'package:clock_app/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AnalogClock extends StatefulWidget {
  @override
  _AnalogClock createState() => _AnalogClock();
}

class _AnalogClock extends State<AnalogClock> {
  DateTime _dateTime = DateTime.now();

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: kShadowColor.withOpacity(0.14),
                          blurRadius: 50)
                    ]),
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: CustomPaint(
                    painter: ClockPainter(context, _dateTime),
                  ),
                ),
              )),
        ),
        Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Consumer<ThemeProvider>(
              builder: (context, theme, child) => InkWell(
                onTap: () => theme.changeTheme(),
                child: SvgPicture.asset(
                    theme.isLightTheme
                        ? 'assets/icons/sun.svg'
                        : 'assets/icons/moon.svg',
                    height: 54,
                    width: 24,
                    color: Theme.of(context).primaryColor),
              ),
            )),
      ],
    );
  }
}
