import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:openxtech_starter/Application/Features/data_layer/code_data.dart';
import 'package:openxtech_starter/Application/Features/login/http/login.dart';
import 'package:openxtech_starter/Application/core/customButton.dart';

import '../../../core/customTextfield.dart';
import '../../business_logic/generate_code.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const url = "/loginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // BlueGenerator.BlueGenerators();
    // print(BlueGenerator.BlueGenerators());
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigator.of(context).pushNamed(RegistrationScreen.url);
      };
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSizes = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bienvenue ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                // Expanded(
                //   child: Container(),
                // )
                // ,
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: screenSizes.width * 0.7,
                  child: Text(
                    "Entrez vos coordonnees, tout les coordonees sont important",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),

                CustomTextField(
                  title: "Connexion",
                  label: "email@example.com",
                  leadingIcon: CupertinoIcons.at,
                  controller: _emailController,
                ),
                CustomTextField(
                  title: "Mot de passe",
                  label: "**********",
                  leadingIcon: Icons.lock_outline_rounded,
                  trailingIcon: CupertinoIcons.eye_slash,
                  controller: _passwordController,
                ),
                Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(title: "S'identifier"),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Login().LoginUser(
                        _emailController.text, _passwordController.text);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image(
                      //   image: AssetImage('assets/google-fill.png'),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Google",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    elevation: 0,
                    fixedSize: Size(screenSizes.width, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: "Vous n'avez pas de compte? ",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "Inscrivez-vous",
                          recognizer: _tapGestureRecognizer,
                          style: TextStyle(color: Colors.blue))
                    ])),

                screenSizes.height < 800
                    ? SizedBox(
                        height: 50,
                      )
                    : screenSizes.height < 870
                        ? SizedBox(
                            height: 150,
                          )
                        : SizedBox(
                            height: 200,
                          ),

                Container(
                  // color: Colors.red,  // color: Colors.red,

                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      ' Termes, politiques de confidentialité et conditions  d\'utilisation',
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
