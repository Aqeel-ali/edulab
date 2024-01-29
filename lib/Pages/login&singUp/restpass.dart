import 'package:flutter/material.dart';

import '../../theme/Theme.dart';
import 'login.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

final TextEditingController emailController = TextEditingController();

class _PasswordResetState extends State<PasswordReset> {
  final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.mail_outline),
        contentPadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        label: const Text(
          "البريد الالكتروني",
          style: TextStyle(
            fontSize: 20,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 280,
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
                width: 250,
                child: Text(
                  'استعادة كلمة المرور',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Container(
                    height: 5.0,
                    width: 150.0,
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
            const SizedBox(
              height: 60,
            ),
            emailField,
            const SizedBox(
              height: 30,
            ),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(18),
              color: squColor3,
              child: MaterialButton(
                height: 80,
                minWidth: 1000,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  'ارسال رمز التاكيد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
