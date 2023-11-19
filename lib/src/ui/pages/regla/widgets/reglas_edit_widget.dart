import 'package:flutter/material.dart';

class ReglasEditWidget extends StatefulWidget {
  const ReglasEditWidget({super.key});

  @override
  State<ReglasEditWidget> createState() => _ReglasEditWidgetState();
}

class _ReglasEditWidgetState extends State<ReglasEditWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Fijo:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Corrido:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Parle:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Limitar Fijo:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Limitar Corrido:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Limitar Parle:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Limitar Centena:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
