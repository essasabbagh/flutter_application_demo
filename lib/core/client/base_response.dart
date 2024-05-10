class BaseResponse<T> {
  T? data;
  String message;
  int status;
  bool success;

  BaseResponse({
     this.data,
    required this.message,
    required this.status,
    required this.success,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      data: json['data'] as T,
      message: json['message'] as String,
      status: json['status'] as int,
      success: json['success'] as bool,
    );
  }

  factory BaseResponse.fromDecodedJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) dataFromJson,
  ) {
    final data = json['data'] == null ? null : dataFromJson(json['data']);

    return BaseResponse(
      data: data,
      message: json['message'] as String,
      status: json['status'] as int,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}
