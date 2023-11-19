import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/get_it_mock.dart';
import '../../../data/source/provider_data.dart';
import '../../../data/util/util.dart';
import '../login/login_page.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  static const String routeName = "usuario";

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

final fieldPassActual = TextEditingController();
final fieldPass = TextEditingController();
final fieldPassConfirmada = TextEditingController();
final fieldUser = TextEditingController();

final control = Get.find<Crontrol>();

String user = "";
String passActual = "";
String passNew = "";
String passNewConfirmada = "";

bool erroPass = true;
bool erroPassActual = true;
bool erroPassConfirmada = true;

class _ChangePassPageState extends State<ChangePassPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  user = "";
                  passNew = "";
                  passNewConfirmada = "";
                  fieldPass.clear();
                  fieldPassConfirmada.clear();
                  fieldUser.clear();
                  Navigator.pushReplacementNamed(context, "home");
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Text(
                      " ListAdmin [ ${GetItMock.prefs.getString("user_name")} ] v1.0")),
            ],
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: size.height * 0.65,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Text(
                        "Modifica tu contraseña",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Color.fromRGBO(152, 41, 33, 1),
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // _crearUser(),
                      const SizedBox(height: 10),
                      _crearPassActual(),
                      const SizedBox(height: 10),
                      _crearEmail(),
                      const SizedBox(height: 15),
                      _crearPass(),
                      const SizedBox(height: 25),
                      _crearBoton()
                    ],
                  )),
            ),
          ),
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

  Widget _crearPassActual() {
    return TextField(
      obscureText: true,
      controller: fieldPassActual,
      onChanged: (value) {
        setState(() {
          passActual = value;
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Contraseña actual',
        labelText: 'Contraseña actual',
        suffixIcon: const Icon(Icons.location_history_outlined),
        icon: const Icon(Icons.perm_identity_outlined),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      obscureText: true,
      controller: fieldPass,
      onChanged: (value) {
        setState(() {
          passNew = value;
          erroPass = _verificarPassNew();
          erroPassConfirmada = _verificarPassConfirmada();
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contraseña nueva',
          labelText: 'Contraseña nueva',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
          errorText: erroPass ? null : "Debe tener minimo 6 caracteres"),
    );
  }

  Widget _crearPass() {
    return TextField(
        obscureText: true,
        controller: fieldPassConfirmada,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Contraseña de confrimacion',
            labelText: 'Contraseña de confrimacion',
            suffixIcon: const Icon(Icons.lock),
            icon: const Icon(Icons.password),
            errorText: erroPassConfirmada
                ? null
                : "Ambas contraseñas deben ser iguales"),
        onChanged: (valor) {
          setState(() {
            passNewConfirmada = valor;
            erroPassConfirmada = _verificarPassConfirmada();
          });
        });
  }

  Widget _crearBoton() {
    return FutureBuilder(
    future: Future.value(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            onPressed: _habitarBtn()
                ? () {
                    setState(() {
                      _sendData();
                    });
                  }
                : null,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: const Text(
                'Ingresar cambios',
                style: TextStyle(fontSize: 15),
              ),
            ));
      },
    );
  }

  bool _verificarPassNew() {
    if (passNew.length >= 6) {
      return true;
    }

    return false;
  }

  bool _verificarPassConfirmada() {
    if (passNewConfirmada.trim() == passNew.trim()) {
      return true;
    }
    return false;
  }

  bool _habitarBtn() {
    if (passNew.isNotEmpty &&
        erroPassConfirmada == true &&
        passNewConfirmada.isNotEmpty &&
        passNew.length >= 6) {
      return true;
    }
    return false;
  }

  void _sendData() async {
    if (!await usuarioProvider.changePassword(passActual, passNew)) {
      alert(context, "Contraseña modificada correctamente");
      passNew = "";
      passNewConfirmada = "";
      fieldPassActual.clear();
      fieldPass.clear();
      fieldPassConfirmada.clear();
      changePass = true;
    } else {
      alert(context, "Ocurrio un error al cambiar la Contraseña");
      changePass = false;
    }
  }

  bool _verificarPassActual(String passActual) {
    var temp = control.userPass;
    if (passActual == temp.toString()) {
      return true;
    }
    return false;
  }

  Widget _crearUser() {
    return TextField(
      controller: fieldUser,
      onChanged: (value) {
        setState(() {
          user = value;
        });
      },
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Escriba su nombre de usuario',
        labelText: 'Usuario',
        suffixIcon: const Icon(Icons.location_history_outlined),
        icon: const Icon(Icons.perm_identity_outlined),
      ),
    );
  }
}
