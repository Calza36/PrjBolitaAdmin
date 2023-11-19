import 'package:get/get.dart';

class Crontrol extends GetxController {
  var userName = "".obs;
  var userPass = "".obs;
  var sumaTotal = (0.00).obs;
  var id_pk = 10000.obs;

  List<int> number = <int>[].obs;
  List<int> numberC = <int>[].obs;
  List<int> numberP1 = <int>[].obs;
  List<int> numberP2 = <int>[].obs;
  List<double> corrido = <double>[].obs;
  List<double> fijo = <double>[].obs;
  List<double> betP = <double>[].obs;
  List<double> betC = <double>[].obs;
  List<String> selecjugada = <String>[].obs;
  List<int> idem_pks = <int>[].obs;
  List<int> idem_pkp = <int>[].obs;
  List<int> idem_pk = <int>[].obs;

  getUser(String name) {
    userName.value = name;
  }

  getPass(String pass) {
    userPass.value = pass;
  }

  getJugada(String jugada) {
    final v = <String>[];
    v.add("2");
  }

  setSelecJugada(String letra) {
    selecjugada.add(letra);
  }

  setIdemPks(int ik) {
    idem_pks.add(ik);
  }

  setIdemPkp(int ik) {
    idem_pkp.add(ik);
  }

  setIdemPk(int ik) {
    idem_pk.add(ik);
  }

  setnumber(numero) {
    number.add(int.parse(numero));
  }

  setnumberC(numero) {
    numberC.add(int.parse(numero));
  }

  setfijo(f) {
    fijo.add(double.parse(f));
  }

  setcorrido(c) {
    corrido.add(double.parse(c));
  }

  setParle(np1, np2, b) {
    numberP1.add(int.parse(np1));
    numberP2.add(int.parse(np2));
    betP.add(b);
  }

  setCentena(c, b) {
    numberC.add(int.parse(c));
    betC.add(double.parse(b));
    sumarApuesta(double.parse(b));
  }

  setDecena(d, f, c) {
    for (int i = 0; i < 10; i++) {
      number.add(int.parse("$d$i"));
      corrido.add(double.parse(c));
      fijo.add(double.parse(f));
      sumarApuesta(double.parse(f) + double.parse(c));
      selecjugada.add("s");
    }
  }

  setTerminal(t, f, c) {
    for (int i = 0; i < 10; i++) {
      number.add(int.parse("$i$t"));
      corrido.add(double.parse(c));
      fijo.add(double.parse(f));
      sumarApuesta(double.parse(f) + double.parse(c));
      selecjugada.add("s");
    }
  }

  sumarApuesta(double suma) {
    if (number.isNotEmpty ||
        numberP2.isNotEmpty ||
        numberP1.isNotEmpty ||
        numberC.isNotEmpty) {
      sumaTotal.value = (sumaTotal.value + suma);
    } else {
      sumaTotal.value = 0;
    }
  }

  cleanJugadas() {
    selecjugada.clear();
    cleanParle();
    cleanCentena();
    cleanFijoCorrido();
    sumaTotal.value = 0;
  }

  cleanCentena() {
    numberC.clear();
    betC.clear();
    idem_pk.clear();
  }

  cleanParle() {
    numberP1.clear();
    numberP2.clear();
    betP.clear();
    idem_pkp.clear();
  }

  cleanFijoCorrido() {
    number.clear();
    fijo.clear();
    corrido.clear();
    idem_pks.clear();
  }
}
