class ErrorModel {
  final dynamic status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["message"],
      status: jsonData["status"],
    );
  }
}
