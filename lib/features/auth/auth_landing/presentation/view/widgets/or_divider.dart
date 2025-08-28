import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 1.h,
          width: 120.w,
          color: Colors.grey,
        ),
        Text(
          S.of(context).or,
        ),
        Container(
          height: 1.h,
          width: 120.w,
          color: Colors.grey,
        ),
      ],
    );
  }
}