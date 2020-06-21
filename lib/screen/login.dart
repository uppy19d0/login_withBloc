// import 'package:bloc_login/blocs/formbloc.dart';
import 'package:bloc_login/blocs/formbloc.dart';
import 'package:bloc_login/blocs/formprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Login() extends StatefulWidget{
//   bool themestatus = false;
//   @override
//   _Login() createState => _Login();

// }
bool themestatus = false;

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = FormProvider.of(context);
    return Scaffold(
        appBar: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SwitchListTile(
                value: themestatus,
                onChanged: (bool newvalue) {
                  themestatus = !newvalue;
                },
              ),
            ),
            preferredSize: Size(300, 200.0)),
        body: SingleChildScrollView(
          child: Center(
              child: Form(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                FlutterLogo(
                  size: 90.0,
                ),
                _emailField(formBloc),
                _passwordField(formBloc),
                checkbox(),
                _buttonSingIn(formBloc),
                _fogotPasswordButton(context)
              ]))),
        ));
  }

  Widget _emailField(FormBloc formBloc) {
    return StreamBuilder<String>(
        stream: formBloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "test@email.com",
                labelText: 'Email',
                errorText: snapshot.error,
              ),
              onChanged: formBloc.changemail);
        });
  }

  Widget _passwordField(FormBloc formBloc) {
    return StreamBuilder<String>(
        stream: formBloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            maxLength: 20,
            decoration: InputDecoration(
                hintText: "Password",
                labelText: 'Password',
                errorText: snapshot.error),
            onChanged: formBloc.changpassword,
          );
        });
  }

  Widget checkbox() {
    return Row(children: <Widget>[
      Checkbox(value: false, onChanged: (checked) => {}),
      const Text('Keep me logged in')
    ]);
  }

  Widget _buttonSingIn(FormBloc formBloc) {
    return StreamBuilder<bool>(
        stream: formBloc.submitVlidaForm,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              child: const Icon(Icons.arrow_forward),
              onPressed: snapshot.hasError ? null : formBloc.submit,
              color: Colors.amber,
              clipBehavior: Clip.hardEdge,
              elevation: 20,
              disabledColor: Colors.blueGrey,
              disabledElevation: 10,
              disabledTextColor: Colors.white,
            ),
          );
        });
  }

  void output() {
    debugPrint("que paso!!!!");
    print("soy hokage");
  }

  Widget _fogotPasswordButton(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/forgot_passowrd'),
        child: Container(
            child: const Text(
              "Forgot password?",
              style: TextStyle(color: Colors.blue),
            ),
            alignment: Alignment.center),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/signup'),
        child: Container(
            child: const Text(
              "Signup?",
              style: TextStyle(color: Colors.blue),
            ),
            alignment: Alignment.center),
      )
    ]);
  }
}
