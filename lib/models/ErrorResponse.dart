class ErrorResponse {
  final int? status;
  final String? head;
  final String? message;
  ErrorResponse({this.status, this.head, this.message});
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['status'],
      head: json['head'],
      message: json['message'],
    );
  }
}
