import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/auth_landing/presentation/view_model/auth/auth_cubit.dart';
import 'package:circles/features/auth/forgot_password/presentation/view/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final ExpansibleController _expansionController = ExpansibleController();
  bool _isObscured = true;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ///// Login Form
          Container(
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
              title: Text("Sign in with Email", style: AppTextStyles.regular),
              //  tilePadding: const EdgeInsets.all(20),
              childrenPadding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 20.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
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
              collapsedIconColor:
                  Theme.of(context).brightness == Brightness.light
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
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  //  controller: _emailController,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Email Address"),
                ),

                SizedBox(height: 15.h),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          // Handle remember me toggle
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {
                                // Handle checkbox change
                              },
                            ),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Remember me",
                                  style: AppTextStyles.regular,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => (ForgotPasswordPage()),
                            ),
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyles.fourteen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Register Button
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Register", style: AppTextStyles.fourteen),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ///// Dont have an account text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: AppTextStyles.fourteen),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final authCubit = context.read<AuthCubit>();
                  return GestureDetector(
                    onTap: () => authCubit.switchToRegister(),
                    child: Text(
                      "Sing up",
                      style: AppTextStyles.fourteen.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.lCircleaccent
                            : AppColors.dCircleaccent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
