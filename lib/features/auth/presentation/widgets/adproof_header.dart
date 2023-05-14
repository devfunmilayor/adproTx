// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/di/injector.dart';
import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/font_size.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/config/core/route/nav_keys.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdproofBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTap;
  final String? label;
  final bool cTap;
  final bool enableBg;
  final bool showIcon;
  const AdproofBar({
    Key? key,
    this.onTap,
    this.label,
    this.cTap = false,
    this.showIcon = true,
    this.enableBg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: enableBg ? 0 : 0.1,
      backgroundColor: enableBg ? null : ColorManager.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        // statusBarColor: ColorManager.white,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: false,
      leading: GestureDetector(
        onTap: cTap ? onTap : () => si<NavigationService>().goBack(),
        child: Transform.translate(
          offset: Offset(12, 0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: enableBg ? ColorManager.white : ColorManager.black,
                  width: enableBg ? 1 : 0.5,
                )),
            child: showIcon
                ? Icon(
                    CupertinoIcons.back,
                    size: 18.sp,
                    color: enableBg ? ColorManager.white : ColorManager.black,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
      title: Transform.translate(
        offset: const Offset(-20, 0),
        child: AutoSizeText(
          label ?? '',
          style: getExtraBoldStyle(
            color: ColorManager.black,
            fontSize: FontSize.s16,
          ),
        ),
      ),
    ).animate(delay: 400.ms).fadeIn(
          curve: Curves.easeOut,
          duration: 600.ms,
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget privacyWidR() {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      AppString.adProfPrivacy,
      style: getBoldStyle(
        color: ColorManager.kPrimColorII,
        fontSize: 12.5,
      ),
    ),
    subtitle: Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Text(
        AppString.randI,
        style: getRegularStyle(
          color: ColorManager.kPrimColor,
          fontSize: 10,
        ),
      ),
    ),
  );
}

Widget rowTxtW({String? lable}) {
  return ListTile(
    dense: true,
    visualDensity: VisualDensity(horizontal: -4),
    leading: Icon(
      Icons.circle,
      size: 10,
      color: ColorManager.btnColorDefault,
    ),
    contentPadding: EdgeInsets.zero,
    title: Text(
      lable ?? '',
      style: getRegularStyle(
        color: ColorManager.kPrimColorII,
        fontSize: 10,
      ),
    ),
  );
}
