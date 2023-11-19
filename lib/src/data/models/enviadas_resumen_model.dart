class EnviadasResumenModel {
  Map<String, dynamic> fijo_corrido;
  Map<String, dynamic> centena;
  Map<String, dynamic> parle;
  List<int> fijo = List.empty();

  EnviadasResumenModel({
    required this.fijo_corrido,
    required this.centena,
    required this.parle,
  });

  getSize(){
    return (fijo_corrido["number"].length + centena["number"].length + parle["number1"].length);
  }

  getSizeFijo(){
    return fijo_corrido["number"].length;
  }

  int getSizeCentena() {
    return centena["number"].length;
  }

  int getSizeParle() {
    return parle["number1"].length;
  }

  Map<String, dynamic> toJson() => {
    "size": getSize(),
    "size_fijo": getSizeFijo(),
    "fijo": fijo_corrido,
    "size_centena": getSizeCentena(),
    "centena": centena,
    "size_parle": getSizeParle(),
    "parle": parle,
  };
}