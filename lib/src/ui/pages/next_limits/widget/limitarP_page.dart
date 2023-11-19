import 'package:flutter/material.dart';

class LimitarP extends StatelessWidget {
  const LimitarP(
      {super.key, required this.parleSizeDay, required this.parleListDay});

  final int parleSizeDay;
  final List parleListDay;
  static const String routeName = "limitarP";

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
              "Parle limitados",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                const SizedBox(height: 15),
                parleSizeDay == 0
                    ? const Text(
                        "   No hay limitados en este turno",
                      )
                    : Row(
                        children: [
                          const SizedBox(width: 3),
                          Wrap(
                            children: List.generate(parleSizeDay, (index) {
                              return ParleLimitadosDay(index);
                            }),
                          ),
                        ],
                      ),
                /* const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 5),
                    Text(
                      "Noche:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget ParleLimitadosDay(int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: 36,
          height: 60,
          margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(152, 41, 33, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 4,
            ),
            child:
                Text(parleListDay[index].toString().trim().replaceAll(',', ''),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
          )),
        ));
  }
}
