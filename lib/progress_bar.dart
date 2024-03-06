import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                    value: progress,
                  ),
                  Text('${(progress * 100).round()}%'),
                ],
              )),
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
