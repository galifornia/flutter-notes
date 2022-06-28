import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Please verify your email"),
        TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              print("SENDING VERIFICATION EMAIL");
              print(user);
              try {
                await user?.sendEmailVerification();
              } catch (e) {
                print(e);
              }
            },
            child: const Text("Send email"))
      ],
    );
  }
}
