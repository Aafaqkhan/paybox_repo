class Loyalty {
  bool? success;
  String? message;
  List<Data>? data;

  Loyalty({this.success, this.message, this.data});

  Loyalty.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? city;
  String? postalCode;
  String? shortInfo;
  String? latitude;
  String? longitude;
  int? categoryId;
  String? status;
  String? tags;
  String? mediaId;
  String? distance;
  Logo? logo;
  Logo? banner;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.city,
      this.postalCode,
      this.shortInfo,
      this.latitude,
      this.longitude,
      this.categoryId,
      this.status,
      this.tags,
      this.mediaId,
      this.distance,
      this.logo,
      this.banner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    postalCode = json['postal_code'];
    shortInfo = json['short_info'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    categoryId = json['category_id'];
    status = json['status'];
    tags = json['tags'];
    mediaId = json['media_id'];
    distance = json['distance'];
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    banner = json['banner'] != null ? Logo.fromJson(json['banner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['postal_code'] = postalCode;
    data['short_info'] = shortInfo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['category_id'] = categoryId;
    data['status'] = status;
    data['tags'] = tags;
    data['media_id'] = mediaId;
    data['distance'] = distance;
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    return data;
  }
}

class Logo {
  int? id;
  String? name;
  String? fileName;
  String? mimeType;
  String? path;
  String? disk;
  String? fileHash;
  int? size;
  String? fileType;

  Logo(
      {this.id,
      this.name,
      this.fileName,
      this.mimeType,
      this.path,
      this.disk,
      this.fileHash,
      this.size,
      this.fileType});

  Logo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    path = json['path'];
    disk = json['disk'];
    fileHash = json['file_hash'];
    size = json['size'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['path'] = path;
    data['disk'] = disk;
    data['file_hash'] = fileHash;
    data['size'] = size;
    data['file_type'] = fileType;
    return data;
  }
}
