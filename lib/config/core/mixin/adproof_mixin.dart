// ignore_for_file: unused_field, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/services.dart';

mixin ZabValidate {
  final RegExp _nigerianNumberFull = RegExp(r'^(234|0)(7|8|9)(0|1)\d{8}$');
  final RegExp numberRegExp = RegExp(r'^\d+$');

  final RegExp _passwordRegExp =
      RegExp(r'^(?=.[a-zA-Z])(?=.[@$!%?&])(?=.\d)[A-Za-z\d@$!%*?&]{8,}$');
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$',
  );
  String? validateUserInput(String? txt, String? lable) {
    String p = txt?.trim() ?? '';
    if (p.isEmpty) {
      return '$lable is required';
    }

    return null;
  }

  String? validateInvestAmount(String? txt, String? lable) {
    String amountTxt = txt?.trim() ?? '';

    String r = amountTxt.replaceFirst(',', '');
    log('r: $r');
    if (amountTxt.isEmpty) {
      return '$lable is required';
    }
    if (num.parse(r) < 10000) {
      return '$lable must be at least NGN 10,000';
    }

    return null;
  }

  String? bvnNoValidator(String? number, {bool allowEmpty = false}) {
    number = number?.replaceAll(' ', '');
    if (number?.isEmpty ?? true) {
      return allowEmpty ? null : 'Please enter your BVN';
    } else if (!numberRegExp.hasMatch(number!)) {
      return 'BVN can only include numbers ';
    } else if (number.length != 11) {
      return 'BVN number must be 11 digits';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    String p = password?.trim() ?? '';
    if (p.isEmpty) {
      return 'Please enter password';
    } else if (p.length < 6) {
      return 'password must be at least 6 characters';
    }
    return null;
  }

  checkPhoneNumberType3(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid phone number.';
    }
    value = value.trim();
    if (value.length != 10) {
      return 'Please enter the last 10 digits.';
    }
    try {
      int val = int.parse(value);
      return val;
    } catch (err) {
      return 'Please enter a valid phone number.';
    }
  }

  String? validateEmail(String? value, [bool allowEmpty = false]) {
    String _val = value.toString();
    String _emailPattern =
        r"(^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z])";

    RegExp regExp = RegExp(_emailPattern);

    ///returning var cus email is optional
    if (_val.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(_val)) {
      return 'Invalid E-mail';
    }

    return null;
  }

  String? newpasswordValidator(String password, [bool allowEmpty = false]) {
    RegExp regex =
        RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
    // String p = password?.trim();
    if (password.isEmpty) {
      return 'Please enter password';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!regex.hasMatch(password)) {
      return 'Password must contain a letter, number and a special character';
    }
    return null;
  }

  String? emailValidator(String? email, [bool allowEmpty = false]) {
    String e = email?.trim() ?? '';
    log('e ::: $e');
    if (e.isEmpty) {
      return allowEmpty ? null : 'Please enter email';
    } else if (!_emailRegExp.hasMatch(e)) {
      log('error $e');

      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateMinorEmail(String? value, String? guard,
      [bool allowEmpty = false]) {
    String _val = value.toString();
    String _emailPattern =
        r"(^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z])";

    RegExp regExp = RegExp(_emailPattern);

    ///returning var cus email is optional
    if (_val.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(_val)) {
      return 'Invalid E-mail';
    } else if (_val == guard) {
      return 'Guardian E-mail and Minor E-mail can\'t be the same';
    }

    return null;
  }

  String? rePasswordValidator(String password, String pass) {
    if (password != pass) return 'Passwords do not match';
    return null;
  }

  String? pinValidate(String? text, [bool allowEmpty = false]) {
    text = text?.trim() ?? '';
    if (text.isEmpty) {
      return 'Field can\'t be empty';
    } else if (text.length < 4) {
      return '';
    }
    return null;
  }

  String? otpValidator(String? text, [bool allowEmpty = false]) {
    text = text?.trim() ?? '';
    if (text.isEmpty) {
      return 'Otp must be  4 digits';
    } else if (!numberRegExp.hasMatch(text) || text.length != 4) {
      return 'Otp must be  4 digits';
    }
    return null;
  }

  String? phoneNumberFullValidator(String? number,
      [bool allowEmpty = false, bool restrictToNigeria = true]) {
    number = number!.replaceAll(' ', '');
    if (number.isEmpty) {
      return allowEmpty ? null : 'Please enter phone number';
    } else if (!numberRegExp.hasMatch(number)) {
      return 'Phone number can only include numbers ';
    } else if (!_nigerianNumberFull.hasMatch(number)) {
      return 'Please enter a valid Nigerian number';
    }
    return null;
  }
}

class PhoneNumberFormatter extends TextInputFormatter with ZabValidate {
  final int maxLength;

  PhoneNumberFormatter({this.maxLength = 11});
  int position = 0;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = sanitizeNumber(newValue.text);

    // if(text.length >= maxLength)p

    if (newValue.selection.baseOffset == 0) return newValue;
    position = newValue.selection.baseOffset;
    text = formatText(text) ?? '';

    // print(
    //     'offset $position ${newValue.selection.baseOffset} ${text.length} $text');
    if (newValue.selection.baseOffset < text.length - 1) {
      position = newValue.selection.baseOffset;
    }
    return newValue.copyWith(
        // composing: TextRange.collapsed(13),
        text: text,
        selection: TextSelection.fromPosition(TextPosition(offset: position)));
  }

  String? formatText(String text) {
    if (text == null) return null;
    text = sanitizeNumber(text);
    int startOffset = 2;
    position = 0;
    var buffer = StringBuffer();
    if (text[0] == '0') startOffset = 3;
    for (int i = 0; i < text.length; i++) {
      if (numberRegExp.hasMatch(text[i])) {
        //&&
        // ((startOffset == 2 && i < 12) || startOffset == 3)) {
        position++;
        buffer.write(text[i]);
      }
      if ((i == startOffset ||
              i == startOffset + 4 ||
              i == startOffset + 8 ||
              (startOffset == 2 && i == startOffset + 9)) &&
          i != text.length - 1) {
        position++;
        buffer.write(' ');
      }
    }
    return buffer.toString().trim();
  }

  /// remove characters from number
  String sanitizeNumber(String number) {
    String? text = number.trim();
    // text = text.replaceAll(RegExp(r'^\d+$'), '');
    text = text.replaceAll('-', '');
    text = text.replaceAll('(', '');
    text = text.replaceAll(')', '');
    text = text.replaceAll(' ', '');
    return text;
  }
}
