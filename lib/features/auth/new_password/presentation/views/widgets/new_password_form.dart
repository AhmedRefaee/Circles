import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPassForm extends StatelessWidget {
  const NewPassForm({
    super.key,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required FocusNode passwordFocusNode,
    required FocusNode confirmPasswordFocusNode,
  })  : _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _passwordFocusNode = passwordFocusNode,
        _confirmPasswordFocusNode = confirmPasswordFocusNode;

  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final FocusNode _passwordFocusNode;
  final FocusNode _confirmPasswordFocusNode;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.06, // Approximately 6% of screen height
          width: screenWidth * 0.8, // Approximately 80% of screen width
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "New Password",
           
            ),
            obscureText: true,
            controller: _passwordController,
            
            focusNode: _passwordFocusNode,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
          ),
        ),
        const Spacer(),
        SizedBox(
          height: screenHeight * 0.06, // Approximately 6% of screen height
          width: screenWidth * 0.8, // Approximately 80% of screen width
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Confirm Password",
            ),
            obscureText: true,
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            textInputAction: TextInputAction.done,
          ),
        ),
      ],
    );
  }
}