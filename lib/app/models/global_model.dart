import 'package:paybox/app/models/parent/model.dart';

class Global extends Model {
  late String? mockBaseUrl;
  late String? laravelBaseUrl;
  late String? apiPath;
  late String? dealApiPath;
  late String? deleteUserApiPath;
  late int received;
  late int accepted;
  late int onTheWay;
  late int ready;
  late int inProgress;
  late int done;
  late int failed;

  Global(
      {this.mockBaseUrl,
      this.laravelBaseUrl,
      this.apiPath,
      this.dealApiPath,
      this.deleteUserApiPath});

  Global.fromJson(Map<String, dynamic> json) {
    mockBaseUrl = json['mock_base_url'].toString();
    laravelBaseUrl = json['laravel_base_url_live'].toString();
    apiPath = json['api_path'].toString();
    dealApiPath = json['deal_api_path'].toString();
    deleteUserApiPath = json['delete_user_api_path'].toString();
    received = intFromJson(json, 'received');
    accepted = intFromJson(json, 'accepted');
    onTheWay = intFromJson(json, 'on_the_way');
    ready = intFromJson(json, 'ready');
    inProgress = intFromJson(json, 'in_progress');
    done = intFromJson(json, 'done');
    failed = intFromJson(json, 'failed');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mock_base_url'] = mockBaseUrl;
    data['laravel_base_url'] = laravelBaseUrl;
    data['api_path'] = apiPath;
    data['deal_api_path'] = dealApiPath;
    data['delete_user_api_path'] = deleteUserApiPath;
    return data;
  }
}
