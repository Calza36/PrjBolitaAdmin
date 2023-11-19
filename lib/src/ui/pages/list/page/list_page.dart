import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';

import '../../../../data/models/centena_obtain_model.dart';
import '../../../../data/models/fijo_corrido_obtain_model.dart';
import '../../../../data/models/parle_obtain_model.dart';
import '../../../../infrastructure/lista/providers/list_provider.dart';
import '../../../../tools/app_config_size.dart';
import '../../../widgets/plane_loading_widget.dart';

class ListPage extends StatefulWidget {
  const ListPage(
      {super.key,
      required this.footCollectorId,
      required this.turn,
      required this.day,
      required this.month,
      required this.year});

  final String footCollectorId;
  final String turn;
  final int day;
  final int month;
  final int year;
  //turn, day, month, year

  @override
  State<ListPage> createState() => _ListPageState();
}

bool mesInicial = false;
DateTime date = DateTime.now();
int _day = date.day;
int _month = date.month;
int _year = date.year;
String _fecha = "";
String _dia = DateTime.now().toString().substring(0, 10).substring(8, 10);
String _mes = DateTime.now().toString().substring(0, 10).substring(5, 7);
TextEditingController _controlCalendario = TextEditingController();

var turns = ["Day", "Night"];
int _value = 1;

class _ListPageState extends State<ListPage> {
  late List<FijoCorridoObtainModel> fijos = [];
  late List<CentenaObtainModel> centenas = [];
  late List<ParleObtainModel> parles = [];
  final currency = NumberFormat("#,##0.00", "en_US");

  var size = 0;
  int iCentena = 0;
  int iParle = 0;
  int cen = -1;
  int parle = -1;
  var userId = '';

  final betsProvider = ListProvider();
  var bets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.footCollectorId == '') {
      userId = GetItMock.prefs.getString('user_id')!;
    } else {
      userId = widget.footCollectorId;
    }
    if (widget.turn == '') {
    } else {
      _value = turns.indexOf(widget.turn);
      _day = widget.day;
      _month = widget.month;
      _year = widget.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppConfigSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            /*IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ),*/
            Center(child: Text(" Lista del:__/__/__")),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            /*const Text(
              "Resumen",
              style: TextStyle(
                  color: Color.fromRGBO(152, 41, 33, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Text(
              "Bruto, Limpio, Premio, Pierde y Gana",
              style: TextStyle(color: Color.fromRGBO(152, 41, 33, 1)),
            ),
            const SizedBox(height: 5),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Buscar por fecha"),
                Container(child: _calendario())
                //_calendario()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Buscar por jornada"),
                Container(
                  // width: 101,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromRGBO(152, 41, 33, 1),
                    //border: Border.all()
                  ),
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
                )
              ],
            ),
            const SizedBox(height: 5),
            FutureBuilder(
              future: betsProvider.obtenerLista(
                  userId, turns[_value - 1], _day, _month, _year),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const PlaneLoading(
                    marginLeft: 10,
                    marginRight: 10,
                  );
                } else {
                  if (snapshot.data != null) {
                    return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RichText(
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                    const TextSpan(
                                      text: "B:",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    TextSpan(
                                        text: "${_texto(snapshot.data.bruto)}",
                                        style: const TextStyle(fontSize: 14)),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                    const TextSpan(
                                        text: "L:",
                                        style: TextStyle(fontSize: 24)),
                                    TextSpan(
                                        text: "${_texto(snapshot.data.limpio)}",
                                        style: const TextStyle(fontSize: 14)),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                    const TextSpan(
                                        text: "P:",
                                        style: TextStyle(fontSize: 24)),
                                    TextSpan(
                                        text: "${_texto(snapshot.data.premio)}",
                                        style: const TextStyle(fontSize: 14)),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                    const TextSpan(
                                        text: "P:",
                                        style: TextStyle(fontSize: 24)),
                                    TextSpan(
                                        text: "${_texto(snapshot.data.pierde)}",
                                        style: const TextStyle(fontSize: 14)),
                                  ])),
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: "G:",
                                          style: TextStyle(fontSize: 24)),
                                      TextSpan(
                                          text: "${_texto(snapshot.data.gana)}",
                                          style: const TextStyle(fontSize: 14)),
                                    ]),
                              ),
                            ],
                          ),
                        )));
                  } else {
                    return SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: "B: ",
                                  style: TextStyle(fontSize: 24),
                                ),
                                TextSpan(
                                    text: "-", style: TextStyle(fontSize: 14)),
                              ])),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "L: ",
                                    style: TextStyle(fontSize: 24)),
                                TextSpan(
                                    text: "-", style: TextStyle(fontSize: 14)),
                              ])),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "P: ",
                                    style: TextStyle(fontSize: 24)),
                                TextSpan(
                                    text: "-", style: TextStyle(fontSize: 14)),
                              ])),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "P: ",
                                    style: TextStyle(fontSize: 24)),
                                TextSpan(
                                    text: "-", style: TextStyle(fontSize: 14)),
                              ])),
                          RichText(
                            text: const TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "G: ",
                                      style: TextStyle(fontSize: 24)),
                                  TextSpan(
                                      text: "-",
                                      style: TextStyle(fontSize: 14)),
                                ]),
                          )
                        ],
                      ),
                    );
                  }
                }
              }),
            ),
            const Divider(
              height: 2,
            ),
            FutureBuilder(
              future: betsProvider.obtenerLista(
                  userId, turns[_value - 1], _day, _month, _year),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const PlaneLoading(
                    marginLeft: 10,
                    marginRight: 10,
                  );
                } else {
                  if (snapshot.data != null) {
                    var sub1Pick4 =
                        snapshot.data.shot.pick4.toString().substring(0, 2);
                    var sub2Pick4 =
                        snapshot.data.shot.pick4.toString().substring(2, 4);
                    return Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Text(
                                      (snapshot.data.shot.pick3 == "null")
                                          ? "~~~ ~~ ~~"
                                          : "${snapshot.data.shot.pick3}\t\t$sub1Pick4\t$sub2Pick4",
                                      //"123\t\t04\t22",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.listOfListDto.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _jugadas(index, snapshot.data);
                          },
                        )
                      ],
                    );
                  } else {
                    return const SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(child: Text("-\t\t-")),
                        ],
                      ),
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacementNamed(context, "home");
    // await showDialog or Show add banners or whatever
    // then
    return Future.value(true);
  }

  Widget _calendario() {
    return ElevatedButton(
        onPressed: () {
          mesInicial == true;
          _selecDate(context);
        },
        child: SizedBox(
          width: 80.0,
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_month_outlined, size: 20.0),
              mesInicial
                  ? Text('$_dia / $_mes')
                  : Text('$_dia / ${_mesLetra(_mes)}')
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
    switch (mes) {
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

  _texto(data) {
    if (data == null || data.toString() == "0.00") {
      return "-";
    } else {
      return data.toString().split(".00")[0];
    }
  }

  Widget _jugadas(int index, snapshot) {
    if (snapshot != null) {
      if (index % 2 == 0) {
        return Container(
          width: double.infinity,
          color: const Color.fromRGBO(33, 150, 243, 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _combinarJugada(index, snapshot),
          ),
        );
      } else {
        return Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _combinarJugada(index, snapshot),
          ),
        );
      }
    } else {
      return const SizedBox();
    }
  }

  _combinarJugada(int index, snapshot) {
    if (snapshot.listOfListDto[index].elementType == "normal") {
      return _jugadasSimpel(snapshot.listOfListDto[index], context);
    } else if (snapshot.listOfListDto[index].elementType == "decena") {
      return _jugadaDecena(snapshot.listOfListDto[index], context);
    } else if (snapshot.listOfListDto[index].elementType == "terminal") {
      return _jugadaTerminal(snapshot.listOfListDto[index], context);
    } else if (snapshot.listOfListDto[index].elementType == "centena") {
      return _jugadaCentena(snapshot.listOfListDto[index], context);
    } else if (snapshot.listOfListDto[index].elementType == "parle") {
      return _jugadasCandado(snapshot.listOfListDto[index], context);
    } else if (snapshot.listOfListDto[index].elementType == "candado") {
      return _jugadasCandado(snapshot.listOfListDto[index], context);
    }
    return const SizedBox();
  }

  Widget _jugadaDecena(jm, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            "D${jm.number}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  jm.fijo.toString(),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  jm.corrido,
                ),
              ],
            ),
          ),
          const SizedBox(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_prize(jm.prize)),
            ),
          )
        ],
      ),
    );
  }

  Widget _jugadaTerminal(jm, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            "T${jm.number}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  jm.fijo,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  jm.corrido,
                ),
              ],
            ),
          ),
          const SizedBox(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_prize(jm.prize)),
            ),
          )
        ],
      ),
    );
  }

  _getNumbersCandado(numbers) {
    var number = "";
    var n = "";
    var result = "";
    for (int i = 0; i < numbers.length; i++) {
      n = numbers[i];
      if (n.length < 2) {
        number = "0$n";
      } else {
        number = n;
      }
      result = "$result\n$number";
    }
    return result;
  }

  Widget _jugadasCandado(jm, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            "${_getNumbersCandado(jm.numbers).trim()}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(width: 28.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(jm.bet.toString()),
              ],
            ),
          ),
          const SizedBox(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_prize(jm.prize)),
            ),
          )
        ],
      ),
    );
  }

  Widget _jugadasSimpel(j, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            _simpleNumber(j.number.toString()),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  j.fijo.toString(),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  j.corrido.toString(),
                ),
              ],
            ),
          ),
          const SizedBox(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_prize(j.prize)),
            ),
          )
        ],
      ),
    );
  }

  Widget _jugadaCentena(snapshot, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            _centenaNumber(snapshot.number.toString()),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(width: 8.0),
          const Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snapshot.bet.toString(),
                ),
              ],
            ),
          ),
          const SizedBox(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_prize(snapshot.prize)),
            ),
          )
        ],
      ),
    );
  }

  String _prize(prize) {
    if (prize == "0") {
      return "";
    } else {
      return "\$ ${currency.format(double.parse(prize))}";
    }
  }

  String _centenaNumber(String string) {
    if (string.length == 2) {
      return "0$string";
    } else if (string.length < 2) {
      return "00$string";
    } else {
      return string;
    }
  }

  String _simpleNumber(String string) {
    if (string.length < 2) {
      return "0$string";
    } else {
      return string;
    }
  }
}
