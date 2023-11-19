import 'package:flutter/material.dart';

class InputBallWidget extends StatefulWidget {
  final bool selec;
  final String number;
  const InputBallWidget({super.key, required this.number, required this.selec});

  @override
  State<InputBallWidget> createState() => _InputBallWidgetState();
}

class _InputBallWidgetState extends State<InputBallWidget> {
  @override
  Widget build(BuildContext context) {
    String number = "";
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.selec == true
                    ? const Color.fromRGBO(152, 41, 33, 1)
                    : Colors.white,
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(number)
            ],
          )),
    );
  }
}
