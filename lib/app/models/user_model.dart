import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:paybox/app/models/parent/model.dart';

import '../services/setting_service.dart';
import 'media_model.dart';

class User extends Model {
  String? name;
  String? email;
  String? password;
  //newchanges//
  String? newpassword;
  String? confirmpassword;
  String? code;
  Media? avatar;
  String? apiToken;
  String? deviceToken;
  // String? phoneNumber;
  String? telephone;

  bool? verifiedPhone;
  String? verificationId;
  String? address;
  String? bio;

  bool? auth;

  User(
      {this.name,
      this.email,
      this.password,
      this.newpassword,
      this.confirmpassword,
      this.code,
      this.apiToken,
      this.deviceToken,
      // this.phoneNumber,
      this.telephone,
      this.verifiedPhone,
      this.verificationId,
      this.address,
      this.bio,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    apiToken = json['token'];
    name = json['data']['name'];
    email = json['data']['email'];
    // avatar = json['data']['image'];
    // name = stringFromJson(json, 'name');
    // email = stringFromJson(json, 'email');
    // apiToken = stringFromJson(json, 'api_token');
    // deviceToken = stringFromJson(json, 'device_token');
    // phoneNumber = stringFromJson(json, 'phone_number');
    // verifiedPhone = boolFromJson(json, 'phone_verified_at');
    avatar = mediaFromJson(json, 'avatar');
    // avatar = mediaFromJson(json, 'avatar');
    // auth = boolFromJson(json, 'auth');
    // try {
    //   address = json['custom_fields']['address']['view'];
    // } catch (e) {
    //   address = stringFromJson(json, 'address');
    // }
    // try {
    //   bio = json['custom_fields']['bio']['view'];
    // } catch (e) {
    //   bio = stringFromJson(json, 'bio');
    // }
    super.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    // data['code'] = code;
    if (password != null && password != '') {
      data['password'] = password;
    }
    // data['api_token'] = apiToken;
    // if (deviceToken != null) {
    //   data["device_token"] = deviceToken;
    // }
    data["telephone"] = telephone;
    // data["phone_number"] = phoneNumber;
    // if (verifiedPhone != null && verifiedPhone!) {
    //   data["phone_verified_at"] = DateTime.now().toLocal().toString();
    // }
    // data["address"] = address;
    // data["bio"] = bio;
    // if (avatar != null && Uuid.isUuid(avatar!.id!)) {
    //   data['avatar'] = avatar!.id;
    // }
    // if (avatar != null) {
    //   data["media"] = [avatar!.toJson()];
    // }
    // data['auth'] = auth;
    return data;
  }

  Map toRestrictMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["email"] = email;
    map["name"] = name;
    map["thumb"] = avatar!.thumb;
    map["device_token"] = deviceToken;
    return map;
  }

  PhoneNumber getPhoneNumber() {
    if (telephone != null) {
      telephone = telephone!.replaceAll(' ', '');
      String dialCode1 = telephone!.substring(1, 2);
      String dialCode2 = telephone!.substring(1, 3);
      String dialCode3 = telephone!.substring(1, 4);
      for (int i = 0; i < countries.length; i++) {
        if (countries[i].dialCode == dialCode1) {
          return PhoneNumber(
              countryISOCode: countries[i].code,
              countryCode: dialCode1,
              number: telephone!.substring(2));
        } else if (countries[i].dialCode == dialCode2) {
          return PhoneNumber(
              countryISOCode: countries[i].code,
              countryCode: dialCode2,
              number: telephone!.substring(3));
        } else if (countries[i].dialCode == dialCode3) {
          return PhoneNumber(
              countryISOCode: countries[i].code,
              countryCode: dialCode3,
              number: telephone!.substring(4));
        }
      }
    }
    return PhoneNumber(
        countryISOCode:
            Get.find<SettingsService>().setting.value.defaultCountryCode!,
        countryCode: '1',
        number: '');
  }

  @override
  bool operator ==(Object? other) =>
      super == other &&
      other is User &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      email == other.email &&
      password == other.password &&
      avatar == other.avatar &&
      apiToken == other.apiToken &&
      deviceToken == other.deviceToken &&
      telephone == other.telephone &&
      verifiedPhone == other.verifiedPhone &&
      verificationId == other.verificationId &&
      address == other.address &&
      bio == other.bio &&
      auth == other.auth;

  @override
  int get hashCode =>
      super.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      avatar.hashCode ^
      apiToken.hashCode ^
      deviceToken.hashCode ^
      telephone.hashCode ^
      verifiedPhone.hashCode ^
      verificationId.hashCode ^
      address.hashCode ^
      bio.hashCode ^
      auth.hashCode;
}
