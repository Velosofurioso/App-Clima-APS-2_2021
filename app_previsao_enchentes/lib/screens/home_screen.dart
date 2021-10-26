import 'dart:async';
import 'dart:convert';

import 'package:app_previsao_enchentes/core/condition_type.dart';
import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:app_previsao_enchentes/core/app_textstyles.dart';
import 'package:app_previsao_enchentes/models/Wheater.dart';
import 'package:app_previsao_enchentes/screens/add_flood_screen.dart';
import 'package:app_previsao_enchentes/widgets/button_climate_status.dart';
import 'package:app_previsao_enchentes/widgets/climate_details_left.dart';
import 'package:app_previsao_enchentes/widgets/climate_details_right.dart';
import 'package:app_previsao_enchentes/widgets/next_days_resume.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<Wheater> actualWheater;
  String? cityName = null;

  @override
  void initState()  {
    super.initState();
    actualWheater = _getActualWeather();
  }


  @override
  Widget build(BuildContext context) {

    final screenHeigth = MediaQuery.of(context).size.height;
    final isLowerScreen = screenHeigth < 785;

    if(cityName != null) {
      return Scaffold(
        backgroundColor: AppColors.blueMariner,
        appBar: AppBar(
            backgroundColor: AppColors.blueMariner,
            leading: IconButton(
                icon: Icon(Icons.menu_outlined, size: 25),
                onPressed: () {
                }),
            title: Text("${this.cityName}", style: AppTextStyles.homeTitle),
            centerTitle: true,
            elevation: 0,
            
            actions: [
              IconButton(
                icon: Image.asset('images/siren_icon.png', color: Colors.white, height: 80),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddFloodScreen())
                  );
                },
              ),
            ],

            // BOTTOM LINE APPBAR
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(4.0),
              child: Container(
                color: AppColors.blueHavelock,
                height: 2.0,
              ),
            )
        ),

        body: FutureBuilder(
            future: actualWheater,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else {
                return isLowerScreen ?
                ListView(
                  children: [
                    homeBody(context, snapshot.data)
                  ],
                )
                    : homeBody(context, snapshot.data);
              }
            }
        ),
      );
    }
    else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget homeBody(BuildContext context, dynamic data) {
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
                    image: _verifyCondition(int.parse(data.condition_code), data.currently),
                    currentTemperature: '${data.temp}',
                    thermalSensation: '${data.description}',
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
                    itemCount: data.forecast.length,
                    itemBuilder: (context, index) {

                      if(index <= data.forecast.length) {
                        return NextDaysWidget(
                          dayName: data.forecast[index]['weekday'],
                          image: _verifyCondition(ConditionType.getConditionTypeByName(data.forecast[index]['condition']), "dia"),
                          climateDesc: "${data.forecast[index]['description']}",
                          minClimate: '${data.forecast[index]['min']}',
                          maxClimate: '${data.forecast[index]['max']}',
                          isLastWidget: index == data.forecast.length,
                          dayDate: '${data.forecast[index]['date']}',
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
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    Text("Detalhes de Hoje", style: AppTextStyles.homeTodayDetails),

                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: [

                          // Bloco 1
                          ClimateDetailLeft(
                            image: "clima-quente",
                            title1: "Nascer",
                            value1: "${data.sunrise}",
                            title2: "Pôr",
                            value2: "${data.sunset}",
                          ),

                          // Line
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 10),
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
                            title1: "Humidade:",
                            value1: "${data.humidity}",
                            title2: "Velo. do vento",
                            value2: "${data.wind_speedy}",
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

  Future<Wheater> _getActualWeather() async {

    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:8080/clima")
    );

    if (response.statusCode == 200) {

      Wheater actualWheater = Wheater.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      setState(() {
        this.cityName = actualWheater.city;
      });
      return actualWheater;
    }

    else {
      Fluttertoast.showToast(
          msg: "Houve um erro carregando as informações, tente mais tarde.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.climateGradientBlue,
          textColor: Colors.white,
          fontSize: 16.0
      );

      throw Exception();
    }
  }

  String _verifyCondition(int condition, String dayPeriod) {
    return ConditionType.verifyConditionType(condition, dayPeriod);
  }


}

