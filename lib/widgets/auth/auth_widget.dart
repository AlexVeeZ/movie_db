import 'package:flutter/material.dart';
import 'package:movie_db/themes/button_theme.dart';
import 'package:movie_db/themes/icon_color_theme.dart';
import 'package:movie_db/themes/main_color_theme.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: AppMainColor.appColor,
          title: Row(
            children: [
              Container(
                  child: Icon(
                Icons.menu,
                color: AppIconColor.whiteColor,
              )),
              SizedBox(width: 105),
              Container(
                height: 70,
                width: 70,
                child: Image.asset('assets/mdb.jpg'),
              ),
              SizedBox(width: 65),
              Container(
                  child: Icon(
                Icons.person,
                color: AppIconColor.whiteColor,
              )),
              SizedBox(width: 10),
              Container(
                  child: Icon(
                Icons.search,
                color: AppIconColor.blueColor,
              )),
            ],
          ),
        ),
        body: ListView(
          children: [
            _HeaderWidget(),
            _RegisterFormWidget(),
          ],
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final headerTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Text(
              'Login to your account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Text(
              'In order to use the editing and rating capabilities '
                  '\nof TMDb, as well as get personal'
                  '\nrecommendations you will need to login to your account. '
                  'If you do not have an account, registering for an account is free and simple.',
              style: headerTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(onPressed: (){}, child: Text('Register'),
              style: AppButtonTheme.linkedButton,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
                'If you signed up but did not get your \nverification email.',
                style: headerTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(onPressed: (){}, child: Text('Verify email'),
              style: AppButtonTheme.linkedButton,),
          ),
        ]);
  }
}

class _RegisterFormWidget extends StatefulWidget {
  const _RegisterFormWidget({Key? key}) : super(key: key);

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<_RegisterFormWidget> {

  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth(){
      final login = _loginTextController.text;
      final password = _passwordTextController.text;

      if(login == 'alex' && password == '1234'){
        errorText = null;
        Navigator.of(context).pushReplacementNamed('/main_widget');
      }else{
        errorText = 'Неверный пароль или логин.';
      }
      setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    final textFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    );
    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('User name'),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
                decoration: textFieldDecoration,
            autocorrect: false,
            enableSuggestions: false,
            controller: _loginTextController,)),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Password'),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: TextField(
                decoration: textFieldDecoration,
            obscureText: true,
            controller: _passwordTextController,),),
        if(errorText != null) Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(errorText, style: TextStyle(color: Colors.red),),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: ElevatedButton(onPressed: _auth, child: Text('Login')),
            ),
            SizedBox(
              width: 10,
            ),
            OutlinedButton(onPressed: () {}, child: Text('Reset password')),
          ],
        ),
    SizedBox(
    height: 10,),
        Container(
          height: 278,
          width: 360,
          color: AppMainColor.appColor,
        )],
    );
  }
}
