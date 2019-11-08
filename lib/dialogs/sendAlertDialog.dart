import 'package:flutter/material.dart';
import 'package:secalert/widgets/sendAlertBottomSheet.dart';

class SendAlertDialog extends StatefulWidget {
  @override
  _SendAlertDialogState createState() => _SendAlertDialogState();
}

class _SendAlertDialogState extends State<SendAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SendAlertSheet(),
    );
  }
}
