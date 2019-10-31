import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Adobe ID',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            Text(
              'For your protection, please verify your identity.',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Adobe Account',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 26,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
            loginPassInputs(),
            SizedBox(
              height: 30,
            ),
            signInForgot(),
            SizedBox(
              height: 30,
            ),
            notAMember(),
            SizedBox(
              height: 10,
            ),
            Text('Want to use your company or school account?'),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.transparent,
              child: Text(
                'Sign in with an Enterprise ID',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff1373E6),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            socialButtons()
          ],
        ),
      ),
    );
  }

  Widget socialButtons() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        FlatButton(
          padding: EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {},
          color: Color(0xff405D94),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.face,
                color: Colors.white,
              ),
              Text(
                'Continue with Facebook',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        OutlineButton(
          padding: EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {},
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.face,
                color: Colors.black,
              ),
              Text(
                'Continue with google',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        FlatButton(
          padding: EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {},
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.face,
                color: Colors.white,
              ),
              Text(
                'Continue with Apple',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget notAMember() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Not a member yet?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
        ),
        FlatButton(
          // padding: EdgeInsets.zero,
          onPressed: () {},
          color: Colors.transparent,
          child: Text(
            'Get an Adobe ID',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff1373E6),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget signInForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          onPressed: () {},
          color: Color(0xff1373E6),
          child: Text(
            'Sign in',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          ),
        ),
        FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          color: Colors.transparent,
          child: Text(
            'Forgot password?',
            style: TextStyle(
              color: Color(0xff1373E6),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget loginPassInputs() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Email Address',
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
