import 'package:edulab/Pages/login&singUp/login.dart';
import 'package:edulab/Pages/login&singUp/providers/auth_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edulab/theme/Theme.dart';
import 'package:flutter/material.dart';

class EmailVerify extends ConsumerWidget {
  const EmailVerify({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authViewModelProvider);

    auth.reload();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(
                auth.user!.emailVerified
                    ? Icons.check_circle_outline
                    : Icons.email_outlined,
                size: 150,
                color: Colors.green,
              ),
              Spacer(),
              Text(
                auth.user!.emailVerified
                    ? 'تم تفعيل حسابك بنجاح'
                    : 'تم ارسال رسالة التحقق الى بريدك الالكتروني',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                auth.user!.emailVerified
                    ? 'يمكنك الان تسجيل الدخول'
                    : 'يرجى التحقق من بريدك الالكتروني والضغط على الرابط لتفعيل حسابك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(18),
                color: squColor3,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  onPressed: () {
                    print(auth.user!.emailVerified);
                    auth.user!.emailVerified
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()))
                        : auth.reload();
                  },
                  child: Text(
                    auth.user!.emailVerified ? "متابعة" : 'التأكد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
