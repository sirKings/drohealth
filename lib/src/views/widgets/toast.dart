import 'package:Drohealth/src/values/colors.dart' as colors;
import 'package:Drohealth/src/values/dimens.dart' as dimens;
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void show(String msg) => Fluttertoast.showToast(
    msg: msg ?? "Toast message",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 1,
    backgroundColor: colors.toastBackgroundColor,
    textColor: colors.toastTextColor,
    fontSize: dimens.fontText
  );

  static void cancelAll() => Fluttertoast.cancel();
}