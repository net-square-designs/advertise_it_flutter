import 'package:advertise_it/providers/auth_provider.dart';
import 'package:advertise_it/screens/Auth/signup_screen.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final Color textFieldColor = Color.fromRGBO(0, 0, 0, 0.2);

  final _formKey = GlobalKey<FormState>();

  submitLogin(context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (_formKey.currentState.validate()) {
      return authProvider.loginUser(
          email: _emailController.text,
          password: _passwordController.text,
          context: context);
    }
    // return errorToaster(context, 'Please fill out all the necessary fields and try again!');
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 4) {
      return 'Password should be at least 5 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final bool isSubmitting = authProvider.isSubmiting;

    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.89],
          colors: [appPink, appPurple],
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomText('AdvertiseIt.',
                styleName: StyleName.headline),
            SizedBox(height: 50),
            TextFormField(
              validator: (value) => validateEmail(value),
              autofocus: true,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: appWhite[100]),
                hintStyle: TextStyle(color: appWhite[100]),
                errorStyle: TextStyle(color: appWhite[100]),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: textFieldColor,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) => validatePassword(value),
              obscureText: true,
              autofocus: true,
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: appWhite[100]),
                errorStyle: TextStyle(color: appWhite[100]),
                hintStyle: TextStyle(color: appWhite[100]),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: textFieldColor,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText('Login',
                            styleName: StyleName.title),
                        SizedBox(width: 10),
                        if (isSubmitting) circleLoader(),
                      ],
                    ),
                    onPressed: isSubmitting
                        ? null
                        : () => submitLogin(context),
                    color: Color.fromRGBO(138, 78, 162, 0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomText('Forgot Password?'),
                SizedBox(width: 5),
                InkWell(
                  child: CustomText('Get Help Siginin In',
                      styleName: StyleName.subtitle),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomText('New to AdvertiseIt?'),
                SizedBox(width: 5),
                InkWell(
                  child: CustomText('Sign Up',
                      styleName: StyleName.subtitle),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, SignupScreen.routeName),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.facebook,
                            color: appBlue),
                        SizedBox(width: 10),
                        CustomText('Login with facebook',
                            styleName: StyleName.subtitle,
                            color: appBlue)
                      ],
                    ),
                    onPressed: () => submitLogin(context),
                    color: Color.fromRGBO(247, 241, 240, 0.85),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
