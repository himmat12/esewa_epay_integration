class EsewaPayment {
  String? productId;
  String? productName;
  String? productPrice;
  String? callbackUrl;

  EsewaPayment({
    this.productId,
    this.productName,
    this.productPrice,
    this.callbackUrl,
  });

  factory EsewaPayment.fromJson(Map<String, dynamic> data) => EsewaPayment(
        productId: data["product_id"],
        productName: data["product_name"],
        productPrice: data["product_price"],
        callbackUrl: data["callback_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "callback_url": callbackUrl,
      };
}
