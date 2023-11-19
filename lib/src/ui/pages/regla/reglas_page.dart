import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/ui/extencion/state.dart';
import 'package:untitled/src/ui/extencion/string.dart';

import '../../../data/services/get_it_mock.dart';
import '../../../infrastructure/ruler/datasources/implementation/index.dart';
import '../../../infrastructure/ruler/dtos/payload/node_rule_payload.dart'
    as pl;
import '../../../infrastructure/ruler/index.dart';
import '../../../tools/app_config_size.dart';
import '../limitar_bola/page/programed_limits_page.dart';
import '../players/page/edit_player/cubits/get_rules_cubit.dart';

class ReglasView extends StatefulWidget {
  const ReglasView({
    Key? key,
    required this.ruleName,
    this.ruleElement,
  }) : super(key: key);
  final String ruleName;
  final RuleElement? ruleElement;

  @override
  State<ReglasView> createState() => _ReglasViewState();
}

bool mesInicial = false;
DateTime date = DateTime.now();
int _day = 19;
int _month = 12;
int _year = 2022;
String _fecha = "";
String _dia = DateTime.now().toString().substring(0, 10).substring(8, 10);
String _mes = DateTime.now().toString().substring(0, 10).substring(5, 7);
String _anno = DateTime.now().year.toString();

TextEditingController _controlCalendario = TextEditingController();

var turns = ["Day", "Night"];
int _value = 1;

class _ReglasViewState extends State<ReglasView> {
  String? _selectedStartTurnDay = '00:00';
  String? _selectedEndTurnDay = '00:00';
  String? _selectedStartTurnNight = '00:00';
  String? _selectedEndTurnNight = '00:00';

  Future<void> _showDayInit() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedStartTurnDay = result.format(context);
      });
    }
  }

  Future<void> _showDayEnd() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedEndTurnDay = result.format(context);
      });
    }
  }

  Future<void> _showNightInit() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedStartTurnNight = result.format(context);
      });
    }
  }

  Future<void> _showNightEnd() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedEndTurnNight = result.format(context);
      });
    }
  }

  var test;
  var adminId = '';

  final _formKey = GlobalKey<FormState>();
  final rulesRepository = RulesRepository();
  List<String> numberDay = [];
  List<String> numberNight = [];
  List<String> parletDay = [];
  List<String> parletNight = [];
  bool eliminando = false;

  TextEditingController tecNumero = TextEditingController();
  TextEditingController tecPar1 = TextEditingController();
  TextEditingController tecPar2 = TextEditingController();

  late TextEditingController _nameController;

  late TextEditingController _fixedPayController;
  late TextEditingController _runningPayController;
  late TextEditingController _parletPayController;
  late TextEditingController _centPayController;

  late TextEditingController _limitFixedPayController;
  late TextEditingController _limitRunningPayController;
  late TextEditingController _limitParletPayController;

  late TextEditingController _maxFixedBetController;
  late TextEditingController _maxRunningBetController;
  late TextEditingController _maxParletBetController;
  late TextEditingController _maxCentBetController;

  late TextEditingController _footCollectorPaymentPerFixedController;
  late TextEditingController _footCollectorPaymentPerRunningController;
  late TextEditingController _footCollectorPaymentPerParletController;
  late TextEditingController _footCollectorPaymentPerCentController;
  String? userType; 
  @override
  void initState() {
    super.initState();
    if (widget.ruleName == 'General' || widget.ruleElement != null) {
      RuleElement rule = widget.ruleElement!;
      _selectedStartTurnDay = TimeOfDay(
              hour: rule.turnsLimits!.day!.startHour!,
              minute: rule.turnsLimits!.day!.startMinute!)
          .toString()
          .replaceFirst('TimeOfDay(', '')
          .replaceFirst(')', '');
      _selectedEndTurnDay = TimeOfDay(
              hour: rule.turnsLimits!.day!.endHour!,
              minute: rule.turnsLimits!.day!.endMinute!)
          .toString()
          .replaceFirst('TimeOfDay(', '')
          .replaceFirst(')', '');
      _selectedStartTurnNight = TimeOfDay(
              hour: rule.turnsLimits!.night!.startHour!,
              minute: rule.turnsLimits!.night!.startMinute!)
          .toString()
          .replaceFirst('TimeOfDay(', '')
          .replaceFirst(')', '');
      _selectedEndTurnNight = TimeOfDay(
              hour: rule.turnsLimits!.night!.endHour!,
              minute: rule.turnsLimits!.night!.endMinute!)
          .toString()
          .replaceFirst('TimeOfDay(', '')
          .replaceFirst(')', '');
      _nameController = TextEditingController(text: widget.ruleName);
      _fixedPayController =
          TextEditingController(text: rule.fixedPay.toString());
      _runningPayController =
          TextEditingController(text: rule.runningPay.toString());
      _parletPayController =
          TextEditingController(text: rule.parletPay.toString());
      _centPayController = TextEditingController(text: rule.centPay.toString());

      _limitFixedPayController =
          TextEditingController(text: rule.limitFixedPay.toString());
      _limitRunningPayController =
          TextEditingController(text: rule.limitRunningPay.toString());
      _limitParletPayController =
          TextEditingController(text: rule.limitParletPay.toString());

      _maxFixedBetController =
          TextEditingController(text: rule.maxFixedBet.toString());
      _maxRunningBetController =
          TextEditingController(text: rule.maxRunningBet.toString());
      _maxParletBetController =
          TextEditingController(text: rule.maxParletBet.toString());
      _maxCentBetController =
          TextEditingController(text: rule.maxCentBet.toString());

      _footCollectorPaymentPerFixedController = TextEditingController(
          text: rule.footCollectorPaymentPerFixed.toString());
      _footCollectorPaymentPerRunningController = TextEditingController(
          text: rule.footCollectorPaymentPerRunning.toString());
      _footCollectorPaymentPerParletController = TextEditingController(
          text: rule.footCollectorPaymentPerParlet.toString());
      _footCollectorPaymentPerCentController = TextEditingController(
          text: rule.footCollectorPaymentPerCent.toString());
    } else {
      _nameController = TextEditingController(text: '');
      _fixedPayController = TextEditingController(text: '');
      _runningPayController = TextEditingController(text: '');
      _parletPayController = TextEditingController(text: '');
      _centPayController = TextEditingController(text: '');

      _limitFixedPayController = TextEditingController(text: '');
      _limitRunningPayController = TextEditingController(text: '');
      _limitParletPayController = TextEditingController(text: '');

      _maxFixedBetController = TextEditingController(text: '');
      _maxRunningBetController = TextEditingController(text: '');
      _maxParletBetController = TextEditingController(text: '');
      _maxCentBetController = TextEditingController(text: '');

      _footCollectorPaymentPerFixedController = TextEditingController(text: '');
      _footCollectorPaymentPerRunningController =
          TextEditingController(text: '');
      _footCollectorPaymentPerParletController =
          TextEditingController(text: '');
      _footCollectorPaymentPerCentController = TextEditingController(text: '');
    }
    userType = GetItMock.prefs.getString("user_type");
  }

  @override
  Widget build(BuildContext context) {
    AppConfigSize().init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Regla ${widget.ruleName}"),
          actions: [(userType != 'Admin')
                                                           ? Container()
                                                           :
            IconButton(
              onPressed: () {
                if (widget.ruleElement != null) {
                  if (_formKey.currentState!.validate()) {
                    pl.NodeRulePayload nodeRulePayload = pl.NodeRulePayload(
                      id: widget.ruleElement?.id ?? "",
                      day: _dia.parseInt(),
                      month: _mes.parseInt(),
                      year: _anno.parseInt(),
                      turnToRun: turns[_value - 1],
                      name: _nameController.value.text,
                      fixedPay: _fixedPayController.value.text.parseInt(),
                      runningPay: _runningPayController.value.text.parseInt(),
                      parletPay: _parletPayController.value.text.parseInt(),
                      centPay: _centPayController.value.text.parseInt(),
                      limitFixedPay:
                          _limitFixedPayController.value.text.parseInt(),
                      limitRunningPay:
                          _limitRunningPayController.value.text.parseInt(),
                      limitParletPay:
                          _limitParletPayController.value.text.parseInt(),
                      operationType: "Editing",
                      targetRule: widget.ruleElement!.id!,
                      maxFixedBet: _maxFixedBetController.value.text.parseInt(),
                      maxRunningBet:
                          _maxRunningBetController.value.text.parseInt(),
                      maxParletBet:
                          _maxParletBetController.value.text.parseInt(),
                      maxCentBet: _maxCentBetController.value.text.parseInt(),
                      turnsLimits: pl.TurnsLimits(
                          day: pl.Day(
                              startHour: 7,
                              startMinute: 30,
                              endHour: 12,
                              endMinute: 00),
                          night: pl.Day(
                              startHour: 7,
                              startMinute: 30,
                              endHour: 12,
                              endMinute: 00)),
                      footCollectorPaymentPerFixed:
                          _footCollectorPaymentPerFixedController.value.text
                              .parseInt(),
                      footCollectorPaymentPerRunning:
                          _footCollectorPaymentPerRunningController.value.text
                              .parseInt(),
                      footCollectorPaymentPerParlet:
                          _footCollectorPaymentPerParletController.value.text
                              .parseInt(),
                      footCollectorPaymentPerCent:
                          _footCollectorPaymentPerCentController.value.text
                              .parseInt(),
                    );
                    goEditRule(nodeRulePayload,
                        widget.ruleElement!.footCollectors!.isNotEmpty);
                  }
                }
                if (widget.ruleName == 'new') {
                  if (_formKey.currentState!.validate()) {
                    pl.NodeRulePayload nodeRulePayload = pl.NodeRulePayload(
                      id: '',
                      day: _dia.parseInt(),
                      month: _mes.parseInt(),
                      year: _anno.parseInt(),
                      turnToRun: turns[_value - 1],
                      name: _nameController.value.text,
                      fixedPay: _fixedPayController.value.text.parseInt(),
                      runningPay: _runningPayController.value.text.parseInt(),
                      parletPay: _parletPayController.value.text.parseInt(),
                      centPay: _centPayController.value.text.parseInt(),
                      limitFixedPay:
                          _limitFixedPayController.value.text.parseInt(),
                      limitRunningPay:
                          _limitRunningPayController.value.text.parseInt(),
                      limitParletPay:
                          _limitParletPayController.value.text.parseInt(),
                      operationType: '',
                      targetRule: '',
                      maxFixedBet: _maxFixedBetController.value.text.parseInt(),
                      maxRunningBet:
                          _maxRunningBetController.value.text.parseInt(),
                      maxParletBet:
                          _maxParletBetController.value.text.parseInt(),
                      maxCentBet: _maxCentBetController.value.text.parseInt(),
                      turnsLimits: pl.TurnsLimits(
                          day: pl.Day(
                              startHour: 7,
                              startMinute: 30,
                              endHour: 12,
                              endMinute: 00),
                          night: pl.Day(
                              startHour: 7,
                              startMinute: 30,
                              endHour: 12,
                              endMinute: 00)),
                      footCollectorPaymentPerFixed:
                          _footCollectorPaymentPerFixedController.value.text
                              .parseInt(),
                      footCollectorPaymentPerRunning:
                          _footCollectorPaymentPerRunningController.value.text
                              .parseInt(),
                      footCollectorPaymentPerParlet:
                          _footCollectorPaymentPerParletController.value.text
                              .parseInt(),
                      footCollectorPaymentPerCent:
                          _footCollectorPaymentPerCentController.value.text
                              .parseInt(),
                    );
                    goAddRule(nodeRulePayload);
                  }
                }
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                //turnInfo(),
                detayls(),
                //buildButtons(),
              ],
            )));
  }

  // We don't need to pass a context to the _show() function
  // You can safety use context as below

  showAlertGuardar(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Guardar Regla.",
            ),
            content: const Text(
              "Está apunto de guardar, desea continuar?",
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
                  //goAdd(RuleElementEntity());
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Guardar'),
              ),
            ],
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

  Future<void> goEditRule(
      pl.NodeRulePayload nodeRulePayload, bool isInUse) async {
    showAlertAdd(context, nodeRulePayload, isInUse);
    var result = await rulesRepository.editRule(nodeRulePayload, isInUse);
    if (result["success"] != null) {
      Map<String, dynamic> privateRules =
          await RuleProvider().getPrivateRules();
      if (privateRules['success'] != null) {
        String rsRawJson = jsonEncode(privateRules['success'].toJson());
        GetItMock.prefs.setString("privateRules", rsRawJson);
        GetItMock.loadRules();
        success();
      } else {
        fail(result["message"]);
      }
    } else {
      fail(result["message"]);
    }
  }

  Future<void> goAddRule(pl.NodeRulePayload nodeRulePayload) async {
    showAlertAdd(context, nodeRulePayload, false);
    var result = await rulesRepository.addRule(nodeRulePayload);
    if (result["success"] != null) {
      Map<String, dynamic> privateRules =
          await RuleProvider().getPrivateRules();
      if (privateRules['success'] != null) {
        String rsRawJson = jsonEncode(privateRules['success'].toJson());
        GetItMock.prefs.setString("privateRules", rsRawJson);
        GetItMock.loadRules();
        success();
      } else {
        fail(result["message"]);
      }
    } else {
      fail(result["message"]);
    }
  }

  success() {
    context.read<GetRulesCubit>().fetchAllRules();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Guardado correctamente."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.of(context).pop();
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

  showAlertAdd(BuildContext context, pl.NodeRulePayload ruleElementEntity,
      bool isInUse) {
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
      lastDate: DateTime.now().add(const Duration(days: 365)),
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

  turnInfo() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(
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
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  SizedBox(height: 35, width: 120, child: _calendario()),
                  Expanded(child: Container()),
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
                                dropdownColor: Colors.white,
                                value: _value,
                                items: const [
                                  DropdownMenuItem(
                                      value: 1,
                                      child: Text(
                                        "Día",
                                      )),
                                  DropdownMenuItem(
                                      value: 2, child: Text("Noche"))
                                ],
                                onChanged: (int? value) {
                                  setState(() {
                                    _value = value!;
                                    print(_value);
                                  });
                                })),
                      )),
                ],
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                "Horario de turno Día:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    _showDayInit();
                  },
                  child: SizedBox(
                    height: 35,
                    width: 88,
                    child: Center(
                        child: Text(
                      "Inicio: $_selectedStartTurnDay",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    )),
                  )),
              Expanded(child: Container()),
              ElevatedButton(
                  onPressed: () {
                    _showDayEnd();
                  },
                  child: SizedBox(
                    height: 35,
                    width: 88,
                    child: Center(
                        child: Text(
                      "Fin: $_selectedEndTurnDay",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    )),
                  )),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                "Horario de turno Noche:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    _showNightInit();
                  },
                  child: SizedBox(
                    height: 35,
                    width: 88,
                    child: Center(
                        child: Text(
                      "Inicio: $_selectedStartTurnNight",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    )),
                  )),
              Expanded(child: Container()),
              ElevatedButton(
                  onPressed: () {
                    _showNightEnd();
                  },
                  child: SizedBox(
                    height: 35,
                    width: 88,
                    child: Center(
                        child: Text(
                      "Fin: $_selectedEndTurnNight",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    )),
                  )),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  detayls() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Detalles:",
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
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_nameController.value.text != '')
                    const Text(
                      "Nombre de Regla:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_nameController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Nombre de Regla',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              //Pay Section
              const Divider(
                thickness: 1,
                height: 30,
                color: Colors.black26,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Pagar:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_fixedPayController.value.text != '')
                    const Text(
                      "Fijo:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_fixedPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _fixedPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Fijo',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_runningPayController.value.text != '')
                    const Text(
                      "Corrido:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_runningPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _runningPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Corrido',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_parletPayController.value.text != '')
                    const Text(
                      "Parlet:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_parletPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _parletPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Parlet',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_centPayController.value.text != '')
                    const Text(
                      "Centena:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_centPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _centPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Centena',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              //Limits section
              const Divider(
                thickness: 1,
                height: 30,
                color: Colors.black26,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Límites:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_limitFixedPayController.value.text != '')
                    const Text(
                      "Fijo:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_limitFixedPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _limitFixedPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Fijo',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_limitRunningPayController.value.text != '')
                    const Text(
                      "Corrido:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_limitRunningPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _limitRunningPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Corrido',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_limitParletPayController.value.text != '')
                    const Text(
                      "Parlet:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_limitParletPayController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _limitParletPayController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Parlet',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              //Maximum section
              const Divider(
                thickness: 1,
                height: 30,
                color: Colors.black26,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Máximos:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_maxFixedBetController.value.text != '')
                    const Text(
                      "Fijo:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_maxFixedBetController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _maxFixedBetController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Fijo',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_maxRunningBetController.value.text != '')
                    const Text(
                      "Corrido:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_maxRunningBetController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _maxRunningBetController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Corrido',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_maxParletBetController.value.text != '')
                    const Text(
                      "Parlet:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_maxParletBetController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _maxParletBetController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Parlet',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_maxCentBetController.value.text != '')
                    const Text(
                      "Centena:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_maxCentBetController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _maxCentBetController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Centena',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              //Foor Collector Pay section
              const Divider(
                thickness: 1,
                height: 30,
                color: Colors.black26,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Pago a Listeros:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_footCollectorPaymentPerFixedController.value.text != '')
                    const Text(
                      "Fijo:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_footCollectorPaymentPerFixedController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _footCollectorPaymentPerFixedController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Fijo',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_footCollectorPaymentPerRunningController.value.text !=
                      '')
                    const Text(
                      "Corrido:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_footCollectorPaymentPerRunningController.value.text !=
                      '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _footCollectorPaymentPerRunningController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Corrido',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_footCollectorPaymentPerParletController.value.text != '')
                    const Text(
                      "Parlet:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_footCollectorPaymentPerParletController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _footCollectorPaymentPerParletController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Parlet',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  if (_footCollectorPaymentPerCentController.value.text != '')
                    const Text(
                      "Centena:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  if (_footCollectorPaymentPerCentController.value.text != '')
                    Expanded(
                      child: Container(),
                    ),
                  SizedBox(
                    width: 135,
                    child: TextFormField(
                      readOnly: (userType != 'Admin'),
                      keyboardType: TextInputType.number,
                      controller: _footCollectorPaymentPerCentController,
                      validator: _userValidator,
                      decoration: const InputDecoration(
                        hintText: 'Centena',
                      ),
                      onChanged: (String? text) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  String? _userValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Valor requerido.";
    }
    return null;
  }

/*
  String?   _nameController;

  String?   _fixedPayController;
  String?   _runningPayController;
  String?   _parletPayController;
  String?   _centPayController;

  String?   _limitFixedPayController;
  String?   _limitRunningPayController;
  String?   _limitParletPayController;

  String?   _maxFixedBetController;
  String?   _maxRunningBetController;
  String?   _maxParletBetController;
  String?   _maxCentBetController;

  String?   _footCollectorPaymentPerFixedController;
  String?   _footCollectorPaymentPerRunningController;
  String?   _footCollectorPaymentPerParletController;
  String?   _footCollectorPaymentPerCentController;
*/

  buildButtons() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
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
          ListTile(
            title: const Text(
              "Nueva limitación",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(
              "\nDía:\n  "
              "Número: "
              "$numberDay\n  Parlet: $parletDay\n\n"
              "Noche:\n  Número: $numberNight\n  Parlet: $parletNight",
              style: const TextStyle(
                fontSize: 16.0,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              showAlertGuardar(context);
            },
            child: SizedBox.fromSize(
              size: Size(AppConfigSize.screenWidth - 80, 20),
              child: const Text(
                "Confirmar",
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
    );
  }

  void onLoad(RuleElement rule) {
    _selectedStartTurnDay = TimeOfDay(
            hour: rule.turnsLimits!.day!.startHour!,
            minute: rule.turnsLimits!.day!.startMinute!)
        .toString()
        .replaceFirst('TimeOfDay(', '')
        .replaceFirst(')', '');
    _selectedEndTurnDay = TimeOfDay(
            hour: rule.turnsLimits!.day!.endHour!,
            minute: rule.turnsLimits!.day!.endMinute!)
        .toString()
        .replaceFirst('TimeOfDay(', '')
        .replaceFirst(')', '');
    _selectedStartTurnNight = TimeOfDay(
            hour: rule.turnsLimits!.night!.startHour!,
            minute: rule.turnsLimits!.night!.startMinute!)
        .toString()
        .replaceFirst('TimeOfDay(', '')
        .replaceFirst(')', '');
    _selectedEndTurnNight = TimeOfDay(
            hour: rule.turnsLimits!.night!.endHour!,
            minute: rule.turnsLimits!.night!.endMinute!)
        .toString()
        .replaceFirst('TimeOfDay(', '')
        .replaceFirst(')', '');
    _nameController = TextEditingController(text: widget.ruleName);
    _fixedPayController = TextEditingController(text: rule.fixedPay.toString());
    _runningPayController =
        TextEditingController(text: rule.runningPay.toString());
    _parletPayController =
        TextEditingController(text: rule.parletPay.toString());
    _centPayController = TextEditingController(text: rule.centPay.toString());

    _limitFixedPayController =
        TextEditingController(text: rule.limitFixedPay.toString());
    _limitRunningPayController =
        TextEditingController(text: rule.limitRunningPay.toString());
    _limitParletPayController =
        TextEditingController(text: rule.limitParletPay.toString());

    _maxFixedBetController =
        TextEditingController(text: rule.maxFixedBet.toString());
    _maxRunningBetController =
        TextEditingController(text: rule.maxRunningBet.toString());
    _maxParletBetController =
        TextEditingController(text: rule.maxParletBet.toString());
    _maxCentBetController =
        TextEditingController(text: rule.maxCentBet.toString());

    _footCollectorPaymentPerFixedController = TextEditingController(
        text: rule.footCollectorPaymentPerFixed.toString());
    _footCollectorPaymentPerRunningController = TextEditingController(
        text: rule.footCollectorPaymentPerRunning.toString());
    _footCollectorPaymentPerParletController = TextEditingController(
        text: rule.footCollectorPaymentPerParlet.toString());
    _footCollectorPaymentPerCentController = TextEditingController(
        text: rule.footCollectorPaymentPerCent.toString());
  }
}
