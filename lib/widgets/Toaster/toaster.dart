import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

final Duration toasterDuration = Duration(seconds: 8);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorToaster(BuildContext context, message) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: toasterDuration,
      content: CustomText(
        message,
        color: appWhite[100],
      ),
      backgroundColor: Colors.redAccent,
    ),
  );
}

ScaffoldFeatureController successToaster(BuildContext context, message) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: toasterDuration,
      content: CustomText(
        message,
        color: appWhite[100],
      ),
      backgroundColor: Colors.green,
    ),
  );
}
