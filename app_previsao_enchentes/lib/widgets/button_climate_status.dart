import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:flutter/material.dart';

class ButtonClimateStatus extends StatelessWidget {

  final String image;
  final String currentTemperature;
  final String thermalSensation;

  const ButtonClimateStatus({
        Key? key,
        required this.image,
        required this.currentTemperature,
        required this.thermalSensation
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicando");
      },
      child: Stack(
          children: [

            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.climateGradientBlue,
              ),
              child: Center(
                child: Container(
                  height: 230,
                  width: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blueHavelock,
                  ),
                ),
              ),
            ),


            Positioned(
                top: 40,
                left: 65,
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        "images/${this.image}.png",
                        height: 60,
                        color: Colors.white
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${this.currentTemperature}",
                              style: AppTextStyles.climateStatusMainData,
                              textAlign: TextAlign.center
                          ),

                          Text("o",
                              style: AppTextStyles.climateStatusIconCelsius,
                              textAlign: TextAlign.center
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text( "Sensação Térmica: ",
                        style: AppTextStyles.thermalSensation,
                        textAlign: TextAlign.center
                      ),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text("${this.thermalSensation}",
                              style: AppTextStyles.thermalSensation,
                              textAlign: TextAlign.center
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Text("o",
                              style: AppTextStyles.thermalSensationCelsiusIcon,
                              textAlign: TextAlign.center
                          ),
                        )
                      ],
                    ),
                  ],
                )
            ),
          ]
      ),
    );
  }
}
