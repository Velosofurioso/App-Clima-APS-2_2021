import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalEnchenteWidget extends StatelessWidget {
  final String image;
  final String bairro;
  final String cep;
  final String endereco;
  final String cidade;
  final String uf;
  final String nivel;
  final String reportCount;

  const LocalEnchenteWidget({
    Key? key,
    required this.image,
    required this.bairro,
    required this.cep,
    required this.endereco,
    required this.cidade,
    required this.uf,
    required this.nivel,
    required this.reportCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${this.cep}';
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        }

        else {
          Fluttertoast.showToast(
              msg: "Não foi possivel abrir o Maps",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.climateGradientBlue,
              textColor: Colors.white,
              fontSize: 16.0
          );
          throw Exception('Não foi possivel abrir o Maps');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.blueHavelock,
          ),
          child: Row(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/${this.image}.png", color: Colors.white, height: 90),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${this.bairro}", style: AppTextStyles.floodScreenLabelWidgetTitle, overflow: TextOverflow.ellipsis),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("${this.cep}",   style: AppTextStyles.floodScreenLabelWidget),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text("${this.endereco}", style: AppTextStyles.floodScreenLabelWidget),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(
                        children: [
                          Text("${this.cidade}, ", style: AppTextStyles.floodScreenLabelWidget),
                          Text("${this.uf}", style: AppTextStyles.floodScreenLabelWidget),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text("Nivel: ${this.nivel}", style: AppTextStyles.floodScreenLabelWidget),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text("Reports num: ${this.reportCount}", style: AppTextStyles.floodScreenLabelWidget),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
