import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/auth_landing.dart';
import 'package:circles/features/auth/social_login/data/service/google_signin_api.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAccInfo extends StatelessWidget {
  final GoogleSignInAccount user;
  const SocialAccInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: user.photoUrl != null
                    ? NetworkImage(user.photoUrl!)
                    : null,
                child: user.photoUrl == null
                    ? Icon(Icons.person, size: 40)
                    : null,
              ),

              Text("Name: ${user.displayName}", style: AppTextStyles.headline3),
              Text("Email: ${user.email}", style: AppTextStyles.headline3),
              Text("ID: ${user.id}", style: AppTextStyles.headline3),
              Text(
                "Auth code: ${user.serverAuthCode}",
                style: AppTextStyles.headline3,
              ),
              ElevatedButton(
                onPressed: () async {
                  await GoogleSigninApi.logout();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AuthLanding(),
                    ),
                  );
                },
                child: Text("Logout", style: AppTextStyles.regular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
