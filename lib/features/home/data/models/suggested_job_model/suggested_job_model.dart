import 'data.dart';

class SuggestedJobModel {
  bool? status;
  Data? data;

  SuggestedJobModel({this.status, this.data});

  factory SuggestedJobModel.fromJson(Map<String, dynamic> json) {
    return SuggestedJobModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
