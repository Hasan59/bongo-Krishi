
import 'package:bongokrishi/View/Category/categoryDetails.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  final List<ServiceProvider> serviceProviders;
  final Position? currentPosition;

  MapScreen({required this.serviceProviders, this.currentPosition});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  ServiceProvider? _selectedProvider;

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  void _createMarkers() {
    _markers.clear();
    for (var provider in widget.serviceProviders) {
      _markers.add(
        Marker(
          markerId: MarkerId(provider.provideName),
          position: LatLng(provider.lat, provider.long),
          infoWindow: InfoWindow(title: provider.provideName),
          onTap: () {
            setState(() {
              _selectedProvider = provider;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Providers Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.currentPosition?.latitude ?? widget.serviceProviders[0].lat,
                widget.currentPosition?.longitude ?? widget.serviceProviders[0].long,
              ),
              zoom: 12,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          if (_selectedProvider != null)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_selectedProvider!.provideName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 8),
                      Text(_selectedProvider!.address),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(' ${_selectedProvider!.rating.toStringAsFixed(1)}'),
                          SizedBox(width: 16),
                          Icon(Icons.attach_money, color: Colors.green),
                          Text('${_selectedProvider!.pricePerHour} Tk/hour'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 8),
                          Text(_selectedProvider!.phone),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 8),
                          Text(_selectedProvider!.email),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}