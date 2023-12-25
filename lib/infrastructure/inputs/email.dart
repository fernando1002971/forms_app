import 'package:formz/formz.dart';

//Define errores de validacion que pueden existir
//Considerando una enumeración
enum EmailError { empty, format }

//Proporcionamos una clase llamada Username que hereda de FormzInput
//La cual almacena un valor String vacio y un tipo error que puede ser disparado

class Email extends FormzInput<String, EmailError> {
  // Establecer el valor inicial
  const Email.pure() : super.pure('');

  //Invocamos super.dirty para representar que el campo fue manipulado
  const Email.dirty(String value) : super.dirty(value);

  static final RegExp emailRegExp = RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return "El campo es requerido";
    if (displayError == EmailError.format) return "Formato de correo eletronico incorrecto";
    return null;
  }

  //Sobreescribimos la función validadora para manejar el error capturado
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;
    return null;
  }
}
