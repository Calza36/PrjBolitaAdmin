import 'package:flutter/material.dart';

class ListColectoresWidget extends StatefulWidget {
  const ListColectoresWidget({Key? key}) : super(key: key);

  @override
  State<ListColectoresWidget> createState() => _ListColectoresWidgetState();
}

class _ListColectoresWidgetState extends State<ListColectoresWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(
                  label: FittedBox(
                    child: Text(
                      "Colectores",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  label: FittedBox(
                    child: Text(
                      "B",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  label: FittedBox(
                    child: Text(
                      "L",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  label: FittedBox(
                    child: Text(
                      "P",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  label: FittedBox(
                    child: Text(
                      "P",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  label: FittedBox(
                    child: Text(
                      "G",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(
                    Text("CG1"),
                  ),
                  DataCell(
                    FittedBox(child: Text("222")),
                  ),
                  const DataCell(
                    FittedBox(child: Text("180.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("CG1"),
                  ),
                  DataCell(
                    FittedBox(child: Text("200.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("180.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("CG1"),
                  ),
                  DataCell(
                    FittedBox(child: Text("200.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("180.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("CG1"),
                  ),
                  DataCell(
                    FittedBox(child: Text("200.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("180.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text("CG1"),
                  ),
                  DataCell(
                    FittedBox(child: Text("200.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("180.00")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  DataCell(
                    FittedBox(child: Text("-")),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
