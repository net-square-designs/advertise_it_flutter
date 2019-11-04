import 'package:advertise_it/providers/auth_provider.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Color textFieldColor = Color.fromRGBO(0, 0, 0, 0.2);

  void submitLogin(context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    authProvider.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.89],
          colors: [appPink, appPurple],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomText('AdvertiseIt.', styleName: StyleName.headline),
            SizedBox(height: 50),
            TextFormField(
              autofocus: true,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: appWhite[100]),
                hintStyle: TextStyle(color: appWhite[100]),
                hintText: 'Enter your Email or Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: textFieldColor,
                filled: true,
              ),
              // style: TextStyle(color: appPink),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              autofocus: true,
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: appWhite[100]),
                hintStyle: TextStyle(color: appWhite[100]),
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: textFieldColor,
                filled: true,
              ),
              // style: TextStyle(color: appPink),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: CustomText('Login', styleName: StyleName.title),
                    onPressed: () => submitLogin(context),
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
                  child: CustomText('Sign Up', styleName: StyleName.subtitle),
                  onTap: () {},
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
                    onPressed: () => submitLogin(context),
                    color: Color.fromRGBO(247, 241, 240, 0.85),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
