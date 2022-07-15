import 'package:flutter/material.dart';
import 'package:project_1/Sign.dart';
import 'package:project_1/bottonNav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_Controller = TextEditingController();

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                "asset/Logo.png",
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "SHOW",
                style: TextStyle(
                  color: Color(0xff1A6350),
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login To Your Account",
                style: TextStyle(
                  color: Color(0xff1A6350),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              EmailText(
                Icons.email,
                "Enter Your E-mail",
                "Email",
                nameController,
              ),
              SizedBox(
                height: 32,
              ),
              Textfild(Icons.lock, "Enter Your Password", "Password",
                  Icons.visibility, passwordController, true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Checkbox(
                      focusColor: Color(0xff1A6350),
                      fillColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Color(0xf01A6350);
                        }
                        return Color(0xff1A6350);
                      }),
                      side: BorderSide(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: Colors.grey,
                      ),
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(
                        color: Color(0xff08211A),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 56,
                    ),
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        color: Color(0xff1A6350),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomNav()),
                  );
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xff1A6350),
                  primary: Colors.white,
                  fixedSize: Size(200, 60),
                  side: BorderSide(
                    width: 3,
                    color: Color(0xff1A6350),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "or Sign In with",
                style: TextStyle(
                  color: Color(0xff1A6350),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage("asset/google.png"),
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageIcon(
                    AssetImage("asset/facebook.png"),
                    size: 30,
                    color: Colors.blue[300],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageIcon(
                    AssetImage("asset/twitter.png"),
                    size: 30,
                    color: Colors.blue[300],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xff1A6350),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Textfild extends StatefulWidget {
  Textfild(
    this.pre_icon,
    this.hintText,
    this.lableText,
    this.suffix_icon,
    this.controller,
    this.obscure,
  );
  var pre_icon;
  var hintText;
  var lableText;
  var suffix_icon;
  var controller;
  var obscure;

  @override
  State<Textfild> createState() => _TextfildState();
}

class _TextfildState extends State<Textfild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: TextField(
        obscureText: widget.obscure,
        // onChanged: (val) {},
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.pre_icon,
            color: Color(0xff08211A),
          ),
          suffixIcon: IconButton(
            icon:
                Icon(widget.obscure ? Icons.visibility : Icons.visibility_off),
            color: Color(0xff1A6350),
            onPressed: () {
              setState(() {
                widget.obscure = !widget.obscure;
              });
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Color(0xff08211A),
              width: 2,
            ),
          ),
          hintText: widget.hintText,
          labelText: widget.lableText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Color(0xff08211A),
              width: 2,
            ),
          ),
        ),
        controller: widget.controller,
      ),
    );
  }
}

class EmailText extends StatelessWidget {
  EmailText(
    this.pre_icon,
    this.hintText,
    this.lableText,
    this.controller,
  );
  var pre_icon;
  var hintText;
  var lableText;
  var controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            pre_icon,
            color: Color(0xff08211A),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Color(0xff08211A),
              width: 2,
            ),
          ),
          hintText: hintText,
          labelText: lableText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Color(0xff08211A),
              width: 2,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
