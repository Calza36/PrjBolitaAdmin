import 'package:flutter/material.dart';

class Displayer extends StatelessWidget {
  final String primaryText;
  final String secondaryText;

  const Displayer({super.key, required this.primaryText, required this.secondaryText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                primaryText,
                maxLines: 1000,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.indigo, fontSize: 36),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            secondaryText,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
