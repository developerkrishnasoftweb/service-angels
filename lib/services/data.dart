class Data<T> {
  dynamic message;
  dynamic parameter;
  bool status;
  T data;
  Data({this.status, this.message, this.data, this.parameter});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      parameter: json['parameter'],
      message: json['msg'],
      status: !(json['status'] == 'error'),
      data: json["data"],
    );
  }
}