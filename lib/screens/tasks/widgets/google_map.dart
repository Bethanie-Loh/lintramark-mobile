import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatefulWidget {
  const MapComponent({super.key});

  @override
  MapComponentState createState() => MapComponentState();
}

class MapComponentState extends State<MapComponent> {
  late GoogleMapController _mapController;

  final LatLng _center = const LatLng(5.4454631301094345, 100.25707948181305);

  final Map<String, Polygon> _polygons = {
    'zoneB': Polygon(
      polygonId: const PolygonId('zoneB'),
      points: const [
        LatLng(5.4457, 100.2568),
        LatLng(5.4457, 100.2575),
        LatLng(5.44452, 100.2575),
        LatLng(5.44452, 100.2568),
      ],
      fillColor: Colors.yellow.withOpacity(0.4),
      strokeColor: Colors.yellow,
      strokeWidth: 2,
    ),
  };

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('userA1'),
      position: LatLng(5.4455, 100.257),
      infoWindow: InfoWindow(title: 'You are here now'),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 18.0,
        ),
        mapType: MapType.satellite,
        polygons: _polygons.values.toSet(),
        markers: _markers,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
