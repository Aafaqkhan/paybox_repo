class Deals {
  Deals({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final Data data;

  Deals.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.trendingDeals,
    required this.featuredDeals,
  });
  late final List<TrendingDealsModel> trendingDeals;
  late final FeaturedDeals featuredDeals;

  Data.fromJson(Map<String, dynamic> json) {
    trendingDeals = List.from(json['trendingDeals'])
        .map((e) => TrendingDealsModel.fromJson(e))
        .toList();
    featuredDeals = FeaturedDeals.fromJson(json['featuredDeals']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trendingDeals'] = trendingDeals.map((e) => e.toJson()).toList();
    _data['featuredDeals'] = featuredDeals.toJson();
    return _data;
  }
}

class TrendingDealsModel {
  TrendingDealsModel({
    required this.id,
    required this.businessName,
    required this.vendorId,
    required this.webAddress,
    required this.subHeading,
    required this.description,
    required this.about,
    required this.finePrint,
    required this.termsConditions,
    required this.categoryId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.startPrice,
    required this.dealPrice,
    this.dealNotes,
    required this.status,
    required this.businessLogo,
    required this.dealImage,
    required this.userId,
    required this.endDate,
    required this.isFeatured,
    required this.tags,
    required this.isApproved,
    required this.purchasedCount,
    required this.isTrending,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String businessName;
  late final int vendorId;
  late final String webAddress;
  late final String? subHeading;
  late final String description;
  late final String about;
  late final String finePrint;
  late final int termsConditions;
  late final int categoryId;
  late final String address;
  late final double latitude;
  late final double longitude;
  late final String startPrice;
  late final String dealPrice;
  late final Null dealNotes;
  late final String status;
  late final String businessLogo;
  late final String dealImage;
  late final int userId;
  late final String endDate;
  late final int isFeatured;
  late final String tags;
  late final int isApproved;
  late final int purchasedCount;
  late final int isTrending;
  late final String createdAt;
  late final String updatedAt;

  TrendingDealsModel.fromJson(Map<String, dynamic> json) {
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
    dealNotes = null;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['business_name'] = businessName;
    _data['vendor_id'] = vendorId;
    _data['web_address'] = webAddress;
    _data['sub_heading'] = subHeading;
    _data['description'] = description;
    _data['about'] = about;
    _data['fine_print'] = finePrint;
    _data['terms_conditions'] = termsConditions;
    _data['category_id'] = categoryId;
    _data['address'] = address;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['start_price'] = startPrice;
    _data['deal_price'] = dealPrice;
    _data['deal_notes'] = dealNotes;
    _data['status'] = status;
    _data['business_logo'] = businessLogo;
    _data['deal_image'] = dealImage;
    _data['user_id'] = userId;
    _data['end_date'] = endDate;
    _data['is_featured'] = isFeatured;
    _data['tags'] = tags;
    _data['is_approved'] = isApproved;
    _data['purchased_count'] = purchasedCount;
    _data['is_trending'] = isTrending;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class FeaturedDeals {
  FeaturedDeals({
    required this.saladishyList,
    required this.candyVapeList,
    required this.loremIpsumList,
    required this.kwikFixList,
  });
  late final List<Saladishy> saladishyList;
  late final List<CandyVape> candyVapeList;
  late final List<LoremIpsum> loremIpsumList;
  late final List<KwikFix> kwikFixList;

  FeaturedDeals.fromJson(Map<String, dynamic> json) {
    saladishyList =
        List.from(json['Saladishy']).map((e) => Saladishy.fromJson(e)).toList();
    // candyVapeList = List.from(json['CandyVape']).map((e) => CandyVape.fromJson(e)).toList();
    // loremIpsumList = List.from(json['LoremIpsum']).map((e) => LoremIpsum.fromJson(e)).toList();
    // kwikFixList = List.from(json['KwikFix']).map((e) => KwikFix.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Saladishy'] = saladishyList.map((e) => e.toJson()).toList();
    // _data['CandyVape'] = candyVapeList.map((e) => e.toJson()).toList();
    // _data['LoremIpsum'] = loremIpsumList.map((e) => e.toJson()).toList();
    // _data['KwikFix'] = kwikFixList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Saladishy {
  Saladishy({
    required this.id,
    required this.businessName,
    required this.vendorId,
    required this.webAddress,
    required this.subHeading,
    required this.description,
    required this.about,
    required this.finePrint,
    required this.termsConditions,
    required this.categoryId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.startPrice,
    required this.dealPrice,
    this.dealNotes,
    required this.status,
    required this.businessLogo,
    required this.dealImage,
    required this.userId,
    required this.endDate,
    required this.isFeatured,
    required this.tags,
    required this.isApproved,
    required this.purchasedCount,
    required this.isTrending,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String businessName;
  late final int vendorId;
  late final String webAddress;
  late final String subHeading;
  late final String description;
  late final String about;
  late final String finePrint;
  late final int termsConditions;
  late final int categoryId;
  late final String address;
  late final double latitude;
  late final double longitude;
  late final String startPrice;
  late final String dealPrice;
  late final Null dealNotes;
  late final String status;
  late final String businessLogo;
  late final String dealImage;
  late final int userId;
  late final String endDate;
  late final int isFeatured;
  late final String tags;
  late final int isApproved;
  late final int purchasedCount;
  late final int isTrending;
  late final String createdAt;
  late final String updatedAt;

  Saladishy.fromJson(Map<String, dynamic> json) {
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['business_name'] = businessName;
    _data['vendor_id'] = vendorId;
    _data['web_address'] = webAddress;
    _data['sub_heading'] = subHeading;
    _data['description'] = description;
    _data['about'] = about;
    _data['fine_print'] = finePrint;
    _data['terms_conditions'] = termsConditions;
    _data['category_id'] = categoryId;
    _data['address'] = address;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['start_price'] = startPrice;
    _data['deal_price'] = dealPrice;
    _data['deal_notes'] = dealNotes;
    _data['status'] = status;
    _data['business_logo'] = businessLogo;
    _data['deal_image'] = dealImage;
    _data['user_id'] = userId;
    _data['end_date'] = endDate;
    _data['is_featured'] = isFeatured;
    _data['tags'] = tags;
    _data['is_approved'] = isApproved;
    _data['purchased_count'] = purchasedCount;
    _data['is_trending'] = isTrending;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class CandyVape {
  // ... (similar implementation as Saladishy)
}

class LoremIpsum {
  // ... (similar implementation as Saladishy)
}

class KwikFix {
  // ... (similar implementation as Saladishy)
}
