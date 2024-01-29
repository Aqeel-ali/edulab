import 'package:flutter/material.dart';

import '../../theme/Theme.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
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

class _RegisterState extends State<Register> {
  final emailField = TextFormField(
      validator: (v) {
        if (!isValidEmail(v)) {
          return " هذا البريد الالكتروني غير صحيح";
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
          " البريد الالكتروني",
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
            return " كلمة المرور يجب ان تكون اكثر من 8 حروف";
          }
          return null;
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
  final confirmPasswordField = TextFormField(
      validator: (v) {
        if (v != passwordController.text) {
          return " كلمة المرور غير متطابقة";
        }
        return null;
      },
      controller: confirmPasswordController,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.password_outlined),
        contentPadding: const EdgeInsets.all(25),
        label: const Text(
          "تأكيد كلمة المرور",
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

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                  child: Text(
                ' انشاء حساب جديد',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      height: 5.0,
                      width: 170.0,
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
              confirmPasswordField,
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(18),
                color: squColor3,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  onPressed: () async {},
                  child: const Text(
                    'انشاء حساب',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "او يمكنك التسجيل باستخدام",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.height * 0.09,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/image/google.png",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("لديك حساب بالفعل؟"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      " تسجيل الدخول",
                      style: TextStyle(
                          color: squColor3,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
