import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/limitation_queue/entity/index.dart';
import '../../../../infrastructure/limitation_config/datasources/implementation/limitation_config_repository.dart';
import '../../../../tools/app_config_size.dart';
import '../../../widgets/plane_loading_widget.dart';
import '../page/edit_limites_page.dart';

class ListBolasLimitadasWidget extends StatefulWidget {
  const ListBolasLimitadasWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListBolasLimitadasWidget> createState() =>
      _ListBolasLimitadasWidgetState();
}

class _ListBolasLimitadasWidgetState extends State<ListBolasLimitadasWidget> {
  var adminId = '';

  final limitationQueueRepository = LimitationConfigRepository();
  List<String> numberDay = [];
  List<String> parletDay = [];
  List<String> numberNight = [];
  List<String> parletNight = [];
  bool eliminando = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
      future: limitationQueueRepository.getAllLimitateds(),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PlaneLoading(
            marginLeft: 0,
            marginRight: 0,
          );
        } else {
          if (snapshot.data["success"] != null) {
            return buildListBolasLimitadas(
                snapshot.data["success"] as List<LimitatedEntity>);
          } else {
            return SizedBox(
              child: (snapshot.data["message"].toString() ==
                      "No report found for that date and turn")
                  ? SizedBox(
                      width: AppConfigSize.screenWidth,
                      height: AppConfigSize.screenHeight -
                          AppConfigSize.screenHeight * 0.33,
                      child: const Center(
                          child: Text(
                              "No se encontraron reportes para esa fecha y turno.",
                              textAlign: TextAlign.center)),
                    )
                  : const Text("Algo salió mal por favor inténtalo más tarde"),
            );
          }
        }
      }),
    ));
  }

  String obtenerFecha(int dia, int mes, int anno) {
    DateTime fecha = DateTime(anno, mes, dia);
    DateFormat formatoFecha = DateFormat('EEEE, d MMMM yyyy');
    return formatoFecha.format(fecha);
  }

  Widget buildListBolasLimitadas(List<LimitatedEntity> data) {
    return ListView.builder(
        itemCount: data.length + 1,
        itemBuilder: (context, index) {
          if (data.length == index) {
            return Container(
              height: 80,
            );
          } else {
            return GestureDetector(
              onTap: () {
                if (isBeforeToday(
                    data[index].day!, data[index].month!, data[index].year!)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ya ha pasado, no se puede editar."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  if (isToday(data[index].day!, data[index].month!,
                      data[index].year!)) {
                    if (data[index].turn == 'Day') {
                      if (isPast6AM()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Limitados en Uso. No se puede "
                                "editar."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        goEdit(context, data[index]);
                      }
                    } else {
                      if (isPast1PM()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Limitados en Uso. No se puede "
                                "editar."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        goEdit(context, data[index]);
                      }
                    }
                  } else {
                    goEdit(context, data[index]);
                  }
                }
              },
              child: Card(
                child: ListTile(
                  title: Text(
                      '${obtenerFecha(data[index].day!, data[index].month!, data[index].year!)} ${data[index].turn == 'Day' ? 'Día' : 'Noche'}.'),
                  subtitle: Text("Números:"
                      "\n ${data[index].numbers}\nParlet:\n${data[index].parlets}"),
                  trailing: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showAlertDelete(context, data[index].id);
                        },
                        child: const Text("Eliminar"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }

  bool isToday(
    int day,
    int month,
    int year,
  ) {
    final now = DateTime.now();
    final date = DateTime(year, month, day);
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  bool isBeforeToday(
    int day,
    int month,
    int year,
  ) {
    final now = DateTime.now();
    final date = DateTime(year, month, day);
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }

  bool isPast6AM() {
    final now = DateTime.now();
    final sixAM = DateTime(now.year, now.month, now.day, 6, 0, 0);
    return now.isAfter(sixAM);
  }

  bool isPast1PM() {
    final horaActual = DateTime.now().hour;
    return horaActual >= 13;
  }

  void goEdit(BuildContext context, LimitatedEntity limitatedEntity) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => EditLimites(
                limitatedEntity: limitatedEntity,
              )),
    );
  }

  showAlertDelete(BuildContext context, String programmingId) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Eliminar Limitados de este día.",
            ),
            content: const Text(
              "Está seguro que quiere eliminar los Limitados de este día?",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                  )),
              ElevatedButton(
                onPressed: () {
                  //context.goNamed(AppPages.login.name);
                  Navigator.of(context).pop();
                  eliminar(programmingId);
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.green)),
                child: const Text('Aceptar'),
              ),
            ],
          );
        });
  }

  Future<void> eliminar(String programmingId) async {
    showAlertDeleting(context, programmingId);
    var result = await limitationQueueRepository
        .deleteLimitationQueueById(programmingId);
    result['success'] != null ? success() : fail(result);
  }

  success() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Eliminado correctamente."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.of(context).pop();
    setState(() {});
  }

  showAlertDeleting(BuildContext context, String programmingId) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text(
              "Eliminando...",
            ),
            content: Text(
              "Se están eliminando límites: $programmingId",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: const <Widget>[],
          );
        });
  }

  fail(error) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error al intentar eliminar. ${error['message']}"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
