import 'package:flutter/material.dart';

void alert(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alerta !!"),
          content: Text(mensaje),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("ok"))
          ],
        );
      });
}

void showInfo(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Información."),
          content: Text(mensaje),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("ok"))
          ],
        );
      });
}
