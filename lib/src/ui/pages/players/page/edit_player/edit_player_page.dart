import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';
import 'package:untitled/src/infrastructure/ruler/index.dart';
import 'package:untitled/src/ui/extencion/state.dart';
import 'package:untitled/src/ui/extencion/widget.dart';
import 'package:untitled/src/ui/pages/players/index.dart';

import '../../../../../aplication/type_of_user.dart';
import '../../../../../data/util/util.dart';
import '../../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';
import '../../../../../infrastructure/player_all/index.dart';
import '../../../../../tools/app_config_size.dart';
import '../../../login/loadin_screen.dart';
import '../../../pages.dart';
import '../add_player/cubits/get_players_cubit.dart';
import 'cubits/get_rules_cubit.dart';

class EditPlayerPage extends StatefulWidget {
  static Widget create(int userType) {
    return EditPlayerPage(
      fromTab: userType,
    );
  }

  final int fromTab;
  final dynamic typePlayer;

  const EditPlayerPage({super.key, required this.fromTab, this.typePlayer});

  @override
  EditPlayerPageState createState() => EditPlayerPageState();
}

String status = "";
int defaultTabIndexToBack = 0;

class EditPlayerPageState extends State<EditPlayerPage>
    with SingleTickerProviderStateMixin<EditPlayerPage> {
  final TypeOfUser _type = TypeOfUser.unselected;

  bool _checkManageRulesPermit = false;
  bool _checkAssingRulePermit = false;
  bool _checkManageGeneralCollectorsPermit = false;
  bool _checkManageCollectorsPermit = false;
  bool _checkManageFootCollectorsPermit = false;

  bool _checkInicial = true;
  bool _checkActivo = false;
  bool _checkBloqueo = false;
  bool _checkEliminado = false;

  bool _checkResetPassword = false;
  List<String> listRuler = <String>[];
  List<String> listIdRuler = <String>[];

  final bool _typeFlatValid = true;
  String? selectedRule;
  String? selectedRuleId;

  //bool _flatSelectedFather = false;
  bool flatSelectedType = false;
  bool flatEditLoaded = false;

  //final _userController = TextEditingController();
  //final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];

  late Rule rules;

  /*
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetRulesCubit>().fetchAllRules();
    Player player = widget.typePlayer as Player;
    defaultTabIndexToBack = widget.fromTab;

    status = player.status!;
    var updatedStatusPlayer = player.toDomain();

    _checkManageRulesPermit = updatedStatusPlayer.manageRulesPermit!;
    _checkAssingRulePermit = updatedStatusPlayer.assingRulePermit!;

    _checkManageGeneralCollectorsPermit =
        updatedStatusPlayer.manageGeneralCollectorsPermit!;
    _checkManageCollectorsPermit = updatedStatusPlayer.manageCollectorsPermit!;
    _checkManageFootCollectorsPermit =
        updatedStatusPlayer.manageFootCollectorsPermit!;

    _checkInicial = updatedStatusPlayer.estado == 'Initial';
    _checkActivo = updatedStatusPlayer.estado == 'Active';
    _checkBloqueo = updatedStatusPlayer.estado == 'Blocked';
    _checkEliminado = updatedStatusPlayer.estado == 'Deleted';

    listRuler.add(GetItMock.generalRule.name!);
    listIdRuler.add(GetItMock.generalRule.id!);
    // var listRulers = GetItMock.privateRules.rules;
    //
    // for (var i = 0; i < listRulers!.length; i++) {
    //   listRuler.add(listRulers[i].name!);
    //   listIdRuler.add(listRulers[i].id!);
    // }
    selectedRule = updatedStatusPlayer.nameRegla;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Editar:  ${widget.typePlayer.name}"),
            ),
            body: Form(
              key: _formKey,
              child: CustomScrollView(slivers: <Widget>[
                buildInputs(),
                buildNextButton(),
              ]),
            ).fadeAnimation(.5)));
  }

  SliverToBoxAdapter buildNextButton() {
    return SliverToBoxAdapter(
        child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              /*if (_formKey.currentState!.validate() &&
                  _type != TypeOfUser.unselected &&
                  selectedRule != null)
              */
              String finalRuleId = listIdRuler
                  .elementAt(listRuler.indexOf(selectedRule.toString()));
              //String ring = _userController.text;
              //String description = _passwordController.text;
              /*             String typeOfUser = "";
              if (_type == TypeOfUser.generalcollector) {
                typeOfUser = 'generalcollector';
              } else if (_type == TypeOfUser.collector) {
                typeOfUser = 'collector';
              } else if (_type == TypeOfUser.footcollector) {
                typeOfUser = 'footcollector';
              }
*/
              initEdit(
                context,
                widget.typePlayer.id,
                status,
                finalRuleId,
                widget.typePlayer.personalRule,
                widget.fromTab,
                _checkManageCollectorsPermit,
                _checkManageGeneralCollectorsPermit,
                _checkManageFootCollectorsPermit,
                _checkManageRulesPermit,
                _checkAssingRulePermit,
              );
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
    ));
  }

  SliverToBoxAdapter buildInputs() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
              margin: const EdgeInsets.all(10),
              elevation: 3,
              shadowColor: Colors.redAccent,
              child: Column(children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 22,
                    ),
                    Expanded(
                      child: Text(
                        "Configuraciones",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        "Estado",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                  ],
                ),
                SizedBox(
                  width: AppConfigSize.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Checkbox(
                          value: _checkActivo,
                          onChanged: (value) {
                            if (value != null) {
                              initUnLock(widget.typePlayer.id);
                            }
                          }),
                      const Text("Activo"),
                      Expanded(child: Container()),
                      Checkbox(
                          value: _checkBloqueo,
                          onChanged: (value) {
                            if (value != null) {
                              initLock(widget.typePlayer.id);
                            }
                          }),
                      const Text("Bloqueo"),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppConfigSize.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Checkbox(
                          value: _checkEliminado,
                          onChanged: (value) {
                            if (value != null) {
                              initDelete(widget.typePlayer.id);
                            }
                          }),
                      const Text("Eliminado"),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        "Aplicar de Inmediato",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                  ],
                ),
                SizedBox(
                  width: AppConfigSize.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Checkbox(
                          value: _checkResetPassword,
                          onChanged: (value) {
                            if (value != null) {
                              initResetPassword(widget.typePlayer.id);
                            }
                          }),
                      const Text("Resetear Contraseña"),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (GetItMock.typeOfUser() == 'Admin')
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Alerta'),
                          content: const Text('La asignación de una '
                              'regla '
                              'se ejecuta al iniciarse el '
                              'próximo '
                              'turno.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          "Reglas ",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Icon(Icons.info_rounded, color: Colors.red, size: 18),
                        SizedBox(
                          width: 22,
                        ),
                      ],
                    ),
                  ),
                if (GetItMock.typeOfUser() == 'Admin')
                  SizedBox(
                    width: AppConfigSize.screenWidth,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 22,
                        ),
                        Expanded(
                          child: reglasDropdownButton(),
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        IconButton(
                            onPressed: () {
                              goCreateRule(context);
                            },
                            icon: const Icon(Icons.add_road)),
                        IconButton(
                            onPressed: () {
                              goEditRule(
                                context,
                              );
                            },
                            icon: const Icon(Icons.edit_road)),
                        const SizedBox(
                          width: 22,
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
              ])),
          permisos(),
        ],
      ),
    );
  }

  listRuleNameItems() {
    return listRuler.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  onChangedRule(String? rule) {
    setState(() {
      selectedRule = rule ?? "";
    });
  }

  onTapRulesDropDown() {
    /*setState(() {
      listColors.remove('Select a color');
      selectedColor = 'Grizzle';
    });*/
  }

  reglasDropdownButton() {
    return BlocBuilder<GetRulesCubit, GetRulesState>(
      builder: (context, getPlayersState) {
        if (getPlayersState is GetRulesInitial ||
            getPlayersState is GetRulesLoading) {
          return const Row(
            children: [
              SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator()),
              SizedBox(
                width: 5,
              ),
              Text('Loading...'),
            ],
          );
        } else if (getPlayersState is GetRulesReady) {
          rules = (getPlayersState).rules;
          listRuler.clear();
          listIdRuler.clear();
          listRuler.add(GetItMock.generalRule.name!);
          listIdRuler.add(GetItMock.generalRule.id!);
          for (var rule in rules.rules!) {
            listRuler.add(rule.name!);
            listIdRuler.add(rule.id!);
          }
          listRuler = listRuler.toSet().toList();
          return reglasDropdownButton3();
        } else if (getPlayersState is GetPlayersError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<GetPlayersCubit>().fetchPlayers();
                  },
                  icon: const Icon(Icons.refresh, size: 36),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Intentar nuevamente...',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<GetPlayersCubit>().fetchPlayers();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    size: 26,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        }
      },
    );
  }

  listFatherItems(Rule rules) {
    return rules.rules!.map<DropdownMenuItem<String>>((RuleElement value) {
      return DropdownMenuItem(
        value: value.id.toString(),
        child: Text(value.name.toString()),
      );
    }).toList();
  }

  onChangedFather(String? ruleId) {
    setState(() {
      selectedRuleId = ruleId ?? "";
    });
  }

  reglasDropdownButton3() {
    return DropdownButton(
      items: listRuleNameItems(),
      value: selectedRule,
      icon: const Icon(
        Icons.rule_outlined,
        color: Colors.black54,
      ),
      elevation: 16,
      style: const TextStyle(
        color: Colors.black54,
      ),
      isExpanded: true,
      underline: Container(
        height: 1,
        color: Colors.grey,
      ),
      onChanged: onChangedRule,
      onTap: onTapRulesDropDown,
    );
  }

  void initEdit(
    context,
    userId,
    status,
    finalRuleId,
    currentRuleId,
    fromTab,
    checkManageCollectorsPermit,
    checkManageGeneralCollectorsPermit,
    checkManageFootCollectorsPermit,
    checkManageRulesPermit,
    checkAssingRulePermit,
  ) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LoadingScreen.show(context, "Guardando, por favor espere...");
        try {
          Map info = await PlayerAllRepository().editPlayer(
              userId,
              status,
              checkManageCollectorsPermit,
              checkManageGeneralCollectorsPermit,
              checkManageFootCollectorsPermit,
              checkManageRulesPermit,
              checkAssingRulePermit,
              finalRuleId,currentRuleId);
          if ((info['message'] != null) ||
              (info['messageRule'] != null) ||
              info['success'] != null) {
            if (info['success'] != null) {
              if (info['success'] as bool) {
                LoadingScreen.hide(context);
                setState(() {
                  popFrom(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayersDashboard(
                              defaultTabIndex: fromTab,
                            )),
                  );
                  showInfo(context, "Guardado correctamente...");
                });
              } else {
                setState(() {
                  LoadingScreen.hide(context);
                });
                popFrom(context);
                alert(context, 'Error al intentar guardar. ${info['message']}');
              }
            } else if (info['message'] != null ||
                (info['messageRule'] != null)) {
              setState(() {
                LoadingScreen.hide(context);
              });
              if (info['message'] != null || (info['messageRule'] != null)) {
                alert(context, "Ups no se pudo guardar.");
              }
            }
          }
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, 'Error al intentar guardar.');
        }
      }
    } catch (e) {
      print('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void initLock(userId) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LoadingScreen.show(context, "Bloqueando, por favor espere...");
        try {
          Map info = await PlayerProvider().lockPlayer(userId);
          if ((info['message'] != null) || info['success'] != null) {
            if (info['success'] != null) {
              if (info['success'] as bool) {
                LoadingScreen.hide(context);
                setState(() {
                  _checkInicial = false;
                  _checkActivo = false;
                  _checkBloqueo = true;
                  _checkEliminado = false;
                });
              } else {
                setState(() {
                  LoadingScreen.hide(context);
                });
                popFrom(context);
                alert(
                    context,
                    'Error al intentar bloquear. '
                    '${info['message']}');
              }
            } else if (info['message'] != null) {
              setState(() {
                LoadingScreen.hide(context);
              });
              alert(context, "Revise su conexión a internet");
            }
          }
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      print('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void initUnLock(userId) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LoadingScreen.show(context, "Bloqueando, por favor espere...");
        try {
          Map info = await PlayerProvider().unLockPlayer(userId);
          print("INFO: $info");
          if ((info['message'] != null) || info['success'] != null) {
            if (info['success'] != null) {
              if (info['success'] as bool) {
                LoadingScreen.hide(context);
                setState(() {
                  _checkActivo = true;
                  _checkBloqueo = false;
                  _checkEliminado = false;
                });
              } else {
                print("Error");
                setState(() {
                  LoadingScreen.hide(context);
                });
                popFrom(context);
                alert(
                    context,
                    'Error al intentar bloquear. '
                    '${info['message']}');
              }
            } else if (info['message'] != null) {
              setState(() {
                LoadingScreen.hide(context);
              });
              alert(context, "Revise su conexión a internet");
            }
          }
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      print('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void initDelete(userId) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LoadingScreen.show(context, "Eliminando, por favor espere...");
        try {
          Map info = await PlayerProvider().deletePlayer(userId);
          print("INFO: $info");
          if ((info['message'] != null) || info['success'] != null) {
            if (info['success'] != null) {
              if (info['success'] as bool) {
                LoadingScreen.hide(context);
                setState(() {
                  _checkInicial = false;
                  _checkActivo = false;
                  _checkBloqueo = false;
                  _checkEliminado = true;
                });
              } else {
                print("Error");
                setState(() {
                  LoadingScreen.hide(context);
                });
                popFrom(context);
                alert(
                    context,
                    'Error al intentar eliminar. '
                    '${info['message']}');
              }
            } else if (info['message'] != null) {
              setState(() {
                LoadingScreen.hide(context);
              });
              alert(context, "Revise su conexión a internet");
            }
          }
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      print('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void initInitial(userId) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LoadingScreen.show(context, "Eliminando, por favor espere...");
        try {
          Map info = await PlayerProvider().unLockPlayer(userId);
          print("INFO: $info");
          if ((info['message'] != null) || info['success'] != null) {
            if (info['success'] != null) {
              if (info['success'] as bool) {
                LoadingScreen.hide(context);
                setState(() {
                  _checkInicial = false;
                  _checkActivo = false;
                  _checkBloqueo = false;
                  _checkEliminado = true;
                });
              } else {
                print("Error");
                setState(() {
                  LoadingScreen.hide(context);
                });
                popFrom(context);
                alert(
                    context,
                    'Error al intentar eliminar. '
                    '${info['message']}');
              }
            } else if (info['message'] != null) {
              setState(() {
                LoadingScreen.hide(context);
              });
              alert(context, "Revise su conexión a internet");
            }
          }
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      print('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void initResetPassword(userId) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        LoadingScreen.show(context, "Actualizando, por favor espere...");
        try {
          Map info = await PlayerProvider().resetPassword(userId);
          print("INFO: $info");
          if ((info['message'] != null) || info['success'] != null) {
            if (info['success'] != null) {
              if (info['success'] as bool) {
                LoadingScreen.hide(context);
                setState(() {
                  _checkResetPassword = true;
                });
              } else {
                print("Error");
                setState(() {
                  LoadingScreen.hide(context);
                });
                popFrom(context);
                alert(
                    context,
                    'Error al intentar resetear la contraseña. '
                    '${info['message']}');
              }
            } else if (info['message'] != null) {
              setState(() {
                LoadingScreen.hide(context);
              });
              alert(context, "Error. " + info['message']);
            }
          }
        } catch (e) {
          print("Error $e");
          LoadingScreen.hide(context);
          alert(context, "Revise su conexión a internet");
        }
      }
    } catch (e) {
      print('not connected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Revise su conexión a internet. Intente nuevamente..."),
          duration: Duration(seconds: 2),
        ),
      );
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
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Si, Cancelar'),
              ),
            ],
          );
        });
  }

  Future<void> goAdd() async {
    // showAlertAdd(context, limitationRequestEntity);
    // var result = await limitationQueueRepository
    //     .addLimitationQueueById(limitationRequestEntity);
    // result! ? success() : fail();
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

  fail() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Error al intentar Guardar."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  void goCreateRule(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ReglasView(
              ruleName: 'new',
              ruleElement: null,
            )));
  }

  void goEditRule(BuildContext context) {
    List<RuleElement> rules = [];
    rules.addAll(GetItMock.privateRules.rules!);
    rules.add(GetItMock.generalRule);
    RuleElement rule =
        rules.firstWhere((element) => element.name == selectedRule);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReglasView(
              ruleName: rule.name!,
              ruleElement: rule,
            )));
  }

  bool goReset() {
    return (_checkManageGeneralCollectorsPermit ||
        _checkManageCollectorsPermit ||
        _checkManageFootCollectorsPermit ||
        _checkManageRulesPermit ||
        _checkAssingRulePermit);
  }

  permisos() {
    final userType = widget.typePlayer.userType;
    switch (userType) {
      case "FootCollector":
        return Container();
      case "Collector":
        return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            shadowColor: Colors.redAccent,
            child: Column(children: [
              const Row(
                children: [
                  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Permisos",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Expanded(
                    child: Text(
                      "Gestionar",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                    height: 50,
                  ),
                  if (goReset())
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _checkManageGeneralCollectorsPermit = false;
                            _checkManageCollectorsPermit = false;
                            _checkManageFootCollectorsPermit = false;
                            _checkManageRulesPermit = false;
                            _checkAssingRulePermit = false;
                          });
                        },
                        child: const Text(
                          "Reiniciar",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ))
                  else
                    const SizedBox(width: 20)
                ],
              ),
              SizedBox(
                width: AppConfigSize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                        value: _checkManageFootCollectorsPermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkManageFootCollectorsPermit = value;
                            });
                          }
                        }),
                    const Text("Listeros"),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: const [
              //     SizedBox(
              //       width: 22,
              //     ),
              //     Expanded(
              //       child: Text(
              //         "Reglas",
              //         style: TextStyle(
              //           fontStyle: FontStyle.normal,
              //           fontSize: 18,
              //         ),
              //         textAlign: TextAlign.left,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 22,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   width: AppConfigSize.screenWidth,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Checkbox(
              //           value: _checkManageRulesPermit,
              //           onChanged: (value) {
              //             if (value != null) {
              //               setState(() {
              //                 _checkManageRulesPermit = value;
              //               });
              //             }
              //           }),
              //       const Text("Administrar"),
              //       Expanded(child: Container()),
              //       Checkbox(
              //           value: _checkAssingRulePermit,
              //           onChanged: (value) {
              //             if (value != null) {
              //               setState(() {
              //                 _checkAssingRulePermit = value;
              //               });
              //             }
              //           }),
              //       const Text("Asignar"),
              //       // Expanded(child: Container()),
              //       // Checkbox(
              //       //     value: _checkRulePermitDelete,
              //       //     onChanged: (value) {
              //       //       if (value != null) {
              //       //         setState(() {
              //       //           _checkRulePermitDelete = value;
              //       //         });
              //       //       }
              //       //     }),
              //       // const Text("Eliminar"),
              //       Expanded(child: Container()),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
            ]));

      case "GeneralCollector":
        return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            shadowColor: Colors.redAccent,
            child: Column(children: [
              const Row(
                children: [
                  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Permisos",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Expanded(
                    child: Text(
                      "Gestionar",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                    height: 50,
                  ),
                  if (goReset())
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _checkManageGeneralCollectorsPermit = false;
                            _checkManageCollectorsPermit = false;
                            _checkManageFootCollectorsPermit = false;
                            _checkManageRulesPermit = false;
                            _checkAssingRulePermit = false;
                          });
                        },
                        child: const Text(
                          "Reiniciar",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ))
                  else
                    const SizedBox(width: 20)
                ],
              ),
              SizedBox(
                width: AppConfigSize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    // Checkbox(
                    //     value: _checkManageFootCollectorsPermit,
                    //     onChanged: (value) {
                    //       if (value != null) {
                    //         setState(() {
                    //           _checkManageFootCollectorsPermit = value;
                    //         });
                    //       }
                    //     }),
                    // const Text("Listeros"),
                    // Expanded(child: Container()),
                    Checkbox(
                        value: _checkManageCollectorsPermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkManageCollectorsPermit = value;
                            });
                          }
                        }),
                    const Text("Colector"),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: const [
              //     SizedBox(
              //       width: 22,
              //     ),
              //     Expanded(
              //       child: Text(
              //         "Reglas",
              //         style: TextStyle(
              //           fontStyle: FontStyle.normal,
              //           fontSize: 18,
              //         ),
              //         textAlign: TextAlign.left,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 22,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   width: AppConfigSize.screenWidth,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Checkbox(
              //           value: _checkManageRulesPermit,
              //           onChanged: (value) {
              //             if (value != null) {
              //               setState(() {
              //                 _checkManageRulesPermit = value;
              //               });
              //             }
              //           }),
              //       const Text("Administrar"),
              //       Expanded(child: Container()),
              //       Checkbox(
              //           value: _checkAssingRulePermit,
              //           onChanged: (value) {
              //             if (value != null) {
              //               setState(() {
              //                 _checkAssingRulePermit = value;
              //               });
              //             }
              //           }),
              //       const Text("Asignar"),
              //       // Expanded(child: Container()),
              //       // Checkbox(
              //       //     value: _checkRulePermitDelete,
              //       //     onChanged: (value) {
              //       //       if (value != null) {
              //       //         setState(() {
              //       //           _checkRulePermitDelete = value;
              //       //         });
              //       //       }
              //       //     }),
              //       // const Text("Eliminar"),
              //       Expanded(child: Container()),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
            ]));

      default:
        return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            shadowColor: Colors.redAccent,
            child: Column(children: [
              const Row(
                children: [
                  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Permisos",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Expanded(
                    child: Text(
                      "Gestionar",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                    height: 50,
                  ),
                  if (goReset())
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _checkManageGeneralCollectorsPermit = false;
                            _checkManageCollectorsPermit = false;
                            _checkManageFootCollectorsPermit = false;
                            _checkManageRulesPermit = false;
                            _checkAssingRulePermit = false;
                          });
                        },
                        child: const Text(
                          "Reiniciar",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ))
                  else
                    const SizedBox(width: 20)
                ],
              ),
              SizedBox(
                width: AppConfigSize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                        value: _checkManageFootCollectorsPermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkManageFootCollectorsPermit = value;
                            });
                          }
                        }),
                    const Text("Listeros"),
                    Expanded(child: Container()),
                    Checkbox(
                        value: _checkManageCollectorsPermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkManageCollectorsPermit = value;
                            });
                          }
                        }),
                    const Text("Colector"),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              SizedBox(
                width: AppConfigSize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                        value: _checkManageGeneralCollectorsPermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkManageGeneralCollectorsPermit = value;
                            });
                          }
                        }),
                    const Text("Colector General"),
                    Expanded(child: Container()),
                    // Checkbox(
                    //     value: _checkPlayerPermitBlock,
                    //     onChanged: (value) {
                    //       if (value != null) {
                    //         setState(() {
                    //           _checkPlayerPermitBlock = value;
                    //         });
                    //       }
                    //     }),
                    // const Text("Bloquear"),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 22,
                  ),
                  Text(
                    "Reglas",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                ],
              ),
              SizedBox(
                width: AppConfigSize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                        value: _checkManageRulesPermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkManageRulesPermit = value;
                            });
                          }
                        }),
                    const Text("Administrar"),
                    Expanded(child: Container()),
                    Checkbox(
                        value: _checkAssingRulePermit,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _checkAssingRulePermit = value;
                            });
                          }
                        }),
                    const Text("Asignar"),
                    // Expanded(child: Container()),
                    // Checkbox(
                    //     value: _checkRulePermitDelete,
                    //     onChanged: (value) {
                    //       if (value != null) {
                    //         setState(() {
                    //           _checkRulePermitDelete = value;
                    //         });
                    //       }
                    //     }),
                    // const Text("Eliminar"),
                    Expanded(child: Container()),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]));
    }
  }
}
