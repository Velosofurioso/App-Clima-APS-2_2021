import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:flutter/material.dart';


class NextDaysWidget extends StatelessWidget {

  final String dayName;
  final String dayDate;
  final String image;
  final String climateDesc;
  final String minClimate;
  final String maxClimate;
  final bool isLastWidget;

  const NextDaysWidget({
    Key? key,
    required this.dayName,
    required this.image,
    required this.climateDesc,
    required this.minClimate,
    required this.maxClimate,
    this.isLastWidget = false,
    required this.dayDate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: this.isLastWidget ? 20: 0),
      child: Row(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("${this.dayName} - ${this.dayDate}".toUpperCase(), textAlign: TextAlign.left, style: AppTextStyles.nextDaysName ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset("images/${this.image}.png", height: 40, color: Colors.white),
                  ),
                  Text("${this.climateDesc}".replaceFirst(" ", "\n"), style: AppTextStyles.nextDaysClimate, ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("Min: \n ${this.minClimate}", textAlign: TextAlign.center, style: AppTextStyles.nextDaysClimateMinMax),
                    ),
                    Text("Max: \n ${this.maxClimate}", textAlign: TextAlign.center, style: AppTextStyles.nextDaysClimateMinMax),
                  ],
                ),
              ),


            ],
          ),


          // If is the last Widget Render not show the right line
          !this.isLastWidget ?
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 110,
              child: PreferredSize(
                preferredSize: Size.fromWidth(4.0),
                child: Container(
                  color: AppColors.climateGradientBlue,
                  width: 2.0,
                ),
              ),
            )
          : Container()
        ],
      ),
    );
  }
}
