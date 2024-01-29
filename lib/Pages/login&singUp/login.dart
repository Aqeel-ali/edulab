import 'package:edulab/Main_page.dart';
import 'package:flutter/material.dart';
import '../../theme/Theme.dart';
import 'restpass.dart';
import 'signUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool isValidEmail(x) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(x);
}

void _showDialog(BuildContext context, String title, String subtitle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("$title!!"),
        content: Text("$subtitle!"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        validator: (v) {
          if (!isValidEmail(v)) {
            return "هذا ليس بريدالكتروني";
          }
          return null;
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(Icons.mail_outline),
          contentPadding: const EdgeInsets.all(25),
          label: const Text(
            "البريد الالكتروني",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ));

    final PasswordField = TextFormField(
        validator: (v) {
          if (v != null) {
            if (v.length < 8) {
              return "كلمة المرور يجب ان تكون اكثر من 8 حروف";
            }
          }
          return null;
        },
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(Icons.password_outlined),
          suffixIcon: const Icon(Icons.remove_red_eye),
          contentPadding: const EdgeInsets.all(25),
          label: const Text(
            "كلمة المرور",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ));

    final LoginButton = Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(18),
      color: squColor3,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyNevBar()));
        },
        child: const Text(
          'تسجيل الدخول',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    final RegisterText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("اليس لديك حساب ؟"),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Register()));
          },
          child: Text(
            "سجل الان",
            style: TextStyle(
                color: squColor3, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );

    final ForgotPassword = GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PasswordReset()));
      },
      child: Text(
        "نسيت كلمة المرور ؟",
        style: TextStyle(
            color: squColor3, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Image.asset(
                        logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        'مرحبا بك مجدداً في تطبيق EduLab',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 5.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: squColor3,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 10,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: squColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  emailField,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  PasswordField,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ForgotPassword,
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Center(child: LoginButton),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "او سجل الدخول باستخدام",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width:
                                    MediaQuery.of(context).size.height * 0.09,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Image.asset(
                                  "assets/image/google.png",
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: RegisterText)
                ],
              ),
            ),
          )),
    );
  }
}
