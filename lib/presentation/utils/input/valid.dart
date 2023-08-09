mixin SignInInputValidationMixin {
  String? isUserValid(String value) =>
      value.isEmpty ? 'Usuario incorrecto.' : null;
  String? isPassValid(String value) =>
      value.isEmpty ? 'Contraseña incorrecta.' : null;
}

mixin RequestInputValidationMixin {
  String? isNameValid(String value) =>
      value.isEmpty ? 'Ingrese un requerimiento.' : null;
  String? isDateValid(DateTime? value) =>
      value == null ? 'Seleccione una fecha.' : null;

  String? isTechnologyValid(String value) =>
      value != 'null' && value.isNotEmpty ? null : 'Seleccione una tecnologia.';

  String? isTimeValid(String value) =>
      value.isEmpty ? 'Ingrese el numero de horas.' : null;
}
