import 'dart:convert';

import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:app_previsao_enchentes/models/local_enchente.dart';
import 'package:app_previsao_enchentes/widgets/local_enchente_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LocaisEnchenteScreen extends StatefulWidget {
  const LocaisEnchenteScreen({Key? key}) : super(key: key);

  @override
  _LocaisEnchenteState createState() => _LocaisEnchenteState();
}

class _LocaisEnchenteState extends State<LocaisEnchenteScreen> {

  List<LocalEnchente>? dados = null;

  Future<List<LocalEnchente>> getAllLocalEnchenteData() async {
    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:8080/report-enchente")
    );

    if (response.statusCode == 200) {
      List<LocalEnchente> dados = json.decode(utf8.decode(response.bodyBytes)).map<LocalEnchente>((localEnchente) {
        return LocalEnchente.fromJson(localEnchente);
      }).toList();

      return dados;
    }

    else {
      Fluttertoast.showToast(
          msg: "Houve um erro na busca pelos dados",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.climateGradientBlue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      throw Exception();
    }
  }

  void getFloodData() async {
    this.dados = await getAllLocalEnchenteData();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    if (dados != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
              "Locais de Enchentes", style: AppTextStyles.floodScreenTitle),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.blueMariner,
          ),
        ),

        backgroundColor: Colors.white,
        body: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
              itemCount: this.dados!.length,
              itemBuilder: (context, index) {
                return LocalEnchenteWidget(
                  image: "location_icon",
                  bairro: "${this.dados![index].cep.bairro}",
                  cep: "${this.dados![index].cep.cep}",
                  endereco: "${this.dados![index].cep.logradouro}",
                  cidade: "${this.dados![index].cep.localidade}",
                  uf: "${this.dados![index].cep.uf}",
                  nivel: "${this.dados![index].nivelAgua}",
                  reportCount: "${this.dados![index].reportCount}",
                );
              }
          ),
        ),
      );
    }
    else {
      getFloodData();
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
            "Locais de Enchentes", style: AppTextStyles.floodScreenTitle),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.blueMariner,
            ),
          ),

        body: Center(
          child: Text("Sem Registro", style: AppTextStyles.floodScreenLabelNoRegister),
        ),
      );
    }
  }
}
