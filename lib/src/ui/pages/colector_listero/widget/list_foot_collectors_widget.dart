import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/widget.dart';

import '../../../../data/services/get_it_mock.dart';
import '../../../../domain/foot_collector_report/entity/foot_collector_report_entity.dart';
import '../../../../infrastructure/foot_collectors_report/datasources/implementation/foot_collectors_reports_repository.dart';
import '../../../../tools/app_config_size.dart';
import '../../../widgets/plane_loading_widget.dart';
import '../../list/page/list_page.dart';

class ListFootCollectorsWidget extends StatefulWidget {
  const ListFootCollectorsWidget(
      {Key? key,
      required this.collectorId,
      required this.turn,
      required this.day,
      required this.month,
      required this.year})
      : super(key: key);
  final String collectorId;
  final String turn;
  final int day;
  final int month;
  final int year;

  @override
  State<ListFootCollectorsWidget> createState() =>
      _ListFootCollectorsWidgetState();
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

class _ListFootCollectorsWidgetState extends State<ListFootCollectorsWidget> {
  var test;
  String collectorId = '';
  final footCollectorsReportsRepository = FootCollectorsReportsRepository();
  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    if (widget.collectorId == '') {
      collectorId = GetItMock.prefs.getString('user_id')!;
      _day = DateTime.now().day;
      _month = DateTime.now().month;
      _year = DateTime.now().year;
    } else {
      collectorId = widget.collectorId;
      _day = widget.day;
      _month = widget.month;
      _year = widget.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppConfigSize().init(context);
    //test = CollectorsReportsProvider().getCollectorsReportsProvider('day.dart',19, 12, 2022);
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
            future: getFootCollectorsReports(collectorId),
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
                    rows: buildRows(snapshot.data["success"]),
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

  buildRows(data) {
    _selected = List<bool>.generate(data.length, (int index) => false);
    if (_selected.isNotEmpty) {
      _selected[0] = true;
    }

    return (data as List<FootCollectorReportEntity>?)
        ?.map((collectorReportEntity) => DataRow(
              cells: [
                DataCell(Text(collectorReportEntity.name.toString()),
                    onTap: () {
                  goViewCurrentTurnsList(collectorReportEntity.id);
                }),
                DataCell(Text(collectorReportEntity.clean.toString())),
                DataCell(Text(collectorReportEntity.prize.toString())),
                DataCell(Text(collectorReportEntity.wins.toString())),
                DataCell(Text(collectorReportEntity.loses.toString())),
                DataCell(Text(collectorReportEntity.loses.toString()))
              ],
            ))
        .toList();
  }

  getFootCollectorsReports(String userId) {
    return footCollectorsReportsRepository
        .getFootCollectorsReportEntityByCollectorId(
            userId, turns[_value - 1], _day, _month, _year);
  }

  void goViewCurrentTurnsList(String userId) {
    // Navigator.pushNamed(context, page.name);
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ListPage(
              footCollectorId: userId,
              turn: turns[_value],
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
