class PurchaseModel {
  bool? success;
  String? message;
  List<Data>? data;

  PurchaseModel({this.success, this.message, this.data});

  PurchaseModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? latitude;
  String? longitude;
  int? categoryId;
  String? status;
  String? tags;
  String? mediaId;
  String? deliveryId;
  String? distance;
  String? pinCode;
  int? userPoints;
  List<Services>? services;
  Logo? logo;
  Logo? banner;
  List<LoyaltyRedeemRules>? loyaltyRedeemRules;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.city,
      this.postalCode,
      this.shortInfo,
      this.description,
      this.latitude,
      this.longitude,
      this.categoryId,
      this.status,
      this.tags,
      this.mediaId,
      this.deliveryId,
      this.distance,
      this.pinCode,
      this.userPoints,
      this.services,
      this.logo,
      this.banner,
      this.loyaltyRedeemRules});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    postalCode = json['postal_code'];
    shortInfo = json['short_info'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    categoryId = json['category_id'];
    status = json['status'];
    tags = json['tags'];
    mediaId = json['media_id'];
    deliveryId = json['delivery_id'];
    distance = json['distance'];
    pinCode = json['pin_code'];
    userPoints = json['user_points'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    banner = json['banner'] != null ? Logo.fromJson(json['banner']) : null;
    if (json['loyalty_redeem_rules'] != null) {
      loyaltyRedeemRules = <LoyaltyRedeemRules>[];
      json['loyalty_redeem_rules'].forEach((v) {
        loyaltyRedeemRules!.add(LoyaltyRedeemRules.fromJson(v));
      });
    }
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
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['category_id'] = categoryId;
    data['status'] = status;
    data['tags'] = tags;
    data['media_id'] = mediaId;
    data['delivery_id'] = deliveryId;
    data['distance'] = distance;
    data['pin_code'] = pinCode;
    data['user_points'] = userPoints;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (banner != null) {
      data['banner'] = banner!.toJson();
    }
    if (loyaltyRedeemRules != null) {
      data['loyalty_redeem_rules'] =
          loyaltyRedeemRules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  int? mediaId;
  String? name;
  int? isActive;
  Logo? logo;

  Services({this.id, this.mediaId, this.name, this.isActive, this.logo});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    name = json['name'];
    isActive = json['is_active'];
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['name'] = name;
    data['is_active'] = isActive;
    if (logo != null) {
      data['logo'] = logo!.toJson();
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

class LoyaltyRedeemRules {
  int? id;
  int? userId;
  int? storeId;
  String? name;
  int? points;

  LoyaltyRedeemRules(
      {this.id, this.userId, this.storeId, this.name, this.points});

  LoyaltyRedeemRules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    name = json['name'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['store_id'] = storeId;
    data['name'] = name;
    data['points'] = points;
    return data;
  }
}
