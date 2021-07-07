import 'dart:ui';

import '../home/home.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  bool passwordShown = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height / 3,
                  child: Hero(
                      tag: "Logo",
                      child: Image.asset("assets/transparent_logo.png")),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(50)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: whiteGreyGradient)),
                ),
                _buildEmailTextField(size),
                _buildPasswordTextField(size),
                Padding(padding: EdgeInsets.only(top: size.height / 40)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "שכחת סיסמה? לא נורא, קליק אחד כאן והכל מסתדר",
                      style: TextStyle(color: Colors.black),
                    )),
                Padding(padding: EdgeInsets.only(top: size.height / 40)),
                GestureDetector(
                  onTap: () {
                    _submitForm();
                  },
                  child: roundedRectButton("התחבר", redOrangeGradient),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildPasswordTextField(Size size) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height / 20, right: size.width / 20, left: size.width / 20),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        onSaved: (value) => password = value!,
        validator: (value) {
          if (value!.isEmpty) {
            return kPassNullError;
          } else if (value.length < 8) {
            return kShortPassError;
          }

          return null;
        },
        obscureText: !passwordShown,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
          _submitForm();
        },
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: "סיסמה",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordShown = !passwordShown;
              });
            },
            icon: Icon(passwordShown ? Icons.lock_open : Icons.lock),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // TODO: CONNECT TO SERVER AND LOGIN
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  Padding _buildEmailTextField(Size size) {
    final node = FocusScope.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: size.height / 20, right: size.width / 20, left: size.width / 20),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        onSaved: (value) => email = value!,
        validator: (value) {
          if (value!.isEmpty) {
            return kEmailNullError;
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            return kInvalidEmailError;
          }

          return null;
        },
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        onEditingComplete: () => node.nextFocus(),
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: "אימייל",
          suffixIcon: Icon(Icons.mail),
        ),
      ),
    );
  }

  Widget roundedRectButton(String title, List<Color> gradient) {
    return Builder(builder: (BuildContext mContext) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment(1.0, 0.0),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(mContext).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
          ],
        ),
      );
    });
  }
}
