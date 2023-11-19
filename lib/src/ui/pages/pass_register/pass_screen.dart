import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';
import 'package:untitled/src/ui/pages/home/home_page.dart';

class PassScreen extends StatefulWidget {
  const PassScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PassScreen();
}

class _PassScreen extends State<PassScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool? isAuthenticated = GetItMock.prefs.getBool('authenticated');

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const PassScreen()),
          );
          return false;
        },
        child: Scaffold(
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
                  'Usted no está autenticado',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                _lockScreenButton(context),
              ],
            ),
          ),
        ));
  }

  _lockScreenButton(BuildContext context) => MaterialButton(
        padding: const EdgeInsets.only(left: 50, right: 50),
        color: const Color.fromRGBO(152, 41, 33, 1),
        child: const Text(
          'Desbloquear',
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
                'Digite el PIN',
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
              bottomWidget: _passcodeRestoreButton(),
            ),
          ));
    });
  }

  _passcodeEntered(String enteredPasscode) {
    if (enteredPasscode == GetItMock.prefs.getString("pin")) {
      setState(() {
        Future.delayed(Duration.zero, () {
          //Navigator.pushReplacementNamed(context, "Home");
          GetItMock.loadRules();
          Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false,
          );
        });
      });
    }
  }

  _passcodeCancelled() {
    Future.delayed(Duration.zero, () {
      Navigator.maybePop(context);
    });
  }

  _passcodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: ElevatedButton(
            onPressed: _resetApplicationPassword,
            child: const Text(
              "Reiniciar PIN",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

  _resetApplicationPassword() {
    Future.delayed(Duration.zero, () {
      Navigator.maybePop(context).then((result) {
        if (!result) {
          return;
        }
        _restoreDialog(() {});
      });
    });
  }

  _restoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[50],
          title: const Text(
            "Reiniciar PIN",
            style: TextStyle(color: Colors.black87),
          ),
          content: const Text(
            "Reiniciar el PIN lo obligara a inicar nuevamente sesión!\nEstá seguro que quiere reiniciar?",
            style: TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: const Text(
                "Cancelar",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  Future.delayed(Duration.zero, () {
                    Navigator.maybePop(context);
                  });
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  GetItMock.prefs.remove('access_token');
                  GetItMock.prefs.remove('refresh_token');
                  GetItMock.prefs.remove('key');
                  GetItMock.prefs.remove('pin');
                  Future.delayed(Duration.zero, () {
                    Navigator.pushReplacementNamed(context, "/");
                  });
                });
              },
              child: const Text(
                "Aceptar",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
