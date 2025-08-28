import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  
  final ExpansibleController _expansionController = ExpansibleController();
  bool _isObscured = true;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegister() {
    // Handle register logic
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lCirclesGray
              : AppColors.lCirclesGray,
        ),

        borderRadius: BorderRadius.circular(25.r),
        // color: Colors.grey[50],
      ),
      child: ExpansionTile(
        controller: _expansionController,
        title: Text("Sign up with Email", style: AppTextStyles.regular),
        //  tilePadding: const EdgeInsets.all(20),
        childrenPadding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 20.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesGray.withAlpha(50)
            : AppColors.dCirclesGray.withAlpha(100),
        collapsedBackgroundColor:
            Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesGray.withAlpha(50)
            : AppColors.dCirclesGray.withAlpha(100),
        iconColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesPrimary
            : AppColors.dCirclesSecondary,
        collapsedIconColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesPrimary
            : AppColors.dCirclesSecondary,
        children: [
          Divider(
            height: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.lCirclesPrimary
                : AppColors.dCirclesSecondary,
          ),
          SizedBox(height: 20.h),

          // Email Field
TextFormField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
          //  controller: _emailController,
           // keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Email Address",
            ),
          ),
      
          SizedBox(height: 15.h),

          // Username Field
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),

          SizedBox(height: 15.h),

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  size: 20.sp,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: 20.h),

          // Terms text
          Text(
            "By continuing, you accept our terms of use and acknowledge our privacy policy",
            style: TextStyle(
              fontSize: 12.sp,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lCirclesPrimary
                  : AppColors.dCirclesSecondary,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),

          // Register Button
          ElevatedButton(
            onPressed: () {},
            child: Text("Register", style: AppTextStyles.regular),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
