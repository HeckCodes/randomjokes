class ErrorModel {
  final bool error;
  final bool internalError;
  final int code;
  final String message;
  final List<String> causedBy;
  final String additionalInfo;
  final int timestamp;

  ErrorModel({
    required this.error,
    required this.internalError,
    required this.code,
    required this.message,
    required this.causedBy,
    required this.additionalInfo,
    required this.timestamp,
  });

  static ErrorModel fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      error: json['error'] as bool,
      internalError: json['internalError'] as bool,
      code: json['code'] as int,
      message: json['message'] as String,
      causedBy: (json['causedBy'] as List<dynamic>).cast<String>(),
      additionalInfo: json['additionalInfo'] as String,
      timestamp: json['timestamp'] as int,
    );
  }

  @override
  String toString() {
    return 'ErrorModel{error: $error, internalError: $internalError, code: $code, message: $message, causedBy: $causedBy, additionalInfo: $additionalInfo, timestamp: $timestamp}';
  }
}
