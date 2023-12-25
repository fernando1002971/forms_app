import 'package:formz/formz.dart';

//Define errores de validacion que pueden existir
//Considerando una enumeración
enum PasswordError { empty, length }

//Proporcionamos una clase llamada Username que hereda de FormzInput
//La cual almacena un valor String vacio y un tipo error que puede ser disparado

class Password extends FormzInput<String, PasswordError> {
  // Establecer el valor inicial
  const Password.pure() : super.pure('');

  //Invocamos super.dirty para representar que el campo fue manipulado
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return "El campo es requerido";
    if (displayError == PasswordError.length) return "Mínimo 6 caracteres";
    return null;
  }


  //Sobreescribimos la función validadora para manejar el error capturado
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;
    return null;
  }
}
