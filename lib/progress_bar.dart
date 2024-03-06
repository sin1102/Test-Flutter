import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: size.width * 0.8,
              lineHeight: 20.0,
              percent: progress,
              center: Text(
                "${(progress * 100)}%",
                style: new TextStyle(fontSize: 12.0),
              ),
              trailing: Icon(Icons.mood),
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: Color.fromARGB(255, 192, 191, 191),
              progressColor: const Color.fromARGB(255, 88, 163, 224),
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            height: size.height * 0.1,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  int temp = 0;
                  if (value != "") {
                    temp = int.parse(value);
                  }

                  progress = temp / 100;
                });
              },
              decoration: InputDecoration(
                hintText: "Set progress",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 78, 78, 78).withOpacity(0.5),
                  fontSize: 15,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ],
      ),
    );
  }
}
