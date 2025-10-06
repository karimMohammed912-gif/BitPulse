import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

@override
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildErrorMessage(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${AppLocalizations.of(context).Error_} $message'),
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
