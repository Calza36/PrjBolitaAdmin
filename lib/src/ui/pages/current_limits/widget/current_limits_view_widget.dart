import 'package:flutter/material.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';
import 'package:untitled/src/infrastructure/limitation_config/dtos/current_limited.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../data/services/get_it_mock.dart';
import '../../../../data/util/util.dart';
import '../../../../domain/limitation_queue/entity/limitation_request.dart';
import '../../../../infrastructure/limitation_config/datasources/implementation/limitation_config_repository.dart';
import '../../login/loadin_screen.dart';
import 'limitarB_page.dart';
import 'limitarP_page.dart';

class CurrentLimitsViewWidget extends StatefulWidget {
  const CurrentLimitsViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentLimitsViewWidget> createState() =>
      _CurrentLimitsViewWidgetState();
}

var turns = ["Day", "Night"];
int _value = 1;
FocusNode fn1 = FocusNode();
FocusNode fn2 = FocusNode();
String? userType;

class _CurrentLimitsViewWidgetState extends State<CurrentLimitsViewWidget> {
  var adminId = '';
  final limitationQueueRepository = LimitationConfigRepository();
  bool flatModified = false;
  List<String> numbers = [];
  List<String> parletDay = [];
  List<String> numberNight = [];
  List<String> parletNight = [];
  bool eliminando = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 5),
        pre(),
        FutureBuilder(
          future: limitationQueueRepository.getCurrentLimited(),
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return mockUi();
              // return const PlaneLoading(
              //   marginLeft: 0,
              //   marginRight: 0,
              // );
            } else {
              if (snapshot.data["success"] != null) {
                //return buildListBolasLimitadas(snapshot.data["success"] asList<LimitationQueueEntity>);
                return buildLimited(snapshot.data["success"] as CurrentLimited);
              } else {
                // if (snapshot.data["message"] ==
                //     "No limiteds found for that date and turn") {
                //   return buildLimited(CurrentLimited(numbers: [], parlets: []));
                // }
                return SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          child: Text(snapshot.data["message"].toString())),
                    ],
                  ),
                );
              }
            }
          }),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    userType = GetItMock.prefs.getString("user_type");
    adminId = GetItMock.prefs.getString('user_id')!;
  }

  showAlertDelete(BuildContext context, String programmingId) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Eliminar Limitados de este día.",
            ),
            content: const Text(
              "Está seguro que quiere eliminar los Limitados de este día?",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                  )),
              ElevatedButton(
                onPressed: () {
                  //context.goNamed(AppPages.login.name);
                  Navigator.of(context).pop();
                  save(programmingId);
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Aceptar'),
              ),
            ],
          );
        });
  }

  Future<void> save(String programmingId) async {
    showAlertSaving(context, programmingId);
    var result = await limitationQueueRepository
        .deleteLimitationQueueById(programmingId);
    result['success'] != null ? success() : fail(result);
  }

  success() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Guardado correctamente."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.of(context).pop();
    setState(() {});
  }

  showAlertSaving(BuildContext context, String programmingId) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Guardando...",
            ),
            content: Text(
              "Se están eliminando límites: $programmingId",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: const <Widget>[],
          );
        });
  }

  fail(Map<String, dynamic> result) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error al intentar eliminar. ${result['message']}"),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget buildLimited(CurrentLimited data) {
    // final canEditLimited = canEdit();
    // return canEditLimited ? editableUi(data) : unEditableUi(data);
    return unEditableUi(data);
  }

  pre() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text("Turno actual: ",style: TextStyle(fontSize: 24), ),
            Text( (DateTime.now
              ().hour < 14) ? "Día":
            "Noche",style: const TextStyle(fontSize: 24),),
          ],
        ),
      ]),
    );
  }

  TextEditingController tecNumero = TextEditingController();
  TextEditingController tecPar1 = TextEditingController();
  TextEditingController tecPar2 = TextEditingController();
  LimitsEntity? newCurrentLimitedEntity;

  addBola(BuildContext context, LimitsEntity currentLimitedEntity) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text(
            "Agregar número a limitar",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    width: 50,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color.fromRGBO(152, 41, 33, 1)),
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
                        TextField(
                          enableInteractiveSelection: false,
                          showCursor: false,
                          controller: tecNumero,
                          keyboardType: TextInputType.number,
                          style:
                              const TextStyle(fontSize: 35, letterSpacing: 2),
                          maxLines: 1,
                          onChanged: (value) {
                            if (value.length > 2) {
                              tecNumero.value = TextEditingValue(
                                  text: tecNumero.text.substring(0, 2));
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
                        )
                      ],
                    )),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                agregarBola(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  deleteBola(BuildContext context, LimitsEntity currentLimitedEntity) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text(
            "Retirar número limitado.",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    width: 50,
                    height: 72,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color.fromRGBO(152, 41, 33, 1)),
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
                        TextField(
                          enableInteractiveSelection: false,
                          showCursor: false,
                          controller: tecNumero,
                          keyboardType: TextInputType.number,
                          style:
                              const TextStyle(fontSize: 35, letterSpacing: 2),
                          maxLines: 1,
                          onChanged: (value) {
                            if (value.length > 2) {
                              tecNumero.value = TextEditingValue(
                                  text: tecNumero.text.substring(0, 2));
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
                        )
                      ],
                    )),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                eliminarBola(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  addPar(BuildContext context, LimitsEntity currentLimitedEntity) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text(
            "Agregar par a limitar",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: 50,
                        height: 72,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromRGBO(152, 41, 33, 1)),
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
                            TextField(
                              focusNode: fn1,
                              enableInteractiveSelection: false,
                              showCursor: false,
                              controller: tecPar1,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 35, letterSpacing: 2),
                              maxLines: 1,
                              onChanged: (value) {
                                if (value.length >= 2) {
                                  tecPar1.value = TextEditingValue(
                                      text: tecPar1.text.substring(0, 2));
                                  FocusScope.of(context).requestFocus(fn2);
                                }
                              },
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: 50,
                        height: 72,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromRGBO(152, 41, 33, 1)),
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
                            TextField(
                              focusNode: fn2,
                              enableInteractiveSelection: false,
                              showCursor: false,
                              controller: tecPar2,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 35, letterSpacing: 2),
                              maxLines: 1,
                              onChanged: (value) {
                                if (value.length >= 2) {
                                  tecPar2.value = TextEditingValue(
                                      text: tecPar2.text.substring(0, 2));
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                agregarPar(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  deletePar(BuildContext context, LimitsEntity currentLimitedEntity) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text(
            "Retirar parlet limitado",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: 50,
                        height: 72,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromRGBO(152, 41, 33, 1)),
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
                            TextField(
                              focusNode: fn1,
                              enableInteractiveSelection: false,
                              showCursor: false,
                              controller: tecPar1,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 35, letterSpacing: 2),
                              maxLines: 1,
                              onChanged: (value) {
                                if (value.length >= 2) {
                                  tecPar1.value = TextEditingValue(
                                      text: tecPar1.text.substring(0, 2));
                                  FocusScope.of(context).requestFocus(fn2);
                                }
                              },
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: 50,
                        height: 72,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromRGBO(152, 41, 33, 1)),
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
                            TextField(
                              focusNode: fn2,
                              enableInteractiveSelection: false,
                              showCursor: false,
                              controller: tecPar2,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 35, letterSpacing: 2),
                              maxLines: 1,
                              onChanged: (value) {
                                if (value.length >= 2) {
                                  tecPar2.value = TextEditingValue(
                                      text: tecPar2.text.substring(0, 2));
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                eliminarPar(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void agregarBola(LimitsEntity currentLimitedEntity) {
    if (currentLimitedEntity.numbers!.contains(tecNumero.text) ||
        currentLimitedEntity.numbers!.contains("0${tecNumero.text}")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ya esta limitado."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      List<String> list = <String>[];
      list.addAll(currentLimitedEntity.numbers!);
      list.add(
          (tecNumero.text.length == 2) ? tecNumero.text : "0${tecNumero.text}");
      newCurrentLimitedEntity = LimitsEntity(
        numbers: list,
        parlets: currentLimitedEntity.parlets,
      );
      tecNumero = TextEditingController();
      // if (currentLimitedEntity.id != '') {
      //   goEdit(newCurrentLimitedEntity!);
      // } else {
      //   goCreate(
      //       _day, _month, _year, turns[_value - 1], newCurrentLimitedEntity!);
      // }
    }

    tecNumero = TextEditingController();
  }

  void eliminarBola(LimitsEntity currentLimitedEntity) {
    if (currentLimitedEntity.numbers!.contains(tecNumero.text) ||
        currentLimitedEntity.numbers!.contains("0${tecNumero.text}")) {
      List<String> list = <String>[];
      list.addAll(currentLimitedEntity.numbers!);

      list.remove(
          (tecNumero.text.length == 2) ? tecNumero.text : "0${tecNumero.text}");

      newCurrentLimitedEntity = LimitsEntity(
        numbers: list,
        parlets: currentLimitedEntity.parlets,
      );
      tecNumero = TextEditingController();

      goEdit(newCurrentLimitedEntity!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Este número no esta limitado."),
          duration: Duration(seconds: 2),
        ),
      );
    }

    tecNumero = TextEditingController();
  }

  void agregarPar(LimitsEntity currentLimitedEntity) {
    String bola1 =
        (tecPar1.text.length == 2) ? tecPar1.text : "0${tecPar1.text}";
    String bola2 =
        (tecPar2.text.length == 2) ? tecPar2.text : "0${tecPar2.text}";

    final parle = (int.parse(bola1) > int.parse(bola2))
        ? '$bola2,$bola1'
        : '$bola1,$bola2';

    if (currentLimitedEntity.parlets!.contains(parle)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ya esta limitado."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      List<String> list = <String>[];
      list.addAll(currentLimitedEntity.parlets!);
      list.add(parle);
      newCurrentLimitedEntity = LimitsEntity(
        numbers: currentLimitedEntity.numbers,
        parlets: list,
      );
      tecPar1 = TextEditingController();
      tecPar2 = TextEditingController();
      goEdit(newCurrentLimitedEntity!);
    }
  }

  void eliminarPar(LimitsEntity currentLimitedEntity) {
    String bola1 =
        (tecPar1.text.length == 2) ? tecPar1.text : "0${tecPar1.text}";
    String bola2 =
        (tecPar2.text.length == 2) ? tecPar2.text : "0${tecPar2.text}";

    final parle = (int.parse(bola1) > int.parse(bola2))
        ? '$bola2,$bola1'
        : '$bola1,$bola2';

    if (!currentLimitedEntity.parlets!.contains(parle)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Parlet no limitado."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      List<String> list = <String>[];
      list.addAll(currentLimitedEntity.parlets!);
      list.remove(parle);
      newCurrentLimitedEntity = LimitsEntity(
        numbers: currentLimitedEntity.numbers,
        parlets: list,
      );
      tecPar1 = TextEditingController();
      tecPar2 = TextEditingController();
      goEdit(newCurrentLimitedEntity!);
    }
  }

  Widget numberLimitados(int index, List<String> numberList) {
    return GestureDetector(
      onTap: () {
        setState(() {
          (_value == 1) ? numbers.removeAt(index) : numberNight.removeAt(index);
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(152, 41, 33, 1),
            borderRadius: BorderRadius.circular(50)),
        child: Stack(
          children: [
            Positioned(
              top: 1,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    (_value == 1)
                        ? numbers.removeAt(index)
                        : numberNight.removeAt(index);
                  });
                },
                child: const Icon(
                  Icons.delete,
                  size: 50,
                  color: Colors.white38,
                ),
              ),
            ),
            Center(
              child: Text(
                numberList[index].toString().trim(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget parleLimitados(int index, List<String> parleList) {
    return GestureDetector(
      onTap: () {
        setState(() {
          (_value == 1)
              ? parletDay.removeAt(index)
              : parletNight.removeAt(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: 38,
          height: 64,
          margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(152, 41, 33, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 19,
                right: -5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      (_value == 1)
                          ? parletDay.removeAt(index)
                          : parletNight.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 50,
                    color: Colors.white38,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    parleList[index].toString().trim().replaceAll(',', ''),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  yaHaPasado() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Ya ha pasado, no se puede editar."),
        duration: Duration(seconds: 2),
      ),
    );
  }

  limitadosEnUso() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Limitados en Uso. No se puede "
            "editar."),
        duration: Duration(seconds: 2),
      ),
    );
  }

  mockUi() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                height: 250,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: const <Widget>[
                        SizedBox(height: 5),
                        Text(
                          "Fijos y Corridos limitados",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      ],
                    ),
                  ),
                )
                /* LimitarB(
                numberSizeDay: data.numbers!.length,
                numberListDay: data.numbers!.toList(),
              ),*/
                ),
            if (userType == 'Admin')
              Positioned(
                bottom: 25,
                right: 15,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline_outlined,
                          size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
          ],
        ),
        Stack(
          children: [
            SizedBox(
              height: 250,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: const <Widget>[
                      SizedBox(height: 5),
                      Text(
                        "Parle limitados",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (userType == 'Admin')
              Positioned(
                bottom: 25,
                right: 15,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline_outlined,
                          size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }

  editableUi(LimitsEntity currentLimitedEntity) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                height: 250,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 5),
                        const Text(
                          "Fijos y Corridos limitados",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: 15),
                            const SizedBox(height: 5),
                            currentLimitedEntity.numbers!.isEmpty
                                ? const Text(
                                    "   No hay limitados en este turno")
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 3),
                                        Wrap(
                                          children: List.generate(
                                              currentLimitedEntity
                                                  .numbers!.length, (index) {
                                            return numberLimitadosDay(index,
                                                currentLimitedEntity.numbers!);
                                          }),
                                        ),
                                      ],
                                    )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                /* LimitarB(
                numberSizeDay: data.numbers!.length,
                numberListDay: data.numbers!.toList(),
              ),*/
                ),
            if (userType == 'Admin')
              Positioned(
                bottom: 25,
                right: 15,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                      onPressed: () {
                        deleteBola(context, currentLimitedEntity);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline_outlined,
                          size: 30),
                      onPressed: () {
                        addBola(context, currentLimitedEntity);
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
        Stack(
          children: [
            SizedBox(
              height: 250,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 5),
                      const Text(
                        "Parle limitados",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 15),
                          currentLimitedEntity.parlets!.isEmpty
                              ? const Text(
                                  "   No hay limitados en este turno",
                                )
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 3),
                                      Wrap(
                                        children: List.generate(
                                            currentLimitedEntity
                                                .parlets!.length, (index) {
                                          return parleLimitadosDay(index,
                                              currentLimitedEntity.parlets!);
                                        }),
                                      ),
                                    ],
                                  )),
                          /* const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 5),
                    Text(
                      "Noche:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (userType == 'Admin')
              Positioned(
                bottom: 25,
                right: 15,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                      onPressed: () {
                        deletePar(context, currentLimitedEntity);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline_outlined,
                          size: 30),
                      onPressed: () {
                        addPar(context, currentLimitedEntity);
                      },
                    ),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }

  unEditableUi(CurrentLimited data) {
    if (DateTime.now().hour < 14) {
      return Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: LimitarB(
                  numberSizeDay: data.nightLimited!.numbers!.length,
                  numberListDay: data.nightLimited!.numbers!.toList(),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: LimitarP(
                  parleSizeDay: data.nightLimited!.parlets!.length,
                  parleListDay: data.nightLimited!.parlets!.toList(),
                ),
              ),
            ],
          )
        ],
      );
    } else if (DateTime.now().hour >= 14) {
      return Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: LimitarB(
                  numberSizeDay: data.nightLimited!.numbers!.length,
                  numberListDay: data.nightLimited!.numbers!.toList(),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: LimitarP(
                  parleSizeDay: data.nightLimited!.parlets!.length,
                  parleListDay: data.nightLimited!.parlets!.toList(),
                ),
              ),
            ],
          )
        ],
      );
    } else
      return Container();
  }

  Widget numberLimitadosDay(index, List numberListDay) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(152, 41, 33, 1),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        numberListDay[index].toString().trim(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget parleLimitadosDay(int index, List parleListDay) {
    return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: 36,
          height: 60,
          margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(152, 41, 33, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 4,
            ),
            child:
                Text(parleListDay[index].toString().trim().replaceAll(',', ''),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
          )),
        ));
  }

  bool isBeforeToday(
    int day,
    int month,
    int year,
  ) {
    final now = DateTime.now();
    final date = DateTime(year, month, day);
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }

  bool isPast6AM() {
    final now = DateTime.now();
    final sixAM = DateTime(now.year, now.month, now.day, 6, 0, 0);
    return now.isAfter(sixAM);
  }

  bool isPast1PM() {
    final horaActual = DateTime.now().hour;
    return horaActual >= 13;
  }

  bool isToday(
    int day,
    int month,
    int year,
  ) {
    final now = DateTime.now();
    final date = DateTime(year, month, day);
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  Future<void> goEdit(LimitsEntity newCurrentLimitedEntity) async {
    //showAlertEdit(context, newCurrentLimitedEntity);
    LoadingScreen.show(context, "Actualizando, por favor espere...");
    try {
      var result = await limitationQueueRepository
          .editLimitation(newCurrentLimitedEntity);
      if (result["success"] != null) {
        success();
      } else {
        fail(result["message"]);
      }
    } catch (e) {
      printS("Error $e");
      LoadingScreen.hide(context);
      alert(context, "Revise su conexión a internet");
    }
  }

  Future<void> goCreate(int day, int month, int year, String turn,
      LimitsEntity newCurrentLimitedEntity) async {
    //showAlertEdit(context, newCurrentLimitedEntity);
    LoadingScreen.show(context, "Actualizando, por favor espere...");
    try {
      LimitationRequestEntity limitationRequestEntity = LimitationRequestEntity(
        turn: turn,
        day: day,
        month: month,
        year: year,
        numberDay:
            turn == 'Day' ? newCurrentLimitedEntity.numbers! : <String>[],
        parletDay:
            turn == 'Day' ? newCurrentLimitedEntity.parlets! : <String>[],
        numberNight:
            turn == 'Night' ? newCurrentLimitedEntity.numbers! : <String>[],
        parletNight:
            turn == 'Night' ? newCurrentLimitedEntity.parlets! : <String>[],
      );
      var result = await limitationQueueRepository
          .addLimitation(limitationRequestEntity);
      if (result["success"] != null) {
        success();
      } else {
        fail(result["message"]);
      }
    } catch (e) {
      printS("Error $e");
      LoadingScreen.hide(context);
      alert(context, "Revise su conexión a internet");
    }
  }
}
