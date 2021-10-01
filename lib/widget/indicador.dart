import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timerdown/model/count.dart';

class Indicador extends StatelessWidget {
  final Count count;

  const Indicador({required this.count}) : super();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      final size = constraints.maxWidth < constraints.maxHeight
          ? constraints.maxWidth
          : constraints.maxHeight;

      return CircularPercentIndicator(
        radius: size / 2,
        lineWidth: 5.0,
        percent: count.percert,
        center: new Text(
          "${count.tag} seg",
          style: TextStyle(fontSize: 25),
        ),
        progressColor: Colors.purple,
      );
    });
  }
}
