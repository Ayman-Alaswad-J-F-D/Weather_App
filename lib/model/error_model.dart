// {
// "cod": "404",
// "message": "city not found"
// }

class ErrorModel {
  String? cod, message;

  ErrorModel({this.cod, this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> error) {
    return ErrorModel(
      cod: error['cod'],
      message: error['message'],
    );
  }
}
