import 'package:edulab/Pages/widgets/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edulab/Main_page.dart';
import 'package:edulab/Pages/widgets/CoustomerField.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/Theme.dart';
import 'providers/auth_view_model_provider.dart';
import 'restpass.dart';
import 'signUp.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final _formKeylogin = GlobalKey<FormState>();

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Model = ref.watch(authViewModelProvider);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKeylogin,
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
                    // Email Field ........................
                    TextFormField(
                        validator: (value) => Model.validateEmail(value!),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        onChanged: (value) => Model.email = value,
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
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    // Password Field ........................
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      onChanged: (value) => Model.password = value,
                      textInputAction: TextInputAction.next,
                      obscureText: Model.obscurepassword,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(Model.obscurepassword
                              ? Iconsax.eye
                              : Iconsax.eye_slash),
                          onPressed: () =>
                              Model.obscurepassword = !Model.obscurepassword,
                        ),
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
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordReset()));
                          },
                          child: Text(
                            "نسيت كلمة المرور ؟",
                            style: TextStyle(
                                color: squColor3,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Center(
                        child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(18),
                      color: squColor3,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        onPressed: () async {
                          if (_formKeylogin.currentState!.validate()) {
                            try {
                              await Model.login();
                              if (Model.user!.emailVerified) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyNevBar()));
                              } else {
                                Model.sendEmail();
                                throw "يرجى التحقق من بريدك الالكتروني والضغط على الرابط لتفعيل حسابك";
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  dismissDirection: DismissDirection.horizontal,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    e.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
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
                    )),
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
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "اليس لديك حساب ؟",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "سجل الان",
                              style: TextStyle(
                                  color: squColor3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyNevBar()));
                        },
                        child: Text(
                          "تخطي",
                          style: TextStyle(
                              color: squColor3,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Model.loading
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
