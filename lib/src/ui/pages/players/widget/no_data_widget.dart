import 'package:flutter/cupertino.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                top: 200,
                left: 20,
              ),
              child: Row(children: const [
                Center(
                    //child: Text("Tiempo de respuesta del servidor agotado.\nVerifique el acceso a Internet.")),
                    child: Text("No hay datos que mostrar.")),
                //ElevatedButton(onPressed: () {setState(() {});},child: Text("Reintentar"))
              ])),
        ],
      ),
    );
  }
}
