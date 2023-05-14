import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:flutter/material.dart';

class SkipOrSignIn extends StatelessWidget {
  const SkipOrSignIn({
    super.key,
    this.skip,
    this.signIn,
  });

  final Function()? skip, signIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: signIn,
                child: Text(
                  AppString.signIn,
                  textAlign: TextAlign.center,
                  style: getBoldStyle(
                    fontSize: 10,
                    color: ColorManager.kPrimColorII,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.circle,
                color: ColorManager.grey.withOpacity(0.2),
                size: 10,
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: skip,
                child: Text(
                  AppString.skip,
                  textAlign: TextAlign.center,
                  style: getBoldStyle(
                    fontSize: 10,
                    color: ColorManager.kPrimColorII,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
