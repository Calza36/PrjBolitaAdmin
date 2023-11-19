import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';

import '../../../../data/services/get_it_mock.dart';
import '../../../../domain/general_collector_report/entity/foot_collector_report_entity.dart';
import '../../../../infrastructure/general_collectors_report/datasources/implementation/general_collectors_reports_repository.dart';
import '../../../../tools/app_config_size.dart';
import '../../../widgets/plane_loading_widget.dart';
import '../../colector/page/colector_page.dart';

class ListGeneralCollectorWidget extends StatefulWidget {
  const ListGeneralCollectorWidget(
      {super.key,
      required this.adminId,
      required this.turn,
      required this.day,
      required this.month,
      required this.year});
  final String adminId;
  final String turn;
  final int day;
  final int month;
  final int year;
  @override
  State<ListGeneralCollectorWidget> createState() =>
      _ListGeneralCollectorWidgetState();
}

bool mesInicial = false;
DateTime date = DateTime.now();
int _day = 19;
int _month = 12;
int _year = 2022;
String _fecha = "";
String _dia = DateTime.now().toString().substring(0, 10).substring(8, 10);
String _mes = DateTime.now().toString().substring(0, 10).substring(5, 7);

TextEditingController _controlCalendario = TextEditingController();

var turns = ["Day", "Night"];
int _value = 1;

class _ListGeneralCollectorWidgetState
    extends State<ListGeneralCollectorWidget> {
  var adminId = '';

  final generalCollectorsReportsRepository =
      GeneralCollectorsReportsRepository();
  final List<bool> _selected = [];
  @override
  void initState() {
    super.initState();
    if (widget.adminId == '') {
      adminId = GetItMock.prefs.getString('user_id')!;
    } else {
      adminId = widget.adminId;
    }
    if (widget.turn == '') {
      _value = 1;
      _day = int.parse(_dia);
      _month = int.parse(_mes);
      _year = DateTime.now().year;
    } else {
      _value = turns.indexOf(widget.turn);
      _day = widget.day;
      _month = widget.month;
      _year = widget.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Buscar por fecha"),

                Container(
                    child: Row(children: [
                  SizedBox(
                      // width: 101,
                      height: 35,
                      width: 80,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color.fromRGBO(152, 41, 33, 1)
                              //border: Border.all()
                              ),
                          child: Center(
                              child: TextButton(
                            onPressed: () {
                              setState(() {
                                _day = DateTime.now().day;
                                _month = DateTime.now().month;
                                _year = DateTime.now().year;
                              });
                            },
                            child: const Text(
                              'Hoy',
                              style: TextStyle(color: Colors.black),
                            ),
                          )))),
                  const SizedBox(width: 40),
                  _calendario()
                ]))
                //_calendario()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Buscar por jornada"),
                SizedBox(
                    // width: 101,
                    height: 35,
                    width: 120,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color.fromRGBO(152, 41, 33, 1)
                            //border: Border.all()
                            ),
                        child: Center(
                          child: DropdownButton(
                              value: _value,
                              items: const [
                                DropdownMenuItem(
                                    value: 1,
                                    child: Text(
                                      "Día",
                                    )),
                                DropdownMenuItem(value: 2, child: Text("Noche"))
                              ],
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value!;
                                });
                              }),
                        )))
              ],
            ),
          ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
              child: FutureBuilder(
            future: generalCollectorsReportsRepository
                .getGeneralCollectorsReportEntityByAdminId(
                    adminId, turns[_value - 1], _day, _month, _year),
            builder: ((BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const PlaneLoading(
                  marginLeft: 0,
                  marginRight: 0,
                );
              } else {
                if (snapshot.data["success"] != null) {
                  return DataTable(
                    columns: buildColumns(),
                    rows: buildRows(snapshot.data["success"]
                        as List<GeneralCollectorReportEntity>),
                  ).fadeAnimation(.5);
                } else {
                  return SizedBox(
                    child: (snapshot.data["message"].toString() ==
                            "No report found for that date and turn")
                        ? SizedBox(
                            width: AppConfigSize.screenWidth,
                            height: AppConfigSize.screenHeight -
                                AppConfigSize.screenHeight * 0.33,
                            child: const Center(
                                child: Text(
                                    "No se encontraron reportes para esa fecha y turno.",
                                    textAlign: TextAlign.center)),
                          )
                        : const Text(
                            "Algo salió mal por favor inténtalo más tarde"),
                  );
                }
              }
            }),
          )),
        ),
      ],
    );
  }

  buildColumns() {
    return const [
      DataColumn(
        label: FittedBox(
          child: Text(
            "Nombre",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            "B",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            "L",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            "P",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            "P",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          child: Text(
            "G",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    ];
  }

  buildRows(List<GeneralCollectorReportEntity> data) {
    // _selected = List<bool>.generate(data.length, (int index) => false);
    // if (_selected.isNotEmpty) {
    //   _selected[0] = true;
    // }

    return data
        .map((generalCollectorReport) => DataRow(
              cells: [
                DataCell(Text(generalCollectorReport.name.toString()),
                    onTap: () {
                  goViewChildrensCollectors(generalCollectorReport.id);
                }),
                DataCell(Text(generalCollectorReport.clean.toString())),
                DataCell(Text(generalCollectorReport.prize.toString())),
                DataCell(Text(generalCollectorReport.wins.toString())),
                DataCell(Text(generalCollectorReport.loses.toString())),
                DataCell(Text(generalCollectorReport.salary.toString()))
              ],
            ))
        .toList();
    /*return [
      DataRow(cells: [
        const DataCell(
          Text("CG1"),
        ),
        DataCell(
          FittedBox(child: Text('test')),
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
    ];*/
  }

  getCollectorsReports() {
    //String userType = GetItMock.prefs.getString("user_type")!;
    //String id = GetItMock.prefs.getString("id")!; //Todo From Constructor
    return generalCollectorsReportsRepository
        .getGeneralCollectorsReportEntityByAdminId(
            adminId, turns[_value - 1], _day, _month, _year);
  }

  void goViewChildrensCollectors(String generalCollectorId) {
    // Navigator.pushNamed(context, page.name);
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ColectorPage(
              generalCollectorId: generalCollectorId,
              turn: turns[_value - 1],
              day: _day,
              month: _month,
              year: _year)),
    );
  }

  Widget _calendario() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            mesInicial == false;
            _selecDate(context);
          });
        },
        child: SizedBox(
          width: 88.0,
          height: 36.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_month_outlined, size: 20.0),
              mesInicial
                  ? Text('$_day / $_month')
                  : Text('$_day / ${_mesLetra(_month.toString())}')
            ],
          ),
        ));
  }

  _selecDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = _fecha.substring(0, 10);
        _day = int.parse(_fecha.substring(8, 10));
        _month = int.parse(_fecha.substring(5, 7));
        _dia = _fecha.substring(8, 10);
        _mes = _fecha.substring(5, 7);
        _year = int.parse(_fecha.substring(0, 4));
        _controlCalendario.text = _mes;
      });
    }
  }

  String _mesLetra(String mes) {
    var pM = mes.length == 1 ? '0$mes' : mes;
    switch (pM) {
      case "01":
        return "Ene";
        break;
      case "02":
        return "Feb";
        break;
      case "03":
        return "Mar";
        break;
      case "04":
        return "Abr";
        break;
      case "05":
        return "May";
        break;
      case "06":
        return "Jun";
        break;
      case "07":
        return "Jul";
        break;
      case "08":
        return "Agost";
        break;
      case "09":
        return "Sept";
        break;
      case "10":
        return "Oct";
        break;
      case "11":
        return "Nov";
        break;
      case "12":
        return "Dic";
        break;
      default:
        return "";
    }
  }
}
