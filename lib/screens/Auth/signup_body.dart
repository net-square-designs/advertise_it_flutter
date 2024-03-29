import 'package:advertise_it/providers/auth_provider.dart';
import 'package:advertise_it/screens/Auth/login_screen.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final Color textFieldColor = Color.fromRGBO(0, 0, 0, 0.2);

  final _formKey = GlobalKey<FormState>(debugLabel: 'signupForm');

  bool _obscureText = true;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  handleSignup(context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (_formKey.currentState.validate()) {
      return authProvider.signupUser(
        email: _emailController.text,
        password: _passwordController.text,
        firstName: _firstNameController.text,
        phone: _phoneController.text,
        context: context,
      );
    }
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  validatePhone(String value) {
    if (value.isEmpty) {
      return 'Please enter your phone';
    }
    if (value.length < 11) {
      return 'phone number should be at least 11 digits';
    }
    if (value.length > 11) {
      return 'phone number should be longer than 11 digits';
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
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomText('AdvertiseIt.', styleName: StyleName.headline),
              SizedBox(height: 50),
              TextFormField(
                validator: (value) => validateFirstName(value),
                autofocus: true,
                controller: _firstNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: appWhite[100]),
                  hintStyle: TextStyle(color: appWhite[100]),
                  errorStyle: TextStyle(color: appWhite[100]),
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: textFieldColor,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => validatePhone(value),
                autofocus: true,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: appWhite[100]),
                  hintStyle: TextStyle(color: appWhite[100]),
                  errorStyle: TextStyle(color: appWhite[100]),
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: textFieldColor,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => validateEmail(value),
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
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => validatePassword(value),
                obscureText: _obscureText,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
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
                  // icon: const Padding(
                  //   padding: const EdgeInsets.only(top: 15.0),
                  //   child: const Icon(Icons.lock),
                  // ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => _toggleObscure(),
                    color: Colors.white,
                  ),
                  fillColor: textFieldColor,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomText('Signup', styleName: StyleName.title),
                          SizedBox(width: 10),
                          if (isSubmitting) circleLoader(),
                        ],
                      ),
                      onPressed:
                          isSubmitting ? null : () => handleSignup(context),
                      color: Color.fromRGBO(138, 78, 162, 0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText('Have an account?'),
                  SizedBox(width: 5),
                  InkWell(
                    child: CustomText('Sign in', styleName: StyleName.subtitle),
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName,
                    ),
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
                          Icon(FontAwesomeIcons.facebook, color: appBlue),
                          SizedBox(width: 10),
                          CustomText('Login with facebook',
                              styleName: StyleName.subtitle, color: appBlue)
                        ],
                      ),
                      onPressed: () => {},
                      color: Color.fromRGBO(247, 241, 240, 0.85),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
