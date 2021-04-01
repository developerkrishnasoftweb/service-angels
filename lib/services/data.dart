class Data<T> {
  dynamic message;
  bool status;
  T data;
  Data({this.status, this.message, this.data});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['msg'],
      status: !(json['status'] == 'error'),
      data: json["data"],
    );
  }
}