
class InputValidation {


  static String? emptyValidation(String value) {
    if (value.isEmpty) {
      return 'Informe o valor';
    }
    return null;
  }
}