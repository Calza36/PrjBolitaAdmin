import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../data/services/get_it_mock.dart';
import '../../../infrastructure/shoot/dtos/index.dart';
import '../../../infrastructure/shoot/providers/payload/shoot_payload.dart';
import '../../../tools/app_config_size.dart';

class TiradaManager extends StatefulWidget {
  const TiradaManager({super.key});

  @override
  State<TiradaManager> createState() => _TiradaManagerState();
}

class _TiradaManagerState extends State<TiradaManager> {
  TextEditingController tec31 = TextEditingController();
  TextEditingController tec32 = TextEditingController();
  TextEditingController tec33 = TextEditingController();
  TextEditingController tec41 = TextEditingController();
  TextEditingController tec42 = TextEditingController();
  TextEditingController tec43 = TextEditingController();
  TextEditingController tec44 = TextEditingController();
  TextEditingController tec51 = TextEditingController();
  TextEditingController tec52 = TextEditingController();
  TextEditingController tec53 = TextEditingController();
  TextEditingController tec54 = TextEditingController();
  TextEditingController tec55 = TextEditingController();
  Map<String, bool> controlSelect = {
    '31': false,
    '32': false,
    '33': false,
    '41': false,
    '42': false,
    '43': false,
    '44': false,
    '51': false,
    '52': false,
    '53': false,
    '54': false,
    '55': false
  };
  Map<String, FocusNode?> controlFocus = {
    '31': null,
    '32': null,
    '33': null,
    '41': null,
    '42': null,
    '43': null,
    '44': null
  };
  FocusNode fn31 = FocusNode();
  FocusNode fn32 = FocusNode();
  FocusNode fn33 = FocusNode();
  FocusNode fn41 = FocusNode();
  FocusNode fn42 = FocusNode();
  FocusNode fn43 = FocusNode();
  FocusNode fn44 = FocusNode();

  @override
  void initState() {
    super.initState();
    controlFocus = {
      '31': fn31,
      '32': fn32,
      '33': fn33,
      '41': fn41,
      '42': fn42,
      '43': fn43,
      '44': fn44,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (GetItMock.prefs.getBool("tirada_enviada") == null) {
      GetItMock.prefs.setBool("tirada_enviada", false);
    }
    if (GetItMock.prefs.getString("tirada_enviada_at") == null) {
      GetItMock.prefs.setString("tirada_enviada_at", '');
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Enviar Tirada"),
        actions: [
          IconButton(
            onPressed: () {
              if (!_validatorIsReady()) {
                setState(() {
                  alertEmptyBalls();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Deben estar llenas todas las bolas.",
                        style: TextStyle(fontSize: 16),
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                    ),
                  );
                });
              } else {
                showAlertGuardar(context);
              }
            },
            icon: const Icon(Icons.save),
            tooltip: "Guardar",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                  width: AppConfigSize.screenWidth,
                  child: Row(
                    children: [
                      (GetItMock.prefs.getBool("tirada_enviada")!)
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  resetShoot();
                                });
                              },
                              child: const Text(
                                "Poner Nuevo "
                                "Tiro",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ))
                          : const SizedBox(height: 48),
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
            pick3(),
            const SizedBox(
              height: 15,
            ),
            pick4(),

            const SizedBox(
              height: 18,
            ),
            if (GetItMock.prefs.getBool("tirada_enviada")!)
              Text(
                  "Momento del tiro: ${GetItMock.prefs.getString("tirada_enviada_at")!}",
                  style: const TextStyle(fontSize: 17))
            // const SizedBox(
            //   height: 15,
            // ),
            // pick5(),
          ],
        ),
      ),
    );
  }

  //
  // Future<bool> _willPopCallback() async {
  //   Navigator.pushReplacementNamed(context, "home");
  //   // await showDialog or Show add banners or whatever
  //   // then
  //   return Future.value(true);
  // }

  pick3() {
    return Column(children: [
      const Text("Pick 3",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularTextInput(tec31, '31', fn31),
          circularTextInput(tec32, '32', fn32),
          circularTextInput(tec33, '33', fn33),
          const SizedBox(height: 12.0),
        ],
      )
    ]);
  }

  pick4() {
    return Column(
      children: [
        const Text(
          "Pick 4",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circularTextInput(tec41, '41', fn41),
            circularTextInput(tec42, '42', fn42),
            circularTextInput(tec43, '43', fn43),
            circularTextInput(tec44, '44', fn44),
            const SizedBox(height: 12.0),
          ],
        ),
      ],
    );
  }

  pick5() {
    return const Column(
      children: [
        Text(
          "Pick 5",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // circularTextInput(tec51, '51'),
            // circularTextInput(tec52, '52'),
            // circularTextInput(tec53, '53'),
            // circularTextInput(tec54, '54'),
            // circularTextInput(tec55, '55'),
            SizedBox(height: 12.0),
          ],
        ),
      ],
    );
  }

  circularTextInput(TextEditingController tec, String id, FocusNode fn) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          width: 50,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: getSelected(id),
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
                enabled: !GetItMock.prefs.getBool("tirada_enviada")!,
                focusNode: fn,
                onTap: () {
                  setState(() {
                    select(id);
                    // tec.selection = TextSelection.fromPosition(TextPosition(offset: tec.text.length));
                  });
                },
                enableInteractiveSelection: false,
                controller: tec,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp("[,]")),
                  FilteringTextInputFormatter.deny(RegExp("[.]")),
                  FilteringTextInputFormatter.deny(RegExp("[_]")),
                  FilteringTextInputFormatter.deny(RegExp("[ ]")),
                  FilteringTextInputFormatter.deny(RegExp("[-]"))
                ],
                style: const TextStyle(
                  fontSize: 35,
                  letterSpacing: 25,
                ),
                maxLines: 1,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (int.tryParse(value[value.length - 1])! >= 0) {
                      setState(() {
                        tec.value =
                            TextEditingValue(text: value[value.length - 1]);
                        FocusScope.of(context).requestFocus(selectNext(id));
                        alertEmptyBalls();
                      });
                    }
                    value = '';
                  }
                },
                showCursor: false,
              )
            ],
          )),
    );
  }

  void select(String id) {
    controlSelect = {
      '31': false,
      '32': false,
      '33': false,
      '41': false,
      '42': false,
      '43': false,
      '44': false,
      '51': false,
      '52': false,
      '53': false,
      '54': false,
      '55': false
    };
    alertEmptyBalls();
    controlSelect.addAll({id: true});
  }

  selectNext(String id) {
    final lId = (id == '33') ? '41' : (int.parse(id) + 1).toString();
    return controlFocus[lId];
  }

  void alertEmptyBalls() {
    controlSelect = {
      '31': tec31.value.text == '',
      '32': tec32.value.text == '',
      '33': tec33.value.text == '',
      '41': tec41.value.text == '',
      '42': tec42.value.text == '',
      '43': tec43.value.text == '',
      '44': tec44.value.text == '',
      '51': tec51.value.text == '',
      '52': tec52.value.text == '',
      '53': tec53.value.text == '',
      '54': tec54.value.text == '',
      '55': tec55.value.text == ''
    };
  }

  Border getSelected(String id) {
    var border = controlSelect[id]!
        ? Border.all(color: const Color.fromRGBO(152, 41, 33, 1))
        : Border.all(color: Colors.green);
    return border;
  }

  bool _validatorIsReady() {
    var result = true;
    if (tec31.value.text == '' ||
        tec32.value.text == '' ||
        tec33.value.text == '' ||
        tec41.value.text == '' ||
        tec42.value.text == '' ||
        tec43.value.text == '' ||
        tec44.value.text == '') {
      result = false;
    }
    return result;
  }

  showAlertGuardar(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Publicar Tirada.",
            ),
            content: const Text(
              "Está a apunto de publicar la tirada, desea continuar?",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => popFrom(context),
                  child: const Text(
                    'Cancelar',
                  )),
              ElevatedButton(
                onPressed: () {
                  popFrom(context);
                  var dateTime = DateTime.now();
                  final shoot = ShootPayload(
                      day: dateTime.day.toString(),
                      month: dateTime.month.toString(),
                      year: dateTime.year.toString(),
                      turn: (dateTime.hour > 12 && dateTime.hour < 16)
                          ? "Day"
                          : "Night",
                      number: tec31.value.text +
                          tec32.value.text +
                          tec33.value.text +
                          tec41.value.text +
                          tec42.value.text +
                          tec43.value.text +
                          tec44.value.text);
                  goAdd(shoot);
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Guardar'),
              ),
            ],
          );
        });
  }

  Future<void> goAdd(ShootPayload shootPayload) async {
    showAlertAdd(context, shootPayload);
    var result = await ShootProvider().addShoot(shootPayload);
    if (result["success"] != null) {
      success();
    } else {
      fail(result["message"]);
    }
  }

  showAlertAdd(BuildContext context, ShootPayload shootPayload) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Publicando...",
            ),
            content: Text(
              "Se está publicando: ${shootPayload.number}",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: const <Widget>[],
          );
        });
  }

  success() {
    GetItMock.prefs.setBool("tirada_enviada", true);
    GetItMock.prefs.setString(
        "tirada_enviada_at",
        TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute)
            .format(context));
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

  fail(String message) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error al intentar Guardar.\nDetalles: $message",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        elevation: 3,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
      ),
    );
  }

  void resetShoot() {
    tec31 = TextEditingController();
    tec32 = TextEditingController();
    tec33 = TextEditingController();
    tec41 = TextEditingController();
    tec42 = TextEditingController();
    tec43 = TextEditingController();
    tec44 = TextEditingController();
    tec51 = TextEditingController();
    tec52 = TextEditingController();
    tec53 = TextEditingController();
    tec54 = TextEditingController();
    tec55 = TextEditingController();

    GetItMock.prefs.setBool("tirada_enviada", false);
  }
}
