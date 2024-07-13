import 'dart:async';
import 'dart:convert';
import 'package:bongokrishi/View/Category/providerMapView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

class ServiceProvidersPage extends StatefulWidget {
  @override
  _ServiceProvidersPageState createState() => _ServiceProvidersPageState();
}

class _ServiceProvidersPageState extends State<ServiceProvidersPage> {
  List<ServiceProvider> serviceProviders = [];
  bool isLoading = true;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
      fetchServiceProviders();
    } catch (e) {
      print("Error getting location: $e");
      fetchServiceProviders();
    }
  }

  Future<void> fetchServiceProviders() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Hasan59/JSON-file/main/providerDataset'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        serviceProviders = data
            .map((item) => ServiceProvider.fromJson(item))
            .toList();
        if (_currentPosition != null) {
          for (var provider in serviceProviders) {
            provider.distance = Geolocator.distanceBetween(
              _currentPosition!.latitude,
              _currentPosition!.longitude,
              provider.lat,
              provider.long,
            ) /
                1000; // Convert to km
          }
          serviceProviders.sort((a, b) => a.distance!.compareTo(b.distance!));
        }
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load service providers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Service Providers'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          _buildLocationInfo(),
          _buildViewOnMapButton(),
          Expanded(child: _buildProviderList()),
        ],
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInfoRow(Icons.location_on, 'My Location',
              _currentPosition != null ? 'Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, Long: ${_currentPosition!.longitude.toStringAsFixed(4)}' : 'Unknown'),
          SizedBox(height: 8),
          _buildInfoRow(Icons.near_me, 'Near by',
              '${serviceProviders.isNotEmpty ? serviceProviders.first.distance?.toStringAsFixed(2) ?? "Unknown" : "Unknown"} km'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        SizedBox(width: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(' : '),
        Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  Widget _buildViewOnMapButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        icon: Icon(Icons.map),
        label: Text('View on Map'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(
                serviceProviders: serviceProviders,
                currentPosition: _currentPosition,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget _buildProviderList() {
    return ListView.builder(
      itemCount: serviceProviders.length,
      itemBuilder: (context, index) {
        return _buildProviderCard(serviceProviders[index]);
      },
    );
  }

  Widget _buildProviderCard(ServiceProvider provider) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(provider.imageUrl),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(provider.provideName, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(provider.address),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(' ${provider.rating.toStringAsFixed(1)}'),
                      SizedBox(width: 8),
                      Icon(Icons.location_on, color: Colors.blue, size: 18),
                      Text(' ${provider.distance?.toStringAsFixed(2) ?? "Unknown"} km'),
                    ],
                  ),
                  Text('Service Fee: ${provider.pricePerHour} Tk/hour',
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}