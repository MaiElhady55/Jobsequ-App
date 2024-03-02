import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';


class CustomCounter extends StatelessWidget {
  final String counterName;
  final int counter;
  const CustomCounter(
      {super.key, required this.counterName, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            counterName,
            textAlign: TextAlign.center,
            style: Styles.textStyle11.copyWith(color: AppTheme.neutral5,)
          ),
          Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style:  Styles.textStyle13.copyWith(color: AppTheme.neutral9,)
          ),
        ],
      ),
    );
  }
}
