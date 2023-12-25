import 'package:formz/formz.dart';

//Define errores de validacion que pueden existir
//Considerando una enumeración
enum UsernameError { empty, length }

//Proporcionamos una clase llamada Username que hereda de FormzInput
//La cual almacena un valor String vacio y un tipo error que puede ser disparado

class Username extends FormzInput<String, UsernameError> {
  // Establecer el valor inicial
  const Username.pure() : super.pure('');

  //Invocamos super.dirty para representar que el campo fue manipulado
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsernameError.empty) return "El campo es requerido";
    if (displayError == UsernameError.length) return "Mínimo 6 caracteres";
    return null;
  }

  //Sobreescribimos la función validadora para manejar el error capturado
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;
    return null;
  }
}
