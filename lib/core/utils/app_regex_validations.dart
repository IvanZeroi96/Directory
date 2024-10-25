abstract class RegExValidation {


  static bool text(String value, String min) {
    String patttern = r"^[\w\sñÑáéíóúÁÉÍÓÚA-Za-z ]*$";
    RegExp regExp = RegExp(patttern);
    return (regExp.hasMatch(value));
  }

  static bool correo(String value) {
    String patttern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$";
    RegExp regExp = RegExp(patttern);
    return (regExp.hasMatch(value));
  }

  static bool numeric(String value, {bool decimal = true}) {
    String pattern = "";

    if (decimal) {
      pattern = r'(^[0-9.,]*$)';
    }
    else {
      pattern = r'(^[0-9]*$)';
    }

    RegExp regExp = RegExp(pattern);

    return (regExp.hasMatch(value));
  }

}