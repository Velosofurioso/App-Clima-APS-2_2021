import 'dart:convert';

import 'package:app_previsao_enchentes/core/App_input_styles.dart';
import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:app_previsao_enchentes/core/input_validation.dart';
import 'package:app_previsao_enchentes/models/Cep.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class AddFloodScreen extends StatefulWidget {
  const AddFloodScreen({Key? key}) : super(key: key);

  @override
  _AddFloodScreenState createState() => _AddFloodScreenState();
}

class _AddFloodScreenState extends State<AddFloodScreen> {
  final _formKey = GlobalKey<FormState>();
  late Cep dadosEndereco;

  final cep = new TextEditingController();
  final uf = new TextEditingController();
  final cidade = new TextEditingController();
  final bairro = new TextEditingController();
  final endereco = new TextEditingController();
  final complemento = new TextEditingController();

  bool enableInputs = false;
  bool loading = false;

  Future<bool> saveReport(Cep data) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/report-enchente/add'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'cep': data.cep,
        'localidade': data.localidade,
        'complemento': data.complemento,
        'bairro': data.bairro,
        'logradouro': data.logradouro,
        'uf': data.uf,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    }

    else {
      return false;
    }
  }

  Future<Cep> getEnderecoByCep(String cep) async {
    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:8080/cep/${cep}")
    );

    if (response.statusCode == 200) {
      Cep endereco = Cep.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return endereco;
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
      updateScreen();
      throw Exception();
    }
  }

  void getEndereco(String cep) async {

    _onLoading();
    this.dadosEndereco = await getEnderecoByCep(cep);

    this.cep.text = this.dadosEndereco.cep;
    this.uf.text = this.dadosEndereco.uf;
    this.cidade.text = this.dadosEndereco.localidade;
    this.bairro.text = this.dadosEndereco.bairro;
    this.endereco.text = this.dadosEndereco.logradouro;
    this.complemento.text = this.dadosEndereco.complemento;
    updateScreen();
  }

  void updateScreen() {
    this.enableInputs = !this.enableInputs;
    _onLoading();

    setState(() {
    });
  }

  void _onLoading() {
    this.loading = !this.loading;

    if (this.loading) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
                child: CircularProgressIndicator()
            ),
          );
        },
      );
    }

    else if (!this.loading) {
      Navigator.pop(context); //pop dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Reportar Enchente", style: AppTextStyles.floodScreenTitle),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.blueMariner,
        ),
      ),

      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Row(
                  children: [
                    Text("1. Digite o CEP do Local", textAlign: TextAlign.left, style: AppTextStyles.floodScreenLabel),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  autofocus: true,
                  decoration: AppInputStyles.textFieldStyle(labelTextStr: "CEP"),
                  keyboardType: TextInputType.number,
                  controller: this.cep,
                  validator: (value) => InputValidation.emptyValidation(value!),
                  onFieldSubmitted: (value) => getEndereco(value),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 15),
                child: Row(
                  children: [
                    Text("2. Confira os dados", textAlign: TextAlign.left, style: AppTextStyles.floodScreenLabel),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
                      child: TextFormField(
                        enabled: this.enableInputs,
                        decoration: AppInputStyles.textFieldStyle(labelTextStr: "UF"),
                        validator: (value) => InputValidation.emptyValidation(value!),
                        controller: this.uf,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        enabled: this.enableInputs,
                        decoration: AppInputStyles.textFieldStyle(labelTextStr: "Cidade"),
                        validator: (value) => InputValidation.emptyValidation(value!),
                        controller: this.cidade,
                      ),
                    ),
                  ),
                ],
              ),



              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  enabled: this.enableInputs,
                  decoration: AppInputStyles.textFieldStyle(labelTextStr: "Bairro"),
                  validator: (value) => InputValidation.emptyValidation(value!),
                  controller: this.bairro,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  enabled: this.enableInputs,
                  decoration: AppInputStyles.textFieldStyle(labelTextStr: "Endereço"),
                  validator: (value) => InputValidation.emptyValidation(value!),
                  controller: this.endereco,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  enabled: this.enableInputs,
                  decoration: AppInputStyles.textFieldStyle(labelTextStr: "Complemento"),
                  controller: this.complemento,
                ),
              ),

              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.blueMariner),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                      ),
                    ),

                    onPressed: () async {

                      if (this.enableInputs && _formKey.currentState!.validate()) {

                        Cep endereco = Cep(
                          uf: this.uf.text,
                          logradouro: this.endereco.text,
                          cep: this.cep.text,
                          bairro: this.bairro.text,
                          complemento: this.complemento.text,
                          localidade: this.cidade.text,
                        );

                        bool sucess = await saveReport(endereco);

                        if(sucess) {
                          Fluttertoast.showToast(
                              msg: "Dados salvos com sucesso",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: AppColors.climateGradientBlue,
                              textColor: Colors.white,
                              fontSize: 16.0
                          ).then((value) => Navigator.pop(context));
                        }

                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Falha ao salvar os dados"))
                          );
                          throw Exception();
                        }
                      }
                    },
                    child: Text('Reportar', style: AppTextStyles.floodScreenButtonLabel),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

