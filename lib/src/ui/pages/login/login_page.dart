import 'dart:io';

import 'package:flutter/material.dart';

import '../../../app.dart';
import '../../../data/services/get_it_mock.dart';
import '../../../data/source/usuario_provider.dart';
import '../../../data/util/util.dart';
import 'loadin_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String pass = "";
String user = "";
String userEdit = "";
String passEdit = "";
String passNew = "";
String passConfirmada = "";
bool click = true;
bool changePass = false;
bool errPass = true;
bool errPassedit = true;

final usuarioProvider = UserProvider();

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkedLogin(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
              body: Stack(
            children: <Widget>[
              _crearFondo(context),
              _loginForm(context),
            ],
          ));
        });
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoAzul = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[Colors.red, Colors.deepOrange])),
    );

    final circulos = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: const Color.fromRGBO(225, 255, 255, 0.1)),
    );

    return Stack(
      children: <Widget>[
        fondoAzul,
        Positioned(
          top: 90,
          left: 30,
          child: circulos,
        ),
        Positioned(
          top: -40,
          right: -30,
          child: circulos,
        ),
        Positioned(
          bottom: -50,
          right: -10,
          child: circulos,
        ),
        Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: const Column(
            children: <Widget>[
              Icon(
                Icons.attractions_sharp,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text("Administración",
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SafeArea(
            child: Container(
          height: 225.0,
        )),
        Container(
          width: size.width * 0.85,
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              const Text(
                "Iniciar sesión",
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
              const SizedBox(
                height: 50.0,
              ),
              _userBox(),
              const SizedBox(
                height: 30.0,
              ),
              _passBox(),
              const SizedBox(
                height: 30.0,
              ),
              _crearBoton(context)
            ],
          ),
        ),
        const SizedBox(height: 15),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     GestureDetector(
        //       onTap: () => _mostrarAlert(context),
        //       child: const Text(
        //         "Modificar la contraseña",
        //         style:
        //             TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     // const Text("Entrar sin conexion",
        //     //     style:
        //     //         TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        //   ],
        // ),
      ]),
    );
  }

  Widget _userBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: const InputDecoration(
          icon: Icon(
            Icons.alternate_email,
            color: Colors.redAccent,
          ),
          hintText: "Escriba su nombre de usuario",
          labelText: "Usuario",
        ),
        onChanged: (valor) {
          user = valor;
          setState(() {});
        },
      ),
    );
  }

  Widget _passBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock_outlined,
              color: Colors.redAccent,
            ),
            errorText: errPass
                ? null
                : "La contraseña debe contener más de 5 caracteres",
            hintText: "Escriba su contraseña",
            labelText: "Contraseña"),
        onChanged: (valor) {
          pass = valor;
          errPass = _verificaErrorPass();
          setState(() {});
        },
      ),
    );
  }

  Widget _crearBoton(context) {
    return ElevatedButton(
      onPressed: _habilitarBtn()
          ? () {
              _verificarUser(user.trim(), pass, context);
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: const Text("Ingresar", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Modifique su contraseña",
              style: TextStyle(
                color: Color.fromRGBO(152, 41, 33, 1),
              ),
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              _editarUser(),
              const SizedBox(height: 12.0),
              _editarPassword(),
              const SizedBox(height: 12.0),
              _passwordActual(),
              const SizedBox(height: 12.0),
              _confirmarPassword(),
            ]),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  changePassword(userEdit, passEdit, passNew);
                  if (changePass) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        });
  }

  Widget _editarUser() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.person_pin,
              color: Colors.redAccent,
            ),
            hintText: "Escriba su nombre de usuario",
            labelText: "Usuario"),
        onChanged: (valor) {
          userEdit = valor;
        },
      ),
    );
  }

  Widget _editarPassword() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock_outlined,
            color: Colors.redAccent,
          ),
          errorText: errPassedit ? null : "Debe contener más de 5 caracteres",
          hintText: "Escriba su contraseña actual",
          labelText: "Contraseña actual",
        ),
        onChanged: (valor) {
          passEdit = valor;
          errPassedit = _passActualEdit();
          setState(() {});
        },
      ),
    );
  }

  Widget _passwordActual() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.lock_clock_outlined,
            color: Colors.redAccent,
          ),
          hintText: "Escriba su contraseña nueva",
          labelText: "Contraseña nueva",
        ),
        onChanged: (valor) {
          passNew = valor;
        },
      ),
    );
  }

  Widget _confirmarPassword() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock_clock_sharp,
              color: Colors.redAccent,
            ),
            hintText: "Confirme su contraseña nueva",
            labelText: "Contraseña de confirmacion"),
        onChanged: (valor) {
          passConfirmada = valor;
        },
      ),
    );
  }

  bool _verificaErrorPass() {
    if (pass.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  bool _habilitarBtn() {
    if (errPass == true && pass.isNotEmpty && user.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool _passActualEdit() {
    if (passEdit.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  void _verificarUser(String user, String pass, context) async {
    try {
      //google.com
      LoadingScreen.show(context, "Verificando usuario, por favor espere...");
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //LoadingScreen.show(context, "Verificando usuario, por favor espere...");
        try {
          Map info = await usuarioProvider.login(user, pass);
          if ((info['message'] != null) || info['ok'] != null) {
            if (info['ok'] != null) {
              if (info['ok'] as bool) {
                pass = "";
                user = "";
                LoadingScreen.hide(context);
                setLastLoginTime();
                Navigator.pushReplacementNamed(context, "register");
              } else {
                setState(() {
                  LoadingScreen.hide(context);
                });
                alert(context, "Verificar el nombre de usuario o contraseña");
              }
            } else if (info['message'] != null) {
              setState(() {
                LoadingScreen.hide(context);
                alert(context, info['message']);
              });
            }
          }
        } catch (e) {
          print("Error $e");
          setState(() {
            LoadingScreen.hide(context);
            alert(context, "Algo salió mal.");
          });
        }
      }
    } catch (e) {
      setState(() {
        LoadingScreen.hide(context);
        print('not connected');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Revise su conexión a internet. Intente nuevamente..."),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }

  void changePassword(
      String user, String oldPassword, String newPassword) async {
    if (!await usuarioProvider.changePassword(oldPassword, newPassword)) {
      alert(context, "Contraseña modificada correctamente");
      changePass = true;
    } else {
      alert(context, "Ocurrio un error al cambiar la Contraseña");
      changePass = false;
    }
  }

  Future _checkedLogin(context) async {
    if (GetItMock.prefs.getString('access_token') != null ) {
          if (GetItMock.prefs.getString('access_token')!.isNotEmpty) {
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacementNamed(context, "register");
            });
            return "true";
            }
    }
    return "false";
  }
}
