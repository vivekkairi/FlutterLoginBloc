import 'package:flutter/material.dart';
import 'bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: width - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              emailWidget(),
              SizedBox(
                height: 10,
              ),
              passwordWidget(),
              SizedBox(
                height: 20,
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget emailWidget() {
  return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'abc@example.com',
              labelText: 'Email address',
              errorText: snapshot.error),
        );
      });
}

Widget passwordWidget() {
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changePassword,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              ),
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error),
      );
    },
  );
}

Widget submitButton() {
  return StreamBuilder(
    stream: bloc.submitButton,
    builder: (context, snapshot) {
      return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.blue,
        onPressed: snapshot.hasData
            ? bloc.submit
            : null,
        child: Text("Login",),
      );
    },
  );
}

