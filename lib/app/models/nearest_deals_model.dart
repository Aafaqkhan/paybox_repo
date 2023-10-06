class NearDeals {
  bool? success;
  String? message;
  List<Data>? data;

  NearDeals({this.success, this.message, this.data});

  NearDeals.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? businessName;
  int? vendorId;
  String? webAddress;
  String? subHeading;
  String? description;
  String? about;
  String? finePrint;
  int? termsConditions;
  int? categoryId;
  String? address;
  double? latitude;
  double? longitude;
  String? startPrice;
  String? dealPrice;
  Null? dealNotes;
  String? status;
  int? userId;
  String? endDate;
  int? isFeatured;
  String? tags;
  int? isApproved;
  int? purchasedCount;
  int? isTrending;
  String? createdAt;
  String? updatedAt;
  String? mediaId;
  double? distance;
  Logo? logo;
  Logo? banner;

  Data(
      {this.id,
      this.businessName,
      this.vendorId,
      this.webAddress,
      this.subHeading,
      this.description,
      this.about,
      this.finePrint,
      this.termsConditions,
      this.categoryId,
      this.address,
      this.latitude,
      this.longitude,
      this.startPrice,
      this.dealPrice,
      this.dealNotes,
      this.status,
      this.userId,
      this.endDate,
      this.isFeatured,
      this.tags,
      this.isApproved,
      this.purchasedCount,
      this.isTrending,
      this.createdAt,
      this.updatedAt,
      this.mediaId,
      this.distance,
      this.logo,
      this.banner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    vendorId = json['vendor_id'];
    webAddress = json['web_address'];
    subHeading = json['sub_heading'];
    description = json['description'];
    about = json['about'];
    finePrint = json['fine_print'];
    termsConditions = json['terms_conditions'];
    categoryId = json['category_id'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    startPrice = json['start_price'];
    dealPrice = json['deal_price'];
    dealNotes = json['deal_notes'];
    status = json['status'];
    userId = json['user_id'];
    endDate = json['end_date'];
    isFeatured = json['is_featured'];
    tags = json['tags'];
    isApproved = json['is_approved'];
    purchasedCount = json['purchased_count'];
    isTrending = json['is_trending'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mediaId = json['media_id'];
    distance = json['distance'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    banner = json['banner'] != null ? new Logo.fromJson(json['banner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_name'] = this.businessName;
    data['vendor_id'] = this.vendorId;
    data['web_address'] = this.webAddress;
    data['sub_heading'] = this.subHeading;
    data['description'] = this.description;
    data['about'] = this.about;
    data['fine_print'] = this.finePrint;
    data['terms_conditions'] = this.termsConditions;
    data['category_id'] = this.categoryId;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['start_price'] = this.startPrice;
    data['deal_price'] = this.dealPrice;
    data['deal_notes'] = this.dealNotes;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['end_date'] = this.endDate;
    data['is_featured'] = this.isFeatured;
    data['tags'] = this.tags;
    data['is_approved'] = this.isApproved;
    data['purchased_count'] = this.purchasedCount;
    data['is_trending'] = this.isTrending;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['media_id'] = this.mediaId;
    data['distance'] = this.distance;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['mime_type'] = this.mimeType;
    data['path'] = this.path;
    data['disk'] = this.disk;
    data['file_hash'] = this.fileHash;
    data['size'] = this.size;
    data['file_type'] = this.fileType;
    return data;
  }
}
