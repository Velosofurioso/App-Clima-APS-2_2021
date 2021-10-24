import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:app_previsao_enchentes/widgets/button_climate_status.dart';
import 'package:app_previsao_enchentes/widgets/climate_details_left.dart';
import 'package:app_previsao_enchentes/widgets/climate_details_right.dart';
import 'package:app_previsao_enchentes/widgets/next_days_resume.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final isLowerScreen = screenHeigth < 785;
    return Scaffold(
      backgroundColor: AppColors.blueMariner,
      appBar: AppBar(
        backgroundColor: AppColors.blueMariner,
        leading: IconButton(icon:Icon(Icons.menu_outlined, size: 25,), onPressed: () {}),
        title: Text("Campinas, BR", style: AppTextStyles.homeTitle),
        elevation: 0,

        // BOTTOM LINE APPBAR
         bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: AppColors.blueHavelock,
            height: 2.0,
          ),
        )
      ),

      body: isLowerScreen ?
        ListView(
          children: [
            homeBody(context)
          ],
        )
        :
        homeBody(context)
    );
  }

  Widget homeBody(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [

          //
          // Climate Status Button
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonClimateStatus(
                  image: 'clima-sol-nuvens',
                  currentTemperature: '37',
                  thermalSensation: '39'
              ),
            ], 
          ),


          //
          // Climate Next Days
          //
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 150,
              width: screenWidth,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  if(1 < 2) {
                    return NextDaysWidget(
                        dayName: "Seg",
                        image: "clima-noite",
                        climate: "23",
                        minClimate: "17",
                        maxClimate: "28",
                        isLastWidget: index == 6, // TODO change this number to the size of request
                    );
                  }

                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              ),
            ),
          ),

          //
          // Details From Climate
          //

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text("Detalhes de Hoje", style: AppTextStyles.homeTodayDetails),
                
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [

                      // Bloco 1
                      ClimateDetailLeft(
                          image: "clima-quente",
                          title1: "Nascer",
                          value1: "05:48 am",
                          title2: "Pôr",
                          value2: "17:48 am",
                      ),

                      // Line
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 150,
                        child: PreferredSize(
                          preferredSize: Size.fromWidth(4.0),
                          child: Container(
                            color: AppColors.climateGradientBlue,
                            width: 2.0,
                          ),
                        ),
                      ),


                      // Bloco 2
                      ClimateDetailRight(
                        title1: "Qual. do ar",
                        value1: "Boa",
                        title2: "Humidade",
                        value2: "90",
                        title3: "Velo. do vento",
                        value3: "1.34 km",
                      ),



                    ],
                  ),
                )

              ],
            )
          )

        ],
      ),
    );

  }
}


