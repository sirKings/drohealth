import 'package:Drohealth/src/values/colors.dart' as colors;
import 'package:Drohealth/src/values/dimens.dart' as dimens;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatelessWidget {
  final bool autofocus;
  final Stream<dynamic> value;
  final Function(dynamic) onChange;
  final String placeholder;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;
  final String labelText;
  final String mask;
  final TextEditingController controller;
  final String hint;

  const EditText(
      {Key key,
      this.autofocus,
      this.value,
      this.onChange,
      this.placeholder,
      this.keyboardType = TextInputType.text,
      this.password = false,
      this.dark,
      this.multiline = false,
      this.labelText,
      this.mask,
      this.controller,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      obscureText: this.password == true ? true : false,
      onChanged: (text) {
        if (this.onChange != null) this.onChange(text);
      },
      validator: (String value) {
        if (value.isEmpty) {
          return "$placeholder cannot be empty";
        } else if (placeholder.contains("Email") || placeholder.contains("email")) {
          bool isValidEmail =
              RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value);
          return isValidEmail ? null : "This is not a valid email";
        } else
          return null;
      },
      maxLines: multiline == true ? null : 1,
      keyboardType: multiline == true ? TextInputType.multiline : keyboardType,
      style: TextStyle(color: this.dark == true ? colors.backgroundColor : colors.primaryColor //cor do texto ao digitar,
          ),
      autofocus: autofocus == null ? false : true,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        hintText: this.hint,
        labelText: this.labelText == null ? this.placeholder : this.labelText,
        //errorText: snapshot.error,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: this.dark == true ? Colors.white : colors.primaryColorDark, //cor da borda
              width: 0.0),
        ),
        hintStyle: TextStyle(
            color: Colors.transparent, //cor do placeholder com foco
            fontSize: dimens.fontEditText),
        enabled: true,
        labelStyle: TextStyle(fontSize: dimens.fontEditText, color: this.dark == true ? colors.accentLightColor : colors.accentLightColor //cor da label
            ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: colors.accentLightColor, //cor da label quando esta com focus
                width: 0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: dark == true ? colors.backgroundColor : colors.primaryColorDark, //cor da label quando esta com focus
              width: 1),
        ),
      ),
    );
  }
}
