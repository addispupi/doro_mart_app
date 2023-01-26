class ProductItem {
  String? prodTitle;
  String? prodImgUri;
  String? prodDesc;
  String? prodPrice;
  String? prodType;
  String? prodMenu;
  double? prodScore;
  String? prodIngredients;

  ProductItem(
      {this.prodTitle,
      this.prodImgUri,
      this.prodDesc,
      this.prodPrice,
      this.prodType,
      this.prodMenu,
      this.prodScore,
      this.prodIngredients});

  ProductItem.fromJson(Map<String, dynamic> json) {
    prodTitle = json['prodTitle'];
    prodImgUri = json['prodImgUri'];
    prodDesc = json['prodDesc'];
    prodPrice = json['prodPrice'];
    prodType = json['prodType'];
    prodMenu = json['prodMenu'];
    prodScore = json['prodScore'];
    prodIngredients = json['prodIngredients'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prodTitle'] = this.prodTitle;
    data['prodImgUri'] = this.prodImgUri;
    data['prodDesc'] = this.prodDesc;
    data['prodPrice'] = this.prodPrice;
    data['prodType'] = this.prodType;
    data['prodMenu'] = this.prodMenu;
    data['prodScore'] = this.prodScore;
    data['prodIngredients'] = this.prodIngredients;
    return data;
  }
}
