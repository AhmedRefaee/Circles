import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/elements/back_arrow_button.dart';
import 'package:circles/features/auth/new_password/presentation/view_model/new_password/new_password_form_cubit.dart';
import 'package:circles/features/auth/new_password/presentation/view_model/save_new_password/save_new_password_cubit.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/new_password_form.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/password_conditions.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/save_new_password_button.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordPage extends StatefulWidget {
  final String email;

  const NewPasswordPage({super.key, required this.email});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewPasswordFormCubit()),
        BlocProvider(create: (context) => SaveNewPasswordCubit()),
      ],
      child: _NewPasswordView(
        email: widget.email,
        formKey: _formKey,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
        passwordFocusNode: _passwordFocusNode,
        confirmPasswordFocusNode: _confirmPasswordFocusNode,
      ),
    );
  }
}

class _NewPasswordView extends StatefulWidget {
  final String email;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;

  const _NewPasswordView({
    required this.email,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  });

  @override
  State<_NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<_NewPasswordView> {
  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_onPasswordChanged);
    widget.confirmPasswordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    context.read<NewPasswordFormCubit>().checkPasswords(
      widget.passwordController.text,
      widget.confirmPasswordController.text,
    );
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_onPasswordChanged);
    widget.confirmPasswordController.removeListener(_onPasswordChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: BackArrowButton()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.screenHorizontal,
              vertical: AppSpacing.screenVertical,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.setNewPasswordTitle,
                    style: AppTextStyles.headline2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: AppTextStyles.fourteen.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppTextStyles.fourteen.color,
                      ),
                      children: [
                        TextSpan(text: l10n.setNewPasswordSubtitle + ' '),
                        TextSpan(
                          text: widget.email,
                          style: AppTextStyles.fourteen.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTextStyles.fourteen.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.verticalLarge),
                  NewPassForm(
                    formKey: widget.formKey,
                    passwordController: widget.passwordController,
                    confirmPasswordController: widget.confirmPasswordController,
                    passwordFocusNode: widget.passwordFocusNode,
                    confirmPasswordFocusNode: widget.confirmPasswordFocusNode,
                  ),
                  SizedBox(height: AppSpacing.verticalMedium),
                  const PasswordConditions(),
                  SizedBox(height: AppSpacing.verticalLarge),
                  BlocListener<SaveNewPasswordCubit, SaveNewPasswordState>(
                    listener: (context, state) {
                      if (state is SaveNewPasswordError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is SaveNewPasswordSaved) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l10n.passwordUpdatedSuccessfully),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // TODO: Navigate to login or home screen
                        // Navigator.of(context).pushReplacementNamed('/login');
                      }
                    },
                    child:
                        BlocBuilder<NewPasswordFormCubit, NewPasswordFormState>(
                          builder: (context, formState) {
                            return BlocBuilder<
                              SaveNewPasswordCubit,
                              SaveNewPasswordState
                            >(
                              builder: (context, saveState) {
                                final isLoading =
                                    saveState is SaveNewPasswordSaving;
                                final saveCubit = context
                                    .read<SaveNewPasswordCubit>();

                                // Get form validation state
                                final isFormValid =
                                    formState is NewPasswordFormValidating &&
                                    formState.isFormValid;
                                final isEnabled =
                                    saveCubit.canExecuteSave() && isFormValid;

                                return SaveNewPasswordButton(
                                  onPressed: () {
                                    final isValid =
                                        widget.formKey.currentState
                                            ?.validate() ??
                                        false;
                                    if (isValid) {
                                      saveCubit.executePasswordSave(
                                        isValid,
                                        widget.passwordController.text,
                                        widget.email,
                                      );
                                    }
                                  },
                                  isLoading: isLoading,
                                  isEnabled: isEnabled,
                                );
                              },
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
