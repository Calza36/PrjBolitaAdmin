import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';
import 'package:untitled/src/ui/pages/home/home_page.dart';
import 'package:untitled/src/ui/pages/pass_register/pass_screen.dart';

class PassScreenRegister extends StatefulWidget {
  const PassScreenRegister({super.key});

  @override
  State<StatefulWidget> createState() => _PassScreenRegister();
}

class _PassScreenRegister extends State<PassScreenRegister> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool? isAuthenticated = GetItMock.prefs.getBool('authenticated');

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }


  // @override
  // Widget build(BuildContext context) {
  //   String? pin = GetItMock.prefs.getString("pin");
  //   if (pin != null && pin != "" && pin != "null") {
  //     Future.delayed(Duration.zero, () {
  //       //Navigator.pushReplacementNamed(context, "pass");
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const PassScreen()),
  //       );
  //     });
  //     return const SizedBox();



  @override
  Widget build(BuildContext context) {
    if (GetItMock.prefs.getString("pin") != "" &&
        GetItMock.prefs.getString("pin") != null &&
        GetItMock.prefs.getString("pin") != "null") {
      Future.delayed(Duration.zero, () {
        //Navigator.pushReplacementNamed(context, "pass");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PassScreen()),
        );
      });
      return const SizedBox();
    } else {
      return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Pantalla de bloqueo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Bienvenido, registre su PIN personal',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              _lockScreenButton(context),
            ],
          ),
        ),
      );
    }
  }

  _lockScreenButton(BuildContext context) => MaterialButton(
        padding: const EdgeInsets.only(left: 50, right: 50),
        color: Theme.of(context).primaryColor,
        child: const Text(
          'Registrar',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        onPressed: () {
          _showLockScreen(
            context,
            opaque: false,
            cancelButton: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              semanticsLabel: 'Cancelar',
            ),
          );
        },
      );

  _showLockScreen(BuildContext context,
      {required bool opaque,
      CircleUIConfig? circleUIConfig,
      KeyboardUIConfig? keyboardUIConfig,
      Widget? cancelButton,
      List<String>? digits}) {
    Future.delayed(Duration.zero, () {
      Navigator.push(
          context,
          PageRouteBuilder(
            opaque: opaque,
            pageBuilder: (context, animation, secondaryAnimation) =>
                PasscodeScreen(
              title: const Text(
                'Dgite el PIN',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              circleUIConfig: circleUIConfig,
              keyboardUIConfig: keyboardUIConfig,
              passwordEnteredCallback: _passcodeEntered,
              cancelButton: cancelButton!,
              deleteButton: const Text(
                'Eliminar',
                style: TextStyle(fontSize: 16, color: Colors.white),
                semanticsLabel: 'Eliminar',
              ),
              shouldTriggerVerification: _verificationNotifier.stream,
              backgroundColor: Colors.black.withOpacity(0.8),
              cancelCallback: _passcodeCancelled,
              digits: digits,
              passwordDigits: 4,
            ),
          ));
    });
  }

  _passcodeEntered(String enteredPasscode) {
    // var rules = RulesProvider();
    // rules.rules();
    GetItMock.prefs.setString("pin", enteredPasscode);
    Future.delayed(Duration.zero, () {
      //Navigator.pushReplacementNamed(context, "home");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  _passcodeCancelled() {
    Future.delayed(Duration.zero, () {
      Navigator.maybePop(context);
    });
  }
}
