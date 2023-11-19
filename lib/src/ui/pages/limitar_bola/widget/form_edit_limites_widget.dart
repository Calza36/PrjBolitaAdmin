import 'package:flutter/material.dart';
import 'package:untitled/src/domain/limitation_queue/entity/limits_entity.dart';
import 'package:untitled/src/ui/extencion/state.dart';

import '../../../../domain/limitation_queue/entity/index.dart';
import '../../../../domain/limitation_queue/entity/limitation_request.dart';
import '../../../../infrastructure/limitation_config/datasources/implementation/limitation_config_repository.dart';
import '../../../../tools/app_config_size.dart';
import '../../pages.dart';

class FormEditLimitesWidget extends StatefulWidget {
  const FormEditLimitesWidget({
    Key? key,
    required this.limitatedEntity,
  }) : super(key: key);
  final LimitatedEntity limitatedEntity;

  @override
  State<FormEditLimitesWidget> createState() => _FormEditLimitesWidgetState();
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

class _FormEditLimitesWidgetState extends State<FormEditLimitesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  var test;
  var adminId = '';

  final limitationQueueRepository = LimitationConfigRepository();
  List<String> numbers = [];
  List<String> parlets = [];
  bool eliminando = false;

  TextEditingController tecNumero = TextEditingController();
  TextEditingController tecPar1 = TextEditingController();
  TextEditingController tecPar2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    numbers.addAll(widget.limitatedEntity.numbers!);
    parlets.addAll(widget.limitatedEntity.parlets!);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                        "Fecha y jornada",
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
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: 2),
                            Text(
                                '${widget.limitatedEntity.day}/'
                                '${widget.limitatedEntity.month}/'
                                '${widget.limitatedEntity.year}',
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(width: 2),
                            (widget.limitatedEntity.turn == "Day")
                                ? const Text(' Día        ',
                                    style: TextStyle(fontSize: 20))
                                : const Text(
                                    ' Noche        ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                          ],
                        ),
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
        Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                      children: List.generate(numbers.length, (index) {
                        return numberLimitados(index, numbers);
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
                      children: List.generate(parlets.length, (index) {
                        return parleLimitados(index, parlets);
                      }),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showAlertEditing(context);
                },
                child: SizedBox.fromSize(
                  size: Size(AppConfigSize.screenWidth - 80, 20),
                  child: const Text(
                    "Actualizar",
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
              showAlertEditing(context);
            },
            child: Text("Eliminar"),
          ),
        ),
      ),
    );
  }

  showAlertEditing(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Actualizar Limitados.",
            ),
            content: const Text(
              "Está apunto de actualizar limitados para una fecha, desea "
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
                  goEdit(LimitationRequestEntity(
                    id: widget.limitatedEntity.id,
                    turn: (_value == 1) ? 'Day' : 'Night',
                    day: _dia,
                    month: _mes,
                    year: _anno,
                    numberDay: numbers,
                    parletDay: parlets,
                    numberNight: numbers,
                    parletNight: parlets,
                  ));
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Actualizar'),
              ),
            ],
          );
        });
  }

  showAlertEdit(
      BuildContext context, LimitationRequestEntity limitationRequestEntity) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Actualizando...",
            ),
            content: const Text(
              "Se está actualizado...",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[],
          );
        });
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
              "Está apunto de cancelar, las actualizaciones ya no estaran "
              "disponibles.",
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

  Future<void> goEdit(LimitationRequestEntity limitationRequestEntity) async {
    showAlertEdit(context, limitationRequestEntity);
    LimitsEntity newCurrentLimitedEntity = LimitsEntity(
        numbers: limitationRequestEntity.numberDay,
        parlets: limitationRequestEntity.parletDay);
    var result =
        await limitationQueueRepository.editLimitation(newCurrentLimitedEntity);
    if (result["success"] != null) {
      success();
    } else {
      fail(result["message"]);
    }
  }

  resetForm() {
    tecNumero = TextEditingController();
    tecPar1 = TextEditingController();
    tecPar2 = TextEditingController();
  }

  success() {
    resetForm();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Actualizado correctamente."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.of(context).pop();
    setState(() {});
  }

  fail(String message) {
    Navigator.of(context).pop();
  }

  void agregarBola() {
    setState(() {
      if (widget.limitatedEntity.turn == "Day") {
        if (numbers.contains(tecNumero.text) ||
            numbers.contains("0${tecNumero.text}")) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Ya esta limitado."),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          numbers.add((tecNumero.text.length == 2)
              ? tecNumero.text
              : "0${tecNumero.text}");
        }
      } else {
        if (numbers.contains(tecNumero.text) ||
            numbers.contains("0${tecNumero.text}")) {
          const SnackBar(
            content: Text("Ya esta limitado."),
            duration: Duration(seconds: 2),
          );
        } else {
          numbers.add((tecNumero.text.length == 2)
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
      (int.parse(bola1) > int.parse(bola2))
          ? parlets.add('$bola2,$bola1')
          : parlets.add('$bola1,$bola2');
      tecPar1 = TextEditingController();
      tecPar2 = TextEditingController();
    });
  }

  Widget numberLimitados(int index, List<String> numberList) {
    return GestureDetector(
      onTap: () {
        setState(() {
          numbers.removeAt(index);
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
                    numbers.removeAt(index);
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
          parlets.removeAt(index);
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
                      parlets.removeAt(index);
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
    ;
  }
}
