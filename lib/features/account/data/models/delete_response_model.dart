class DeleteResponseModel {
  int? code;
  String? message;

  DeleteResponseModel({this.code, this.message});

  DeleteResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}