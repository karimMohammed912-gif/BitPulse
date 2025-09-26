import 'package:flutter/material.dart';

@override
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildErrorMessage(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error: $message'),
      backgroundColor: Colors.red,
    ),
  );
}


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSuccesMessage(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}
