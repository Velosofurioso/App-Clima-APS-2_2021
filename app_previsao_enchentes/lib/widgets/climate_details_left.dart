import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:flutter/material.dart';

class ClimateDetailLeft extends StatelessWidget {

  final String image;
  final String title1;
  final String value1;
  final String title2;
  final String value2;

  const ClimateDetailLeft({
    Key? key,
    required this.image,
    required this.title1,
    required this.value1,
    required this.title2,
    required this.value2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset("images/${this.image}.png", height: 50, color: Colors.white),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: 155,
              child: PreferredSize(
                preferredSize: Size.fromHeight(4.0),
                child: Container(
                  color: AppColors.blueHavelock,
                  height: 2.0,
                ),
              ),
            ),
          ),

          Row(
            children: [
              Text("${this.title1}", style: AppTextStyles.homeTodayDetailsText),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text("${this.value1}", style: AppTextStyles.homeTodayDetailsText),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: 155,
              child: PreferredSize(
                preferredSize: Size.fromHeight(4.0),
                child: Container(
                  color: AppColors.blueHavelock,
                  height: 2.0,
                ),
              ),
            ),
          ),

          Row(
            children: [
              Text("${this.title2}", style: AppTextStyles.homeTodayDetailsText),
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Text("${this.value2}", style: AppTextStyles.homeTodayDetailsText),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
