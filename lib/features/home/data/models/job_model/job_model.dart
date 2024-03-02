import 'data.dart';

class JobModel {
  bool? status;
  JobData? data;

  JobModel({this.status, this.data});

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : JobData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
