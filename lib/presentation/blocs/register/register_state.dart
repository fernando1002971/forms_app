part of 'register_cubit.dart';

//Posibles estados que puede contener el formulario
enum FormStatus {
  invalid, //<--Invalido
  valid, //<-- Valido
  validating, //<-- Validando...
  posting, //<--postenado (enviando la data a un repositorio)
}

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

//Establecemos valores opcionales por cada propiedad:
  const RegisterFormState({
      this.formStatus = FormStatus.invalid,
      this.username = "",
      this.email = "",
      this.password = ""
   });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password
  }) => RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
   );

  @override
  List<Object> get props => [formStatus, username, email, password];
}
