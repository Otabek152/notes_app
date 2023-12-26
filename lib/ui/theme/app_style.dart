import 'package:flutter/material.dart';
import 'package:notes_app/ui/theme/app_colors.dart';

abstract class AppStyle {
  static const fontStyle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
    static const titleStyle = TextStyle(
    color: AppColors.backgroundColor,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
     static const appBatTitle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
}
