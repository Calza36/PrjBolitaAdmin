import 'package:flutter/material.dart';

import '../../../../../aplication/type_of_user.dart';
import '../../../../../data/services/get_it_mock.dart';
import '../../../../../domain/all_players/entity/index.dart';
import '../../../../../infrastructure/player_all/datasources/implementation/player_all_repository.dart';
import '../../../../../tools/app_config_size.dart';

class AddPlayerPageStage extends StatefulWidget {
  final bool editMode;
  final TypeOfUser addPlayerType;
  final String? editPlayerType;
  final dynamic player;
  final List<PlayerAbstractEntity> players;

  const AddPlayerPageStage(
      {Key? key,
      required this.editMode,
      required this.addPlayerType,
      this.editPlayerType,
      this.player,
      required this.players})
      : super(key: key);

  @override
  AddPlayerPageState createState() => AddPlayerPageState();
}

class AddPlayerPageState extends State<AddPlayerPageStage>
    with SingleTickerProviderStateMixin<AddPlayerPageStage> {
  TypeOfUser? _type = TypeOfUser.unselected;
  bool _typeFlatValid = true;
  bool _flatSelectedFather = true;
  bool _flatShowSelectFather = false;
  List<String> listFather = <String>[];
  String? selectedFather;
  bool flatSelectedType = false;
  bool flatEditLoaded = false;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  BuildContext get context => super.context;

  bool isAdmin() {
    String typeOfUser = GetItMock.typeOfUser();
    return typeOfUser == 'Admin';
  }

  bool isGeneralCollector() {
    String typeOfUser = GetItMock.typeOfUser();
    return typeOfUser == 'GeneralCollector';
  }

  bool isCollector() {
    String typeOfUser = GetItMock.typeOfUser();
    return typeOfUser == 'Collector';
  }

  @override
  void initState() {
    if (widget.addPlayerType == TypeOfUser.collector) {
      var rListFather = widget.players
          .where((element) => element.typeOfUser == "GeneralCollector")
          .toList()
          .map((e) => e.namePlayer)
          .toList();
      listFather = rListFather;
    }
    if (widget.addPlayerType == TypeOfUser.footcollector) {
      var rListFather = widget.players
          .where((element) => element.typeOfUser == "Collector")
          .toList()
          .map((e) => e.namePlayer)
          .toList();
      listFather = rListFather;
    }
    super.initState();
  }
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    if (widget.editMode) {
      selectedFather = listFather.first;
      _type = TypeOfUser.generalcollector;
      flatEditLoaded = true;
    } else {
      flatEditLoaded = false;
    }
    String typeOfUser = '';
    if (widget.addPlayerType == TypeOfUser.generalcollector) {
      typeOfUser = 'Colector General';
    } else if (widget.addPlayerType == TypeOfUser.collector) {
      typeOfUser = 'Colector';
      _flatShowSelectFather = true;
    } else if (widget.addPlayerType == TypeOfUser.footcollector) {
      typeOfUser = 'Listero';
      _flatShowSelectFather = true;
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              widget.editMode ? "Edit $typeOfUser" : "Agregar $typeOfUser"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: CustomScrollView(slivers: <Widget>[
            buildInputs(),
            buildNextButton(),
          ]),
        ),
      ),
    );
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
              //validateFather();
              //_typeValidator();
              // if (_formKey.currentState!.validate() &&_type != TypeOfUser.unselected &&selectedFather != null) {
              if (_formKey.currentState!.validate()) {
                String fatherName = selectedFather.toString();
                String userName = _userController.text;
                String password = _passwordController.text;
                String typeOfUser = "";
                String idFather = "";
                if (isGeneralCollector() || isCollector()) {
                  idFather = GetItMock.prefs.getString('user_id')!;
                }
                if (widget.addPlayerType == TypeOfUser.generalcollector) {
                  typeOfUser = 'GeneralCollector';
                  idFather = GetItMock.prefs.getString('user_id')!;
                } else if (widget.addPlayerType == TypeOfUser.collector) {
                  typeOfUser = 'Collector';
                  idFather = widget.players
                      .firstWhere((element) => element.namePlayer == fatherName)
                      .idPlayer;
                } else if (widget.addPlayerType == TypeOfUser.footcollector) {
                  typeOfUser = 'FootCollector';
                  idFather = widget.players
                      .firstWhere((element) => element.namePlayer == fatherName)
                      .idPlayer;
                }
                // final idFather = (fatherName == 'TheBoss')
                //     ? GetItMock.prefs.getString('user_id')!
                //     : widget.players
                //         .firstWhere(
                //             (element) => element.namePlayer == fatherName)
                //         .idPlayer;

                addUser(context, userName, password, typeOfUser, idFather, '');
              }
              //

              //showAlertGuardar(context);
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

  String? _userValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Entre un nombre de usuario.";
    }
    return null;
  }

  String? _paswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Entre una Contraseña";
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])' r'.{8,}$';
    RegExp regex = RegExp(pattern);
    if (value.length < 8) {
      return "Contraseña corta.";
    }
    /*else if (!regex.hasMatch(value)) {
      return "Entre una Contraseña fuerte.";
    }*/

    return null;
  }

  String? _descriptionValidator(String? value) {
    /*if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!
          .screen_details_of_new_prod_description_validator_text;
    }*/
    return null;
  }

  bool _typeValidator() {
    if (_type == TypeOfUser.unselected) {
      setState(() {
        _typeFlatValid = false;
      });
      return false;
    } else {
      return true;
    }
  }

  SliverToBoxAdapter buildInputs() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 22,
              ),
              Expanded(
                child: TextFormField(
                  controller: _userController,
                  validator: _userValidator,
                  decoration: const InputDecoration(
                    hintText: 'Nombre de Usuario',
                  ),
                  onChanged: (String? text) {
                    _formKey.currentState!.validate();
                  },
                ),
              ),
              const SizedBox(
                width: 22,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //Pasword Section
          Row(
            children: [
              const SizedBox(
                width: 22,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  controller: _passwordController,
                  validator: _paswordValidator,
                  decoration:   InputDecoration(
                    hintText: 'Contraseña',
                    suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                  ),
                  obscureText: _obscureText,
                  onChanged: (String? text) {
                    _formKey.currentState!.validate();
                  },
                ),
              ),
              const SizedBox(
                width: 22,
              ),
            ],
          ),

          const SizedBox(
            height: 40,
          ),

          //typeListRadioButton(),
          const SizedBox(
            width: 22,
          ),
          _flatShowSelectFather
              ? Row(
                  children: [
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(child: fatherDropdownButton()),
                    const SizedBox(
                      width: 22,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  listFatherItems() {
    return listFather.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  onChangedFather(String? father) {
    setState(() {
      selectedFather = father ?? "";
      _flatSelectedFather = false;
    });
  }

  onTapColorDropDown() {
    _flatSelectedFather = false;
  }

  fatherDropdownButton() {
    return DropdownButton(
      items: listFatherItems(),
      hint: Text(
        "Escoger padre.",
        style: TextStyle(
          fontSize: 16,
          color: !_flatSelectedFather ? Colors.black54 : Colors.red,
        ),
      ),
      value: selectedFather,
      icon: Icon(Icons.account_box,
          color: !_flatSelectedFather ? Colors.black54 : Colors.red),
      elevation: 16,
      style:
          TextStyle(color: !_flatSelectedFather ? Colors.black54 : Colors.red),
      isExpanded: true,
      underline: Container(
        height: 1,
        color: !_flatSelectedFather ? Colors.grey : Colors.red,
      ),
      onChanged: onChangedFather,
      onTap: onTapColorDropDown,
    );
  }

  typeListRadioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Text(
              'Escoja el tipo de Usuario:',
              style: TextStyle(
                fontSize: 16,
                color: _typeFlatValid ? Colors.black54 : Colors.red,
              ),
            ),
          ],
        ),
        RadioListTile<TypeOfUser>(
          title: const Text('Colector General'),
          selected: true,
          value: TypeOfUser.generalcollector,
          groupValue: _type,
          onChanged: (TypeOfUser? value) {
            if (_flatSelectedFather) {
              setState(() {
                _type = value;
                _typeFlatValid = true;
                listFather = ['TheBoss'];
              });
            }
          },
        ),
        RadioListTile<TypeOfUser>(
          title: const Text('Colector'),
          selected: true,
          value: TypeOfUser.collector,
          groupValue: _type,
          onChanged: (TypeOfUser? value) {
            if (_flatSelectedFather) {
              setState(() {
                _type = value;
                var rListFather = widget.players
                    .where(
                        (element) => element.typeOfUser == "GeneralCollector")
                    .toList()
                    .map((e) => e.namePlayer)
                    .toList();
                listFather = rListFather;
              });
            }
          },
        ),
        RadioListTile<TypeOfUser>(
          title: const Text('Listero'),
          selected: true,
          value: TypeOfUser.footcollector,
          groupValue: _type,
          onChanged: (TypeOfUser? value) {
            if (_flatSelectedFather) {
              setState(() {
                _type = value;
                var rListFather = widget.players
                    .where((element) => element.typeOfUser == "Collector")
                    .toList()
                    .map((e) => e.namePlayer)
                    .toList();
                listFather = rListFather;
              });
            }
          },
        ),
      ],
    );
  }

  bool validateFather() {
    if (selectedFather == null) {
      setState(() {
        _flatSelectedFather = false;
      });
      return false;
    }
    return true;
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

  success() {
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

  showAlertAdd(BuildContext context) {
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

  fail(result) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error al intentar Guardar.\n$result"),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> addUser(BuildContext context, String name, String password,
      String userType, String superiorId, key) async {
    showAlertAdd(context);
    var result = await PlayerAllRepository()
        .addPlayer(name, key, password, superiorId, userType);
    if (result['success'] != null) {
      success();
    } else {
      fail(result['message']);
    }
  }
}
