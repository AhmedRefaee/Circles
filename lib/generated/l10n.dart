// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Circles!`
  String get welcomeToCircles {
    return Intl.message(
      'Welcome to Circles!',
      name: 'welcomeToCircles',
      desc: '',
      args: [],
    );
  }

  /// `Where readers connect, share and grow`
  String get authLanding {
    return Intl.message(
      'Where readers connect, share and grow',
      name: 'authLanding',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Email`
  String get loginWithEmail {
    return Intl.message(
      'Login with Email',
      name: 'loginWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Register with Email`
  String get registerWithEmail {
    return Intl.message(
      'Register with Email',
      name: 'registerWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login now`
  String get loginNow {
    return Intl.message('Login now', name: 'loginNow', desc: '', args: []);
  }

  /// `By continuing, you accept our terms of use and acknowledge our privacy policy`
  String get termsText {
    return Intl.message(
      'By continuing, you accept our terms of use and acknowledge our privacy policy',
      name: 'termsText',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your email address. You will receive a link to create a new password via email.`
  String get passwordResetInstruction {
    return Intl.message(
      'Please, enter your email address. You will receive a link to create a new password via email.',
      name: 'passwordResetInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enterEmailAddressPlaceholder {
    return Intl.message(
      'Enter your email address',
      name: 'enterEmailAddressPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPasswordPlaceholder {
    return Intl.message(
      'Enter your password',
      name: 'enterPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enterUsernamePlaceholder {
    return Intl.message(
      'Enter your username',
      name: 'enterUsernamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Send Request`
  String get sendRequestCodeButton {
    return Intl.message(
      'Send Request',
      name: 'sendRequestCodeButton',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter Verification Code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4 digit code that has been sent to `
  String get verificationCodeInstruction {
    return Intl.message(
      'Please enter the 4 digit code that has been sent to ',
      name: 'verificationCodeInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code? `
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive the code? ',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message('Verify Code', name: 'verifyCode', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get enterNewPasswordPlaceholder {
    return Intl.message(
      'Enter your new password',
      name: 'enterNewPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your new password`
  String get enterConfirmPasswordPlaceholder {
    return Intl.message(
      'Confirm your new password',
      name: 'enterConfirmPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Set a New Password`
  String get setNewPasswordTitle {
    return Intl.message(
      'Set a New Password',
      name: 'setNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password for your Email Account`
  String get setNewPasswordSubtitle {
    return Intl.message(
      'Enter your new password for your Email Account',
      name: 'setNewPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully!`
  String get passwordUpdatedSuccessfully {
    return Intl.message(
      'Password updated successfully!',
      name: 'passwordUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter a password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get passwordNeedsLowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'passwordNeedsLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordNeedsUppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordNeedsUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNeedsNumber {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNeedsNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character`
  String get passwordNeedsSpecialChar {
    return Intl.message(
      'Password must contain at least one special character',
      name: 'passwordNeedsSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get pleaseConfirmPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'pleaseConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password must meet the following requirements:`
  String get passwordRequirements {
    return Intl.message(
      'Password must meet the following requirements:',
      name: 'passwordRequirements',
      desc: '',
      args: [],
    );
  }

  /// `At least one lowercase letter`
  String get atLeastOneLowercase {
    return Intl.message(
      'At least one lowercase letter',
      name: 'atLeastOneLowercase',
      desc: '',
      args: [],
    );
  }

  /// `At least one uppercase letter`
  String get atLeastOneUppercase {
    return Intl.message(
      'At least one uppercase letter',
      name: 'atLeastOneUppercase',
      desc: '',
      args: [],
    );
  }

  /// `At least one number`
  String get atLeastOneNumber {
    return Intl.message(
      'At least one number',
      name: 'atLeastOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Be at least 8 characters`
  String get atLeastEightCharacters {
    return Intl.message(
      'Be at least 8 characters',
      name: 'atLeastEightCharacters',
      desc: '',
      args: [],
    );
  }

  /// `At least one special symbol (e.g. !@#$%^&_+*)`
  String get atLeastOneSpecialSymbol {
    return Intl.message(
      'At least one special symbol (e.g. !@#\$%^&_+*)',
      name: 'atLeastOneSpecialSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Passwords match`
  String get passwordsMatch {
    return Intl.message(
      'Passwords match',
      name: 'passwordsMatch',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
