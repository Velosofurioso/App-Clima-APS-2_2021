import 'dart:core';

class ConditionType {

  // Condition type
  static final List<int> CLIMA_CHUVISCO = [9, 11, 12];
  static final List<int> CLIMA_TEMPESTADE = [0,1,3,4, 39, 47];
  static final List<int> CLIMA_TROVOADA = [37,38];
  static final List<int> CLIMA_NUBLADO = [26, 28, 29, 30];

  static final List<int> CLIMA_NOITE = [33];
  static final List<int> CLIMA_NOITE_NUVENS = [20, 26,28];
  static final List<int> CLIMA_QUENTE = [32];
  static final List<int> CLIMA_QUENTE_NUVENS = [34];


  static int getConditionTypeByName(String conditionName) {

    if("cloudly_day" == conditionName) {
      return CLIMA_QUENTE_NUVENS[0];
    }

    else if("rain" == conditionName) {
      return CLIMA_CHUVISCO[0];
    }

    else if("cloud" == conditionName) {
      return CLIMA_NUBLADO[0];
    }

    else if("clear_day " == conditionName) {
      return CLIMA_QUENTE[0];
    }

    else if("storm" == conditionName) {
      return CLIMA_TEMPESTADE[0];
    }

    else if("cloudly_night " == conditionName) {
      return CLIMA_NOITE_NUVENS[0];
    }

    else if("clear_night" == conditionName) {
      return CLIMA_NOITE[0];
    }

    else {
      return CLIMA_QUENTE[0];
    }

  }

  static String verifyConditionType(int conditionType, String dayPeriod) {

    if(CLIMA_CHUVISCO.contains(conditionType)) {
      return "clima-chuvisco";
    }

    else if(CLIMA_TEMPESTADE.contains(conditionType)) {
      return "clima-tempestade";
    }

    else if(CLIMA_TROVOADA.contains(conditionType)) {
      return "clima-trovao";
    }

    else if(CLIMA_NUBLADO.contains(conditionType)) {
      return "clima-nublado";
    }

    else if(CLIMA_NOITE.contains(conditionType)) {
      return "clima-noite";
    }

    else if(CLIMA_NOITE_NUVENS.contains(conditionType) && "noite".compareTo(dayPeriod) == 0) {
      return "clima-noite-nuvens";
    }

    else if(CLIMA_QUENTE.contains(conditionType)) {
      return "clima-quente";
    }

    else if(CLIMA_QUENTE_NUVENS.contains(conditionType)) {
      return "clima-sol-nuvens";
    }

    else {
      return "clima-quente";
    }

  }





}