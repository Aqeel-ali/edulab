import 'package:edulab/Pages/login&singUp/emailVerifyPage.dart';
import 'package:edulab/Pages/login&singUp/providers/auth_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edulab/Pages/widgets/CoustomerField.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../theme/Theme.dart';
import 'login.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final nameController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class Register extends ConsumerWidget {
  Register({Key? key}) : super(key: key);

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
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
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

                  // Name Field .............................
                  TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        nameController.text = value!;
                      },
                      onChanged: (value) {
                        Model.name = value;
                      },
                      validator: (value) => Model.validateName(value!),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.person_outline),
                        contentPadding: const EdgeInsets.all(25),
                        label: const Text(
                          "الاسم الثلاثي",
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

                  // Email Field .............................
                  TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      onChanged: (value) {
                        Model.email = value;
                      },
                      validator: (value) => Model.validateEmail(value!),
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

                  // Password Field .............................
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    onChanged: (value) {
                      Model.password = value;
                    },
                    validator: (value) => Model.validatePassword(value!),
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

                  // Confirm Password Field .............................
                  TextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {
                        confirmPasswordController.text = value!;
                      },
                      onChanged: (value) {
                        Model.confirmPassword = value;
                      },
                      validator: (value) =>
                          Model.validateConfirmPassword(value!),
                      obscureText: Model.obscureconfirmPassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(Model.obscureconfirmPassword
                              ? Iconsax.eye
                              : Iconsax.eye_slash),
                          onPressed: () => Model.obscureconfirmPassword =
                              !Model.obscureconfirmPassword,
                        ),
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
                      )),
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
                      onPressed: () async {
                        _validateAndSubmit(context, ref);
                      },
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
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
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
                      const Text(
                        "لديك حساب بالفعل؟",
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
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          " تسجيل الدخول",
                          style: TextStyle(
                              color: squColor3,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  )
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
    ));
  }

  void _validateAndSubmit(BuildContext context, WidgetRef ref) async {
    final Model = ref.read(authViewModelProvider);
    if (_formKey.currentState!.validate()) {
      try {
        Model.loading = true;
        await Model.signup();
        Model.loading = false;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => EmailVerify()));
      } catch (e) {
        Model.loading = false;
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
  }
}
