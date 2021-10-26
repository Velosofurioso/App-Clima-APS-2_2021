import 'package:app_previsao_enchentes/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {

  //
  // Home Screen
  //
  static final TextStyle homeTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  //
  // Clima Status Button
  //

  static final TextStyle climateStatusMainData = TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle climateStatusIconCelsius = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle thermalSensation = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static final TextStyle thermalSensationCelsiusIcon = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );


  //
  // Next Days Climate
  //

  static final TextStyle nextDaysName = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static final TextStyle nextDaysClimate = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static final TextStyle nextDaysClimateIcon = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  static final TextStyle nextDaysClimateMinMax = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  //
  // Home Today Details
  //
  static final TextStyle homeTodayDetails = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );

  static final TextStyle homeTodayDetailsText = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  //
  // Report Flood
  //
  static final TextStyle floodScreenTitle = TextStyle(
    color: AppColors.blueMariner,
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  static final TextStyle floodScreenLabel = TextStyle(
    color: AppColors.blueMariner,
    fontSize: 25,
    fontWeight: FontWeight.bold
  );

  static final TextStyle floodScreenButtonLabel = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );


}