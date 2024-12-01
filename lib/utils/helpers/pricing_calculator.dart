
class TPricingCalculator {

  /// -- Menghitung harga berdasarkan pajak dan ongkir
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Menghitung Ongkos Kirim
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Menghitung Pajak
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // -- logic untuk mendapatkan pajak berdasarkan lokasi dari database atau API
    return 0.12;
  }

  static double getShippingCost(String location) {
    // -- logic untuk mendapatkan ongkos kirim berdasarkan lokasi dari database atau API
    return 10.0;
  }

  /// -- Menghitung harga berdasarkan pajak dan ongkir
  // static double calculateCartTotal(CartModel cart) {
  //  return cart.items.map((e) => e.price).fold(0, (previousPricem currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}