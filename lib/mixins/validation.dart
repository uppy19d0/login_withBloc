import 'dart:async';

class ValidationMixin {
  final validatorEmail = new StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
    if (!email.contains('@')) {
      sink.addError('Please enter a valid email');
    } else if (email.indexOf('') == -1) {
      sink.addError('reakky #2 🤧 ');
    } else {
      sink.add(email);
    }
  });

  final validatorPassword = new StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add(password);
    } else {
      sink.addError('Use better more than 8 chaaracters!');
    }
  });
}
