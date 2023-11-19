import 'package:flutter/material.dart';

class Centena extends StatefulWidget {
  const Centena({super.key});

  static const String routeName = "centena";

  @override
  State<Centena> createState() => _CentenaState();
}

var resto = 0.0;

class _CentenaState extends State<Centena> {
  String centena = "";
  String apuesta = "";
  bool selecC = true;
  bool selecA = false;
  final bool _flagGuardOverflow = true;

  get textMessagesStyle => const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Agreagar numero",
                        style: TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputCircularNumber1(),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _btnIzqda(size),
                            _teclado(context),
                            _btnDerecha(size),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void _selectDerecha() {
    if (selecC) {
      selecC = false;
      selecA = true;
    }
  }

  _btnDerecha(size) {
    return GestureDetector(
      child: SizedBox(
        width: size.width * 0.15,
        height: double.maxFinite,
        child: FloatingActionButton(
          heroTag: 'centenarr',
          onPressed: () {
            setState(() {
              _selectDerecha();
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  _btnIzqda(size) {
    return GestureDetector(
      child: SizedBox(
        width: size.width * 0.15,
        height: double.maxFinite,
        child: FloatingActionButton(
          heroTag: 'centenal',
          onPressed: () {
            setState(() {
              _selectIzqda();
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.keyboard_arrow_left),
        ),
      ),
    );
  }

  void _selectIzqda() {
    if (selecA) {
      selecC = true;
      selecA = false;
    }
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacementNamed(context, "home");
    // await showDialog or Show add banners or whatever
    // then
    return Future.value(true);
  }

  Widget _texto(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Color.fromARGB(
            255,
            33,
            150,
            235,
          )),
    );
  }

  Widget inputCircularNumber1() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selecC = true;
          selecA = false;
        });
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecC == true ? Colors.blue : Colors.white,
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(centena),
            ],
          )),
    );
  }

  Widget inputCircularNumber2() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selecC = false;
          selecA = true;
        });
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecA == true ? Colors.blue : Colors.white,
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(apuesta),
            ],
          )),
    );
  }

  Widget _teclado(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena7',
                  onPressed: () {
                    setState(() {
                      _selecBtn("7");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "7",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena8',
                  onPressed: () {
                    setState(() {
                      _selecBtn("8");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "8",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena9',
                  onPressed: () {
                    setState(() {
                      _selecBtn("9");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "9",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena4',
                  onPressed: () {
                    setState(() {
                      _selecBtn("4");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "4",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena5',
                  onPressed: () {
                    setState(() {
                      _selecBtn("5");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "5",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena6',
                  onPressed: () {
                    setState(() {
                      _selecBtn("6");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "6",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena1',
                  onPressed: () {
                    setState(() {
                      _selecBtn("1");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "1",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena2',
                  onPressed: () {
                    setState(() {
                      _selecBtn("2");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "2",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena3',
                  onPressed: () {
                    setState(() {
                      _selecBtn("3");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "3",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centenad',
                  onPressed: () {
                    setState(() {});
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.arrow_back_rounded),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centenadot',
                  onPressed: () {
                    setState(() {
                      if (!apuesta.contains(".") && !selecC) {
                        _selecBtn(".");
                      }
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text("."),
                )),
            const SizedBox(width: 18.0),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 'centena0',
                  onPressed: () {
                    setState(() {
                      _selecBtn("0");
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: const Text(
                    "0",
                    style: TextStyle(fontSize: 36),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Future<void> _selecBtn(String btn) async {
    if (centena.length < 2) {
      centena = centena + btn;
      if (centena.length == 2) {}
    } else {}
  }

  void _reset() {
    setState(() {
      centena = "";
    });
  }
}
