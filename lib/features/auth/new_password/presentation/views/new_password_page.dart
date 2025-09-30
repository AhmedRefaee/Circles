import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/helper/widgets/back_arrow_button.dart';
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
  // Step 2: Extract spacing constants
  static const double _titleBottomSpacing = 0; // No spacing after title
  static final double _formTopSpacing = AppSpacing.verticalLarge;
  static final double _conditionsTopSpacing = AppSpacing.verticalMedium;
  static final double _buttonTopSpacing = AppSpacing.verticalLarge;

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // Step 3-5: Extract helper methods
  PreferredSizeWidget _buildAppBar() {
    return AppBar(leading: BackArrowButton());
  }

  Widget _buildBody() {
    return SafeArea(
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
                _buildHeader(),
                SizedBox(height: _formTopSpacing),
                _buildForm(),
                SizedBox(height: _conditionsTopSpacing),
                _buildPasswordConditions(),
                SizedBox(height: _buttonTopSpacing),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final l10n = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildTitle(l10n), _buildSubtitle(l10n)],
    );
  }

  Widget _buildTitle(S l10n) {
    return Text(
      l10n.setNewPasswordTitle,
      style: AppTextStyles.headline2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle(S l10n) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: AppTextStyles.fourteen.copyWith(
          fontWeight: FontWeight.w400,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        children: [
          TextSpan(text: l10n.setNewPasswordSubtitle + ' '),
          TextSpan(
            text: widget.email,
            style: AppTextStyles.fourteen.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return NewPassForm(
      formKey: widget.formKey,
      passwordController: widget.passwordController,
      confirmPasswordController: widget.confirmPasswordController,
      passwordFocusNode: widget.passwordFocusNode,
      confirmPasswordFocusNode: widget.confirmPasswordFocusNode,
    );
  }

  Widget _buildPasswordConditions() {
    return const PasswordConditions();
  }

  Widget _buildSaveButton() {
    return BlocListener<SaveNewPasswordCubit, SaveNewPasswordState>(
      listener: _onSavePasswordStateChange,
      child: _buildSaveButtonBuilder(),
    );
  }

  Widget _buildSaveButtonBuilder() {
    return BlocBuilder<NewPasswordFormCubit, NewPasswordFormState>(
      builder: (context, formState) {
        return BlocBuilder<SaveNewPasswordCubit, SaveNewPasswordState>(
          builder: (context, saveState) =>
              _buildSaveButtonWithStates(formState, saveState),
        );
      },
    );
  }

  Widget _buildSaveButtonWithStates(
    NewPasswordFormState formState,
    SaveNewPasswordState saveState,
  ) {
    final isLoading = saveState is SaveNewPasswordSaving;
    final saveCubit = context.read<SaveNewPasswordCubit>();
    final isFormValid =
        formState is NewPasswordFormValidating && formState.isFormValid;
    final isEnabled = saveCubit.canExecuteSave() && isFormValid;

    return SaveNewPasswordButton(
      onPressed: () => _handleSavePassword(saveCubit),
      isLoading: isLoading,
      isEnabled: isEnabled,
    );
  }

  // Helper methods for business logic
  void _onSavePasswordStateChange(
    BuildContext context,
    SaveNewPasswordState state,
  ) {
    final l10n = S.of(context);

    if (state is SaveNewPasswordError) {
      _showErrorSnackBar(context, state.message);
    } else if (state is SaveNewPasswordSaved) {
      _showSuccessSnackBar(context, l10n.passwordUpdatedSuccessfully);
      // TODO: Navigate to login or home screen
      // Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  void _handleSavePassword(SaveNewPasswordCubit saveCubit) {
    final isValid = widget.formKey.currentState?.validate() ?? false;
    if (isValid) {
      saveCubit.executePasswordSave(
        isValid,
        widget.passwordController.text,
        widget.email,
      );
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}
