class Data{

  final List<dynamic> data;
   Data({this.data});
   factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: json['data'],
    );
  }
}