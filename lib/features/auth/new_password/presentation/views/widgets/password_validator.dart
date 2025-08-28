
class PasswordValidator {
  // Password validation states
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool hasSpecialChar = false;
  bool passwordsMatch = false;

  // Validate a password and return updated validation states
  void validatePassword(String password, String confirmPassword) {
    hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = RegExp(r'[0-9]').hasMatch(password);
    hasMinLength = password.length >= 8;
    hasSpecialChar = RegExp(r'[-+_!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    passwordsMatch = password == confirmPassword && confirmPassword.isNotEmpty;
  }

  // Check if all conditions are met
  bool allConditionsMet() {
    return hasLowercase && 
           hasUppercase && 
           hasNumber && 
           hasMinLength && 
           hasSpecialChar && 
           passwordsMatch;
  }

  // Get error message based on failed validation
  String? getErrorMessage() {
    if (!passwordsMatch) {
      return "Passwords do not match";
    } else if (!hasLowercase) {
      return "Password must contain at least one lowercase letter";
    } else if (!hasUppercase) {
      return "Password must contain at least one uppercase letter";
    } else if (!hasNumber) {
      return "Password must contain at least one number";
    } else if (!hasMinLength) {
      return "Password must be at least 8 characters long";
    } else if (!hasSpecialChar) {
      return "Password must contain at least one special character";
    }
    return null;
  }
} 