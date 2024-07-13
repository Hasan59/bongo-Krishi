class ServiceProvider {
  final String provideName;
  final double rating;
  final int pricePerHour;
  final String address;
  final double lat;
  final double long;
  final String email;
  final String phone;
  final String imageUrl;
  double? distance;

  ServiceProvider({
    required this.provideName,
    required this.rating,
    required this.pricePerHour,
    required this.address,
    required this.lat,
    required this.long,
    required this.email,
    required this.phone,
    required this.imageUrl,
    this.distance,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      provideName: json['ProvideName'],
      rating: json['rating'].toDouble(),
      pricePerHour: json['price_per_hour'],
      address: json['address'],
      lat: json['lat'].toDouble(),
      long: json['long'].toDouble(),
      email: json['email'],
      phone: json['phone'],
      imageUrl: json['imageUrl'],
    );
  }
}