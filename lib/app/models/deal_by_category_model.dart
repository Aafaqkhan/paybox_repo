class DealByCategory {
  bool? success;
  String? message;
  List<Data>? data;

  DealByCategory({this.success, this.message, this.data});

  DealByCategory.fromJson(Map<String, dynamic> json) {
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
  String? businessLogo;
  String? dealImage;
  int? userId;
  String? endDate;
  int? isFeatured;
  String? tags;
  int? isApproved;
  int? purchasedCount;
  int? isTrending;
  String? createdAt;
  String? updatedAt;

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
      this.businessLogo,
      this.dealImage,
      this.userId,
      this.endDate,
      this.isFeatured,
      this.tags,
      this.isApproved,
      this.purchasedCount,
      this.isTrending,
      this.createdAt,
      this.updatedAt});

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
    businessLogo = json['business_logo'];
    dealImage = json['deal_image'];
    userId = json['user_id'];
    endDate = json['end_date'];
    isFeatured = json['is_featured'];
    tags = json['tags'];
    isApproved = json['is_approved'];
    purchasedCount = json['purchased_count'];
    isTrending = json['is_trending'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['business_name'] = businessName;
    data['vendor_id'] = vendorId;
    data['web_address'] = webAddress;
    data['sub_heading'] = subHeading;
    data['description'] = description;
    data['about'] = about;
    data['fine_print'] = finePrint;
    data['terms_conditions'] = termsConditions;
    data['category_id'] = categoryId;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['start_price'] = startPrice;
    data['deal_price'] = dealPrice;
    data['deal_notes'] = dealNotes;
    data['status'] = status;
    data['business_logo'] = businessLogo;
    data['deal_image'] = dealImage;
    data['user_id'] = userId;
    data['end_date'] = endDate;
    data['is_featured'] = isFeatured;
    data['tags'] = tags;
    data['is_approved'] = isApproved;
    data['purchased_count'] = purchasedCount;
    data['is_trending'] = isTrending;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
