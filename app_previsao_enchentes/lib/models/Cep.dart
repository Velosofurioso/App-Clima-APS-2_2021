
class Cep {
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;

  Cep( {
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf
  });


  factory Cep.fromJson(Map<String, dynamic> parsedJson) {
    return Cep(
      cep: parsedJson["cep"] ?? "",
      localidade: parsedJson["localidade"] ?? "",
      complemento: parsedJson["complemento"] ?? "",
      bairro: parsedJson["bairro"] ?? "",
      logradouro: parsedJson["logradouro"] ?? "",
      uf: parsedJson["uf"] ?? "",
    );
  }

}