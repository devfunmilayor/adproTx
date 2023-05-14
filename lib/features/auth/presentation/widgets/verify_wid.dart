// ignore_for_file: must_be_immutable, library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/features/auth/presentation/widgets/verify_widget.dart';
import 'package:flutter/material.dart';

class VerifyCodeBarType2 extends StatefulWidget {
  String code;
  bool isCenter;
  VerifyCodeBarType2({super.key, required this.code, this.isCenter = true});
  @override
  _VerifyCodeBarType2State createState() => _VerifyCodeBarType2State();
}

class _VerifyCodeBarType2State extends State<VerifyCodeBarType2> {
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();

  String getCode() {
    return (code1.text + code2.text + code3.text + code4.text).trim();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    //var authProvider = Provider.of<AuthenticationProvider>(context);
    //update(authProvider);
    widget.code = getCode();

    return Container(
        child: Row(
      mainAxisAlignment:
          widget.isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        SizedBox(
          width: dimension.width * 0.19,
          child: VerifyTextBox(
            textFieldBackgroundColor: const Color.fromRGBO(224, 225, 227, 1),
            controller: code1,
            nextController: code2,
            currentNode: node1,
            nextNode: node2,
            preNode: null,
            refresh: refresh,
          ),
        ),
        12.0.w,
        SizedBox(
          width: dimension.width * 0.19,
          child: VerifyTextBox(
            textFieldBackgroundColor: const Color.fromRGBO(224, 225, 227, 1),
            controller: code2,
            nextController: code3,
            currentNode: node2,
            nextNode: node3,
            preNode: node1,
            refresh: refresh,
          ),
        ),
        12.0.w,
        SizedBox(
          width: dimension.width * 0.19,
          child: VerifyTextBox(
            textFieldBackgroundColor: const Color.fromRGBO(224, 225, 227, 1),
            controller: code3,
            nextController: code4,
            currentNode: node3,
            nextNode: node4,
            preNode: node2,
            refresh: refresh,
          ),
        ),
        12.0.w,
        SizedBox(
          width: dimension.width * 0.19,
          child: VerifyTextBox(
            textFieldBackgroundColor: const Color.fromRGBO(224, 225, 227, 1),
            controller: code4,
            nextController: TextEditingController(),
            currentNode: node4,
            nextNode: null,
            preNode: node3,
            refresh: refresh,
          ),
        ),
      ],
    ));
  }
}
