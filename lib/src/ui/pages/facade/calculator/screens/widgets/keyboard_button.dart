import 'package:flutter/material.dart';

import '../../constants.dart';

class KeyboardButton extends StatelessWidget {
  final String id;
  final VoidCallback onPressed;

  const KeyboardButton({super.key, required this.id, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: setChild(id),
        ),
      ),
    );
  }
}

Widget setChild(String id) {
  if (id == ButtonId.backspace) {
    return const Icon(
      Icons.backspace_outlined,
      color: Color(0xFFF57B7B),
    );
  }

  if (id == ButtonId.ac) {
    return Text(
      id,
      style: const TextStyle(
        color: Color(0xFFF57B7B),
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  if (RegExp(r'[\d\.]').hasMatch(id)) {
    return Text(
      id,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  return Text(
    id,
    style: const TextStyle(
      color: Color(0xFF26F4CE),
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
