// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ColorManager {
  static Color linearGradient_i = HexColor.fromHex('#0283F9');
  static Color linearGradient_ii = HexColor.fromHex('#03294A');
  static Color primary = HexColor.fromHex("#0083F8");
  static Color textFiledColor = HexColor.fromHex('#A0CBE2');
  static Color primaryPinBorder = HexColor.fromHex("#DDE2FD");
  // static Color primary = HexColor.fromHex("#21205C");
  static Color lightPrimary = HexColor.fromHex("#46B4FB");
  static Color transparent = Colors.transparent;
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#53535C");
  static Color boxBgGrey = HexColor.fromHex("#FAFAFA");
  static Color boxGreyBorder = HexColor.fromHex("#E2E2E2");
  static Color green = Colors.green;
  static Color darkGold = HexColor.fromHex("#FCB42F");
  static Color blue = HexColor.fromHex("#165DFF");
  static Color funcTinalColor = HexColor.fromHex('#F9F9F9');
  static Color lightBlue = HexColor.fromHex("#31ABFC");
  static Color lightGrey = HexColor.fromHex("#999999");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color deemedPrimary = HexColor.fromHex("#C4DEEC");
  static Color lighterPrimary = HexColor.fromHex("#E7E7F9");
  static Color lighterBlue = HexColor.fromHex("#B0DEFC");
  static Color black = HexColor.fromHex("#000000");
  static Color smsCopy2fa = HexColor.fromHex('#5061FF');
  static Color darkPrimary = HexColor.fromHex("#21205C");
  static Color grey1 = HexColor.fromHex("#53535C");
  static Color grey2 = HexColor.fromHex("#8B8B92");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#FC2417");
  static Color boxC = HexColor.fromHex('#108AF9');
  static Color boxCC = HexColor.fromHex('#008CF3');
  static Color getstartedBtnColor = HexColor.fromHex('#23C651');
  static Color skipCl = HexColor.fromHex('#22215B');
  static Color onboardingTxtColor = HexColor.fromHex('#22215B');
  static Color zabAppBar = HexColor.fromHex('#22215B');
  static Color checkBox = HexColor.fromHex('#D9ECFE');
  static Color postNotificationLeadingIconColor = HexColor.fromHex('#F9953B');
  static Color postNotificationTitleColor = HexColor.fromHex('#5061FF');
  static Color postBgColor = HexColor.fromHex('#F7ECE3');
  static Color vCard = HexColor.fromHex('#F6F6F6');
  static Color dash = HexColor.fromHex('#F6F6F6');
  static Color transBuyColor = HexColor.fromHex('#41C174');
  static Color pendingTransaction = HexColor.fromHex('#FFC548');
  static Color failedTransaction = HexColor.fromHex('#FF6655');
  static Color cupertinSelectSwitchBgColor = HexColor.fromHex('#E5E5E5');
  static Color marketCap = HexColor.fromHex('#3B37DE');
  static Color etherColor = HexColor.fromHex('#53AE94');
  static Color usdcColor = HexColor.fromHex('#2775CA');
  static Color btcWalletColor = HexColor.fromHex('#FFAB2C');
  static Color kyR = HexColor.fromHex('#EFDAF6');
  static Color dLar = HexColor.fromHex('#E9FBF3');
  static Color settingCicularColor = HexColor.fromHex('#B3DAFD');
  static Color settingsLabelColor = HexColor.fromHex('#323A61');
  static Color logout_deleteAccoutColor = HexColor.fromHex('#FF6655');
  static Color addCountryBg = HexColor.fromHex('#F9FAFC');
  static Color addCountryBorder = HexColor.fromHex('#D6D9E4');
  static Color xc = HexColor.fromHex('#DAFFE7');
  static Color upload_bg_clr = HexColor.fromHex('#1E253A');
  static Color quickie_setup_verify_item_color = HexColor.fromHex('#969BA0');
  static Color quick_verifiedColor = HexColor.fromHex('#24C651');
  static Color camera_bg_ = HexColor.fromHex('#606574');
  static Color faRecommendedColor = HexColor.fromHex('#FFC548');
  static Color t2FacolorGenCode = HexColor.fromHex('#FFF4EB');
  static Color reason4deletingAccount = HexColor.fromHex('#FFE0DD');
  static Color dleRBgColor = HexColor.fromHex('#FFEEEC');
  static Color fundCard = HexColor.fromHex('#E1F0FA');
  static Color benef = HexColor.fromHex('#D9FFE7');
  static Color benef_i = HexColor.fromHex('#00CA78');
  static Color checkBoxColor = HexColor.fromHex('#00CA78');
  static Color walletTransferSucDesc = HexColor.fromHex('#ECEFF8');
  static Color bgIc = HexColor.fromHex('#4C70D0');
  static Color functionalColor = HexColor.fromHex('#E5F0F9');
  static Color giftCardCircularImgaeBg = HexColor.fromHex('#E7F0FF');
  static Color iconColor = HexColor.fromHex('#525560');
  static Color dashBoardTabColor = HexColor.fromHex('#4CAB96');
  static Color cardColorC = HexColor.fromHex('#E5E5E7');
  static Color starcolor = HexColor.fromHex('#EA9A3A');
  static Color bottomNavColor = HexColor.fromHex('#FDFDFD');
  static Color favoriteColor = HexColor.fromHex('#E55986');
  static Color byNowBtn = HexColor.fromHex('#2A2D40');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', "");

    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
