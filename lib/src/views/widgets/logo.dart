import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final bool header;
  final bool small;

  const Logo({Key key, this.small, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _logo = new AssetImage("assets/images/logo.png");
    var _logoHeader = new AssetImage("assets/images/logo_header.png");

    return Image(
      image: header == true ? _logoHeader : _logo,
      width: small == true ? 180 : 350,
      //fit: BoxFit.cover,
    );
  }
}
