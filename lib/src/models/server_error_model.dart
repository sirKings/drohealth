class ServerErrorModel {
  final int statusCode;
  final String errorMessage;
  final dynamic data;

  ServerErrorModel({this.statusCode, this.errorMessage, this.data});
}
