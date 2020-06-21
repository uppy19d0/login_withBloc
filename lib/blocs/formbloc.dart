import 'package:bloc_login/mixins/validation.dart';
import 'package:rxdart/rxdart.dart';

class FormBloc with ValidationMixin {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //getters
  Function(String) get changemail => _email.sink.add;
  Function(String) get changpassword => _password.sink.add;

  //streams
  Stream<String> get email => _email.stream.transform(validatorEmail);
  Stream<String> get password => _password.stream.transform(validatorPassword);

  Stream<bool> get submitVlidaForm =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    print("Nareuto1!!!!!!!");
    print(_email.value);
    print(_password.value);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
