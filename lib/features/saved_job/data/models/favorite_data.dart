import 'package:jobsque/features/home/data/models/job_model/data.dart';

class FavouriteModel {
  bool? status;
  List<FavouriteData>? data;

  FavouriteModel({this.status, this.data});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FavouriteData>[];
      json['data'].forEach((v) {
        data!.add(new FavouriteData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavouriteData {
  int? id;
  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  JobData? jobs;

  FavouriteData(
      {this.id,
      this.userId,
      this.like,
      this.jobId,
      this.image,
      this.name,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.jobs});

  FavouriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    like = json['like'];
    jobId = json['job_id'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jobs = json['jobs'] != null ? new JobData.fromJson(json['jobs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['like'] = this.like;
    data['job_id'] = this.jobId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }
    return data;
  }
}
