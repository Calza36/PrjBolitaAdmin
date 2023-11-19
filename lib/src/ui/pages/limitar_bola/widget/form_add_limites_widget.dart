import 'package:flutter/material.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../domain/limitation_queue/entity/index.dart';
import '../../../../domain/limitation_queue/entity/limitation_request.dart';
import '../../../../infrastructure/limitation_config/datasources/implementation/limitation_config_repository.dart';
import '../../../../tools/app_config_size.dart';
import '../../pages.dart';

class FormAddLimitesWidget extends StatefulWidget {
  const FormAddLimitesWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FormAddLimitesWidget> createState() => _FormAddLimitesWidgetState();
}

bool mesInicial = false;
DateTime date = DateTime.now();

String _fecha = "";
int _dia = DateTime.now().day;
int _mes = DateTime.now().month;
int _anno = DateTime.now().year;
TextEditingController _controlCalendario = TextEditingController();
FocusNode fn1 = FocusNode();
FocusNode fn2 = FocusNode();
var turns = ["Day", "Night"];
int _value = 1;

class _FormAddLimitesWidgetState extends State<FormAddLimitesWidget> {
  var test;
  var adminId = '';

  final limitationQueueRepository = LimitationConfigRepository();
  List<String> numberDay = [];
  List<String> numberNight = [];
  List<String> parletDay = [];
  List<String> parletNight = [];
  bool eliminando = false;

  TextEditingController tecNumero = TextEditingController();
  TextEditingController tecPar1 = TextEditingController();
  TextEditingController tecPar2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfigSize().init(context);
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Seleccionar fecha y jornada",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      //_calendario()
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(child: _calendario()),
                      Container(
                        // width: 101,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromRGBO(152, 41, 33, 1)

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
                                clearLists();
                                _value = value!;
                              });
                            }),
                      )
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
        Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Adicionar limitados:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      //_calendario()
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          addBola(context);
                        },
                        child: const Text("    Bola    ##",
                            style: TextStyle(fontSize: 16)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addPar(context);
                        },
                        child: const Text("    Parle ##,##",
                            style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
        (_value == 1)
            ? Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: const [
                        SizedBox(height: 4),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Vista previa:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                    const ListTile(
                      title: Text(
                        "Limitados",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Wrap(
                            children: List.generate(numberDay.length, (index) {
                              return numberLimitados(index, numberDay);
                            }),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Wrap(
                            children: List.generate(parletDay.length, (index) {
                              return parleLimitados(index, parletDay);
                            }),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showAlertGuardar(context);
                      },
                      child: SizedBox.fromSize(
                        size: Size(AppConfigSize.screenWidth - 80, 20),
                        child: const Text(
                          "Guardar",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showAlertCancel(context);
                      },
                      child: SizedBox.fromSize(
                        size: Size(AppConfigSize.screenWidth - 80, 20),
                        child: const Text(
                          "Cancelar",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              )
            : Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: const [
                        SizedBox(height: 4),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Vista previa:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                    const ListTile(
                      title: Text(
                        "Limitados",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Wrap(
                            children:
                                List.generate(numberNight.length, (index) {
                              return numberLimitados(index, numberNight);
                            }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Wrap(
                            children:
                                List.generate(parletNight.length, (index) {
                              return parleLimitados(index, parletNight);
                            }),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showAlertGuardar(context);
                      },
                      child: SizedBox.fromSize(
                        size: Size(AppConfigSize.screenWidth - 80, 20),
                        child: const Text(
                          "Guardar",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showAlertCancel(context);
                      },
                      child: SizedBox.fromSize(
                        size: Size(AppConfigSize.screenWidth - 80, 20),
                        child: const Text(
                          "Cancelar",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  addBola(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text(
            "Agregar numero a limitar",
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
                agregarBola();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  addPar(BuildContext context) {
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
                agregarPar();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Widget buildListBolasLimitadas(List<LimitatedEntity> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(data[index].day.toString()),
          subtitle: Text("Números:\n  Día: ${data[index].numbers}\n  Noche:  "
              "${data[index].numbers}\nParlet:\n  Día: ${data[index].parlets}\n"
              "  Noche:  "
              "${data[index].parlets}"),
          trailing: TextButton(
            onPressed: () {
              showAlertGuardar(context);
            },
            child: Text("Eliminar"),
          ),
        ),
      ),
    );
  }

  showAlertGuardar(BuildContext context) {
    if (((_value == 1) && numberDay.isEmpty && parletDay.isEmpty) ||
        ((_value == 2) && numberNight.isEmpty && parletNight.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nada que agregar.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          elevation: 3,
          duration: Duration(seconds: 4),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (isToday(_dia, _mes, _anno)) {
        if ((_value == 1)) {
          if (isPast6AM()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Turno en curso, no se puede guardar.",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                elevation: 3,
                duration: Duration(seconds: 4),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    title: const Text(
                      "Guardar Limitados.",
                    ),
                    content: const Text(
                      "Está apunto de guardar limitados para una fecha, desea "
                      "continuar?",
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
                          goAdd(LimitationRequestEntity(
                              turn: (_value == 1) ? 'Day' : 'Night',
                              day: _dia,
                              month: _mes,
                              year: _anno,
                              numberDay: numberDay,
                              parletDay: parletDay,
                              numberNight: numberNight,
                              parletNight: parletNight));
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.green)),
                        child: const Text('Guardar'),
                      ),
                    ],
                  );
                });
          }
        } else {
          if (isPast1PM()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Turno en curso, no se puede guardar.",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                elevation: 3,
                duration: Duration(seconds: 4),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    title: const Text(
                      "Guardar Limitados.",
                    ),
                    content: const Text(
                      "Está apunto de guardar limitados para una fecha, desea "
                      "continuar?",
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
                          goAdd(LimitationRequestEntity(
                              turn: (_value == 1) ? 'Day' : 'Night',
                              day: _dia,
                              month: _mes,
                              year: _anno,
                              numberDay: numberDay,
                              parletDay: parletDay,
                              numberNight: numberNight,
                              parletNight: parletNight));
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.green)),
                        child: const Text('Guardar'),
                      ),
                    ],
                  );
                });
          }
        }
      } else {
        if (isBeforeToday(_dia, _mes, _anno)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Solo se pueden agregar reglas para el futuro. "
                  "Seleccione una fecha válida.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              elevation: 3,
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  title: const Text(
                    "Guardar Limitados.",
                  ),
                  content: const Text(
                    "Está apunto de guardar limitados para una fecha, desea "
                    "continuar?",
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
                        goAdd(LimitationRequestEntity(
                            turn: (_value == 1) ? 'Day' : 'Night',
                            day: _dia,
                            month: _mes,
                            year: _anno,
                            numberDay: numberDay,
                            parletDay: parletDay,
                            numberNight: numberNight,
                            parletNight: parletNight));
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.green)),
                      child: const Text('Guardar'),
                    ),
                  ],
                );
              });
        }
      }
    }
  }

  showAlertCancel(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Cancelar",
            ),
            content: const Text(
              "Está apunto de cancelar, los datos ya no estaran disponibles.",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Regresar',
                  )),
              TextButton(
                onPressed: () {
                  //context.goNamed(AppPages.login.name);
                  popFrom(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProgramedLimits()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Si, Cancelar'),
              ),
            ],
          );
        });
  }

  Future<void> goAdd(LimitationRequestEntity limitationRequestEntity) async {
    showAlertAdd(context, limitationRequestEntity);
    var result =
        await limitationQueueRepository.addLimitation(limitationRequestEntity);
    if (result["success"] != null) {
      success();
    } else {
      fail(result["message"]);
    }
  }

  resetForm() {
    numberDay = [];
    numberNight = [];
    parletDay = [];
    parletNight = [];
    tecNumero = TextEditingController();
    tecPar1 = TextEditingController();
    tecPar2 = TextEditingController();
  }

  success() {
    resetForm();
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

  showAlertAdd(
      BuildContext context, LimitationRequestEntity limitationRequestEntity) {
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
            content: const Text(
              "Se está guardando...",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[],
          );
        });
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
                  : Text('$_dia / ${_mesLetra(_mes.toString())}')
            ],
          ),
        ));
  }

  _selecDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = _fecha.substring(0, 10);
        _dia = int.parse(_fecha.substring(8, 10));
        _mes = int.parse(_fecha.substring(5, 7));
        _anno = int.parse(_fecha.substring(0, 4));
        _controlCalendario.text = _mes.toString();
      });
    }
  }

  String _mesLetra(String mes) {
    var temp = (mes.length == 1) ? '0$mes' : mes;
    switch (temp) {
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

  void agregarBola() {
    setState(() {
      if (_value == 1) {
        if (numberDay.contains(tecNumero.text) ||
            numberDay.contains("0${tecNumero.text}")) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Ya esta limitado."),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          numberDay.add((tecNumero.text.length == 2)
              ? tecNumero.text
              : "0${tecNumero.text}");
        }
      } else {
        if (numberNight.contains(tecNumero.text) ||
            numberNight.contains("0${tecNumero.text}")) {
          const SnackBar(
            content: Text("Ya esta limitado."),
            duration: Duration(seconds: 2),
          );
        } else {
          numberNight.add((tecNumero.text.length == 2)
              ? tecNumero.text
              : "0${tecNumero.text}");
        }
      }
      tecNumero = TextEditingController();
    });
  }

  void agregarPar() {
    setState(() {
      String bola1 =
          (tecPar1.text.length == 2) ? tecPar1.text : "0${tecPar1.text}";
      String bola2 =
          (tecPar2.text.length == 2) ? tecPar2.text : "0${tecPar2.text}";
      if (_value == 1) {
        (int.parse(bola1) > int.parse(bola2))
            ? parletDay.add('$bola2,$bola1')
            : parletDay.add('$bola1,$bola2');
      } else {
        (int.parse(bola1) > int.parse(bola2))
            ? parletNight.add('$bola2,$bola1')
            : parletNight.add('$bola1,$bola2');
      }
      tecPar1 = TextEditingController();
      tecPar2 = TextEditingController();
    });
  }

  Widget numberLimitados(index, List<String> numberList) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(152, 41, 33, 1),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        numberList[index].toString().trim(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget parleLimitados(int index, List<String> parleList) {
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
            child: Text(parleList[index].toString().trim().replaceAll(',', ''),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          )),
        ));
  }

  void clearLists() {
    numberDay.clear();
    numberNight.clear();
    parletDay.clear();
    parletNight.clear();
  }

  void deleteBola(int index) {
    setState(() {
      if (_value == 1) {
        numberDay.removeAt(index);
      } else {
        if (numberNight.contains(tecNumero.text) ||
            numberNight.contains("0${tecNumero.text}")) {
          const SnackBar(
            content: Text("Ya esta limitado."),
            duration: Duration(seconds: 2),
          );
        } else {
          numberNight.add((tecNumero.text.length == 2)
              ? tecNumero.text
              : "0${tecNumero.text}");
        }
      }
      tecNumero = TextEditingController();
    });
  }

  void deletePar(int index) {
    setState(() {
      String bola1 =
          (tecPar1.text.length == 2) ? tecPar1.text : "0${tecPar1.text}";
      String bola2 =
          (tecPar2.text.length == 2) ? tecPar2.text : "0${tecPar2.text}";
      if (_value == 1) {
        (int.parse(bola1) > int.parse(bola2))
            ? parletDay.add('$bola2,$bola1')
            : parletDay.add('$bola1,$bola2');
      } else {
        (int.parse(bola1) > int.parse(bola2))
            ? parletNight.add('$bola2,$bola1')
            : parletNight.add('$bola1,$bola2');
      }
      tecPar1 = TextEditingController();
      tecPar2 = TextEditingController();
    });
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
}
