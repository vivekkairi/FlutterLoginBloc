import 'dart:async';

class ValidatorMixing {
  static RegExp _regex = RegExp("^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}\$");  //Regex for email validation
  final emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink) {
      if(_regex.hasMatch(email)) {
        sink.add(email);
      }
      else {
        sink.addError("Please enter a valid email address");
      }
    }
  );
  final passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink) {
      if(password.length>5) {
        sink.add(password);
      }
      else {
        sink.addError("Password must be atleast 6 characters");
      }
    }
  );
}