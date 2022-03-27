import '../../providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../models/constants.dart';
import '../components/template.dart';
import 'components/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  late String password;

  bool passwordShown = false;

  FocusNode passwordFocus = new FocusNode();
  FocusNode _emailFocus = new FocusNode();
  final GlobalKey<FormFieldState> _emailFieldState =
      GlobalKey<FormFieldState>();
  late AuthProvider authService;

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
    super.initState();

    this._emailFocus.addListener(() {
      if (!this._emailFocus.hasFocus) {
        this._emailFieldState.currentState!.validate();
      }
    });
  }

  @override
  void dispose() {
    this.passwordFocus.dispose();
    this._emailFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
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
                    onPressed: sendResetPasswordLink,
                    child: Text(
                      "שכחת סיסמה? לא נורא, קליק אחד כאן והכל מסתדר",
                      style: TextStyle(color: Colors.black),
                    )),
                Padding(padding: EdgeInsets.only(top: size.height / 40)),
                GestureDetector(
                  onTap: () {
                    _submitForm();
                  },
                  child:
                      LoginButton(title: "התחבר", gradient: redOrangeGradient),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendResetPasswordLink() async {
    String snackBarMessage = "";
    if (this._emailFieldState.currentState!.validate()) {
      try {
        await authService.sendPasswordResetEmail(this.email);
        snackBarMessage = "שלחנו לך קישור לאיפוס סיסמה למייל!";
      } on FirebaseAuthException catch (err) {
        switch (err.code) {
          case 'user-not-found':
            snackBarMessage =
                "לא ניתן לשלוח קישור למייל זה. אולי התכוונת לכתובת אחרת?";
            break;
          default:
            snackBarMessage =
                "לא ניתן לשלוח קישור איפוס סיסמה כרגע. שווה לנסות שוב מאוחר יותר ואם הבעיה ממשיכה, לפנות לתמיכה";
        }
      }
    } else {
      switch (_emailFieldState.currentState!.errorText) {
        case kEmailNullError:
          snackBarMessage =
              "בכדי לקבל קישור לאיפוס סיסמה, יש להזין כתובת מייל קודם.";
          break;
        default:
          snackBarMessage = "";
      }
    }

    if (snackBarMessage.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(snackBarMessage)));
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        bool success = await authService.signInWithEmailAndPassword(
            this.email, this.password);

        if (success) {
          Navigator.of(context).pushReplacementNamed(Template.route);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("ההתחברות נכשלה")));
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
          case 'wrong-password':
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("אימייל או סיסמה שגויים. נסה שנית")));
            break;
          default:
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("ההתחברות נכשלה")));
        }
      }
    }
  }

  Padding _buildPasswordTextField(Size size) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height / 20, right: size.width / 20, left: size.width / 20),
      child: TextFormField(
        focusNode: this.passwordFocus,
        textDirection: TextDirection.ltr,
        onSaved: (value) => password = value!,
        validator: RequiredValidator(errorText: kPassNullError),
        obscureText: !passwordShown,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
          _submitForm();
        },
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: "סיסמה",
          suffixIcon: Icon(passwordIcon),
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordShown = !passwordShown;
              });
            },
            icon: Icon(passwordShown ? hidePasswordIcon : showPasswordIcon),
          ),
        ),
      ),
    );
  }

  Padding _buildEmailTextField(Size size) {
    final node = FocusScope.of(context);
    MultiValidator validate = MultiValidator([
      RequiredValidator(errorText: kEmailNullError),
      EmailValidator(errorText: kInvalidEmailError),
    ]);

    return Padding(
      padding: EdgeInsets.only(
          top: size.height / 20, right: size.width / 20, left: size.width / 20),
      child: TextFormField(
        key: this._emailFieldState,
        focusNode: this._emailFocus,
        textDirection: TextDirection.ltr,
        onSaved: (value) => email = value!,
        onChanged: (value) => email = value,
        validator: validate,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        onEditingComplete: () => node.requestFocus(this.passwordFocus),
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: "אימייל",
          suffixIcon: Icon(mailIcon),
        ),
      ),
    );
  }
}
