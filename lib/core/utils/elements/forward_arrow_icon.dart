import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class ForwardArrowIcon extends StatelessWidget {
  const ForwardArrowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/icons/arrow_forward.svg',
      width: 15.w,
      height: 10.h,
      matchTextDirection: true,
    );
  }
}
