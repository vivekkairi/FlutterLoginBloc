import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with ValidatorMixing{  //Extended Object cause we can't add Mixing without inheritance
  final _email = StreamController<String>.broadcast();  //Email StreamController
  final _password = StreamController<String>.broadcast(); //Password StreamController
  
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  get changeEmail => _email.sink.add;
  get changePassword => _password.sink.add;

  Stream<bool> get submitButton => Observable.combineLatest2(email, password, (e,p) => true); 

  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc(); //Single Global Instance