class Dog {
  Dog({
    required this.status,
    required this.message,
  });
  late final String status;
  late final List<String> message;

  Dog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = List.castFrom<dynamic, String>(json['message']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
