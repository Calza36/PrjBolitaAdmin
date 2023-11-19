import 'package:flutter/material.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity'
    '.dart';
import 'package:untitled/src/infrastructure/limitation_config/dtos/next_limited.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../data/services/get_it_mock.dart';
import '../../../../data/util/util.dart';
import '../../../../infrastructure/limitation_config/datasources/implementation/limitation_config_repository.dart';
import '../../login/loadin_screen.dart';

class NextLimitsViewWidget extends StatefulWidget {
  const NextLimitsViewWidget({
    super.key,
  });

  @override
  State<NextLimitsViewWidget> createState() => _NextLimitsViewWidgetState();
}

var turns = ["Day", "Night"];
int _value = 1;
FocusNode fn1 = FocusNode();
FocusNode fn2 = FocusNode();
String? userType;

class _NextLimitsViewWidgetState extends State<NextLimitsViewWidget> {
  var adminId = '';
  final limitationQueueRepository = LimitationConfigRepository();
  bool flatModified = false;
  List<String> numbers = [];
  List<String> parletDay = [];
  List<String> numberNight = [];
  List<String> parletNight = [];
  bool eliminando = false;

  @override
  void initState() {
    super.initState();
    userType = GetItMock.prefs.getString("user_type");
    adminId = GetItMock.prefs.getString('user_id')!;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 5),
        pre(),
        FutureBuilder(
          future: limitationQueueRepository.getNextLimited(),
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return mockUi();
            } else {
              if (snapshot.data["success"] != null) {
                return editableUi(snapshot.data["success"] as NextLimited);
              } else {
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

  pre() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Seleccionar turno ",
              style: TextStyle(fontSize: 20),
            ),
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
                          style: const TextStyle(
                              backgroundColor: Colors.transparent,
                              color: Colors.black54,
                              decorationColor: Colors.transparent),
                          value: _value,
                          items: const [
                            DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  "Día",
                                  style: TextStyle(fontSize: 20),
                                )),
                            DropdownMenuItem(
                                value: 2,
                                child: Text(
                                  "Noche",
                                  style: TextStyle(fontSize: 20),
                                ))
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
    );
  }

  TextEditingController tecNumero = TextEditingController();
  TextEditingController tecPar1 = TextEditingController();
  TextEditingController tecPar2 = TextEditingController();
  LimitsEntity? newCurrentLimitedEntity;

  addBolaNexDayDay(BuildContext context, Limited currentLimitedEntity) {
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
                agregarBolaNextDayDay(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  deleteBolaNextDayDay(BuildContext context, Limited currentLimitedEntity) {
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
                eliminarBolaNextDayDay(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  addBolaNexDayNight(BuildContext context, Limited currentLimitedEntity) {
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
                agregarBolaNextDayNight(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  deleteBolaNextDayNight(BuildContext context, Limited currentLimitedEntity) {
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
                eliminarBolaNextDayNight(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void agregarBolaNextDayDay(Limited currentLimitedEntity) {
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
      goEditNextDayDay(newCurrentLimitedEntity!);
      // } else {
      //   goCreate(
      //       _day, _month, _year, turns[_value - 1], newCurrentLimitedEntity!);
      // }
    }

    tecNumero = TextEditingController();
  }

  void eliminarBolaNextDayDay(Limited currentLimitedEntity) {
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

      goEditNextDayDay(newCurrentLimitedEntity!);
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

  void agregarBolaNextDayNight(Limited currentLimitedEntity) {
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
      goEditNextDayNight(newCurrentLimitedEntity!);
      // } else {
      //   goCreate(
      //       _day, _month, _year, turns[_value - 1], newCurrentLimitedEntity!);
      // }
    }

    tecNumero = TextEditingController();
  }

  void eliminarBolaNextDayNight(Limited currentLimitedEntity) {
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

      goEditNextDayNight(newCurrentLimitedEntity!);
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

  addParNexDayDay(BuildContext context, Limited currentLimitedEntity) {
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
                agregarParNexDayDay(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  deleteParNexDayDay(BuildContext context, Limited currentLimitedEntity) {
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
                eliminarParNexDayDay(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  addParNexDayNight(BuildContext context, Limited currentLimitedEntity) {
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
                agregarParNexDayNight(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  deleteParNexDayNight(BuildContext context, Limited currentLimitedEntity) {
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
                eliminarParNexDayNight(currentLimitedEntity);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void agregarParNexDayDay(Limited currentLimitedEntity) {
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
      goEditNextDayDay(newCurrentLimitedEntity!);
    }
  }

  void eliminarParNexDayDay(Limited currentLimitedEntity) {
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
      goEditNextDayDay(newCurrentLimitedEntity!);
    }
  }

  void agregarParNexDayNight(Limited currentLimitedEntity) {
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
      goEditNextDayNight(newCurrentLimitedEntity!);
    }
  }

  void eliminarParNexDayNight(Limited currentLimitedEntity) {
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
      goEditNextDayNight(newCurrentLimitedEntity!);
    }
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
                    child: const Column(
                      children: <Widget>[
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
                  child: const Column(
                    children: <Widget>[
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

  editableUi(NextLimited currentLimitedEntity) {
    if (_value == 1) {
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
                              currentLimitedEntity.dayLimited!.numbers!.isEmpty
                                  ? const Text(
                                      "   No hay limitados en este turno")
                                  : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 3),
                                          Wrap(
                                            children: List.generate(
                                                currentLimitedEntity.dayLimited!
                                                    .numbers!.length, (index) {
                                              return numberLimitadosDay(
                                                  index,
                                                  currentLimitedEntity
                                                      .dayLimited!.numbers!);
                                            }),
                                          ),
                                        ],
                                      )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              if (userType == 'Admin')
                Positioned(
                  bottom: 25,
                  right: 15,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, size: 30),
                        onPressed: () {
                          deleteBolaNextDayDay(
                              context, currentLimitedEntity.dayLimited!);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline_outlined,
                            size: 30),
                        onPressed: () {
                          addBolaNexDayDay(
                              context, currentLimitedEntity.dayLimited!);
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
                            currentLimitedEntity.dayLimited!.parlets!.isEmpty
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
                                              currentLimitedEntity.dayLimited!
                                                  .parlets!.length, (index) {
                                            return parleLimitadosDay(
                                                index,
                                                currentLimitedEntity
                                                    .dayLimited!.parlets!);
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
                          deleteParNexDayDay(
                              context, currentLimitedEntity.dayLimited!);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline_outlined,
                            size: 30),
                        onPressed: () {
                          addParNexDayDay(
                              context, currentLimitedEntity.dayLimited!);
                        },
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      );
    } else {
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
                            "Fijos y Corridos limitados para la Noche",
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
                              currentLimitedEntity
                                      .nightLimited!.numbers!.isEmpty
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
                                                    .nightLimited!
                                                    .numbers!
                                                    .length, (index) {
                                              return numberLimitadosDay(
                                                  index,
                                                  currentLimitedEntity
                                                      .nightLimited!.numbers!);
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
                          deleteBolaNextDayNight(
                              context, currentLimitedEntity.nightLimited!);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline_outlined,
                            size: 30),
                        onPressed: () {
                          addBolaNexDayNight(
                              context, currentLimitedEntity.nightLimited!);
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
                            currentLimitedEntity.nightLimited!.parlets!.isEmpty
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
                                              currentLimitedEntity.nightLimited!
                                                  .parlets!.length, (index) {
                                            return parleLimitadosDay(
                                                index,
                                                currentLimitedEntity
                                                    .nightLimited!.parlets!);
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
                          deleteParNexDayNight(
                              context, currentLimitedEntity.nightLimited!);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline_outlined,
                            size: 30),
                        onPressed: () {
                          addParNexDayNight(
                              context, currentLimitedEntity.nightLimited!);
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

  Future<void> goEditNextDayDay(LimitsEntity newCurrentLimitedEntity) async {
    LoadingScreen.show(context, "Actualizando, por favor espere...");
    try {
      var result = await limitationQueueRepository
          .updateNextDayLimited(newCurrentLimitedEntity);
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

  Future<void> goEditNextDayNight(LimitsEntity newCurrentLimitedEntity) async {
    //showAlertEdit(context, newCurrentLimitedEntity);
    LoadingScreen.show(context, "Actualizando, por favor espere...");
    try {
      var result = await limitationQueueRepository
          .updateNextNightLimited(newCurrentLimitedEntity);
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
