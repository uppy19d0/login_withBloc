import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
          child: Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
            Card(
              margin: EdgeInsets.all(30.0),
              child: const Text("SIGNUP"),
              color: Colors.blue,
            ),
            FlutterLogo(
              size: 90.0,
            ),
            _emailField(),
            _passwordField(),
            checkbox(),
            _buttonSingIn(),
            // _fogotPasswordButton(context)
          ]))),
    ));
  }

  Widget _emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          const InputDecoration(hintText: "test@email.com", labelText: 'Email'),
      onChanged: (String email) {},
    );
  }

  Widget _passwordField() {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      maxLength: 20,
      decoration:
          const InputDecoration(hintText: "Password", labelText: 'Password'),
      onChanged: (String password) {},
    );
  }

  Widget checkbox() {
    return Row(children: <Widget>[
      Checkbox(value: false, onChanged: (checked) => {}),
      const Text('Keep me logged in')
    ]);
  }

  Widget _buttonSingIn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {},
        color: Colors.amber,
        clipBehavior: Clip.hardEdge,
        elevation: 20,
        disabledColor: Colors.blueGrey,
        disabledElevation: 10,
        disabledTextColor: Colors.white,
      ),
    );
  }

  // Widget _fogotPasswordButton(BuildContext context) {
  //   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //     GestureDetector(
  //       onTap: () => Navigator.pushNamed(context, '/forgot_passowrd'),
  //       child: Container(
  //           child: const Text(
  //             "Forgot password?",
  //             style: TextStyle(color: Colors.blue),
  //           ),
  //           alignment: Alignment.center),
  //     ),
  //     GestureDetector(
  //       onTap: () => Navigator.pushNamed(context, '/signup'),
  //       child: Container(
  //           child: const Text(
  //             "Signup?",
  //             style: TextStyle(color: Colors.blue),
  //           ),
  //           alignment: Alignment.center),
  //     )
  //   ]);
  // }
}
