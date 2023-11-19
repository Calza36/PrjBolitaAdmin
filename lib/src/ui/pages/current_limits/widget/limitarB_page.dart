import 'package:flutter/material.dart';

class LimitarB extends StatelessWidget {
  LimitarB(
      {super.key, required this.numberSizeDay, required this.numberListDay});
  final int numberSizeDay;
  final List numberListDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              const Text(
                "Fijos y Corridos limitados",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 15),
                  const SizedBox(height: 5),
                  numberSizeDay == 0
                      ? const Text(
                          "  No hay limitados en este turno",
                        )
                      : Row(
                          children: [
                            const SizedBox(width: 3),
                            Wrap(
                              children: List.generate(numberSizeDay, (index) {
                                return numberLimitadosDay(index);
                              }),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberLimitadosDay(index) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(152, 41, 33, 1),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        numberListDay[index].toString().trim(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }
}
