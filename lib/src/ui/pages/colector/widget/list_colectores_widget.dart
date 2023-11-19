import 'package:flutter/material.dart';

class ListColectoresWidget extends StatefulWidget {
  const ListColectoresWidget({super.key});

  @override
  State<ListColectoresWidget> createState() => _ListColectoresWidgetState();
}

class _ListColectoresWidgetState extends State<ListColectoresWidget> {
  var test;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //test = CollectorsReportsProvider().getCollectorsReportsProvider('day.dart',19, 12, 2022);
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
                    FittedBox(child: Text(test)),
                  ),
                  const DataCell(
                    FittedBox(child: Text("180.00")),
                  ),
                  const DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  const DataCell(
                    FittedBox(child: Text("-")),
                  ),
                  const DataCell(
                    FittedBox(child: Text("-")),
                  ),
                ]),
                const DataRow(cells: [
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
                const DataRow(cells: [
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
                const DataRow(cells: [
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
                const DataRow(cells: [
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
