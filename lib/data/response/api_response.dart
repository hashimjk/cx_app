import 'package:cx_app/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.status, this.message);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.error(this.message) : status = Status.error;
  ApiResponse.completed(this.data) : status = Status.completed;

  @override
  String toString() {
    return 'Status: $status, Data:  $data, message: $message';
  }
}
