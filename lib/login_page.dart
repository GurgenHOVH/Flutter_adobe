import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  bool nightMode = true;
  Color darkColor = Color(0xff02102F);
  Color lightColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightMode ? darkColor : lightColor,
      body: SingleChildScrollView(
        child: Center(
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SafeArea(
          child: Icon(
            Icons.alarm,
            color: nightMode ? Colors.white : darkColor,
            size: 150,
          ),
        ),
        loginPass(),
        SizedBox(
          height: 50,
        ),
        loginButton(),
        SizedBox(
          height: 200,
        ),
        themeSwitch(),
      ],
    );
  }

  Widget themeSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.wb_sunny,
          color: nightMode ? Colors.white : darkColor,
          size: 30,
        ),
        CupertinoSwitch(
          activeColor: Colors.blue,
          value: nightMode,
          onChanged: (val) {
            setState(() {
              nightMode = val;
            });
          },
        ),
        Image(
          image: NetworkImage(
            'https://image.flaticon.com/icons/png/512/91/91466.png',
          ),
          width: 30,
          color: nightMode ? Colors.white : darkColor,
        ),
      ],
    );
  }

  Widget loginButton() {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 50),
      color: nightMode ? Colors.white : darkColor,
      child: Text(
        'LOGIN',
        style: TextStyle(
            fontSize: 25,
            color: nightMode ? Color(0xff02102F) : Colors.white,
            fontWeight: FontWeight.w200),
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'home');
      },
    );
  }

  Widget loginPass() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          TextField(
            style: TextStyle(
              fontSize: 22,
              color: nightMode ? Colors.white : darkColor,
            ),
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(
                fontSize: 22,
                color: nightMode
                    ? Colors.white.withOpacity(0.8)
                    : darkColor.withOpacity(0.8),
              ),
            ),
          ),
          TextField(
            obscureText: !showPassword,
            style: TextStyle(
              fontSize: 22,
              color: nightMode ? Colors.white : darkColor,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                fontSize: 22,
                color: nightMode
                    ? Colors.white.withOpacity(0.8)
                    : darkColor.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
