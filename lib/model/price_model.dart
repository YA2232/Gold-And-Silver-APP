class PriceModel {
  String? goldPrice;
  String? silverPrice;
  PriceModel({this.goldPrice, this.silverPrice});
  factory PriceModel.fromJson(
      Map<String, dynamic> goldData, Map<String, dynamic> silverData) {
    return PriceModel(
      goldPrice: goldData['price'].toString(),
      silverPrice: silverData['price'].toString(),
    );
  }
}
