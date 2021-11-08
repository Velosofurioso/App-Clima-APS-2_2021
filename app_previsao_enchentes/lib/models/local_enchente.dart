
import 'package:app_previsao_enchentes/models/Cep.dart';

class LocalEnchente {

  late final String? id;

  late final Cep cep;

  late final String? nivelAgua;

  late final String? reportCount;


  LocalEnchente({
    required this.id,
    required this.cep,
    required this.nivelAgua,
    required this.reportCount,
  });

  factory LocalEnchente.fromJson(Map<String, dynamic> parsedJson) {
    return LocalEnchente(
        id: parsedJson["id"] ?? null,
        cep: Cep.fromJson(parsedJson["local"]),
        nivelAgua: parsedJson["nivelDeAgua"] ?? null,
        reportCount: "${parsedJson["reportCount"]}"
    );
  }
}