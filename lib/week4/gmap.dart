import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as prefix;
import 'package:location/location.dart';
import 'dart:math';

class gmap extends StatefulWidget {
  const gmap({Key? key}) : super(key: key);

  @override
  State<gmap> createState() => _gmapState();
}

class _gmapState extends State<gmap> {
  mapcreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Location currentLocation = Location();
  Set<Marker> markers = {};

  String location = "Search Location";
  String googleAPIkey = "AIzaSyDJdsa3g6TdmOCfwJs2A5_xZbTWpKjezCk";
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(28.644800, 77.216721);
  LatLng endLocation = LatLng(27.6875436, 85.2751138);

  PolylinePoints polylinePoints = PolylinePoints();

  Set<Marker> mymarker = Set();
  Map<PolylineId, Polyline> polylines = {};

  double distance = 0.0;

  void getLocation() async {
    var lct = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        mymarker.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      infoWindow: InfoWindow(
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: InfoWindow(
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    getDirections();

    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIkey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
    });

    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            zoomControlsEnabled: true,
            mapType: MapType.satellite,
            initialCameraPosition:
                CameraPosition(target: startLocation, zoom: 11),
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            polylines: Set<Polyline>.of(polylines.values),
            markers: mymarker,
            onTap: abc,
          ),
          Positioned(
            top: 10,
            child: InkWell(
                onTap: () async {
                  var place = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: googleAPIkey,
                      mode: Mode.overlay,
                      types: [],
                      strictbounds: false,
                      components: [
                        prefix.Component(prefix.Component.country, 'ind')
                      ],
                      onError: (err) {
                        print(err);
                      });
                  if (place != null) {
                    setState(() {
                      location = place.description.toString();
                    });
                    final plist = prefix.GoogleMapsPlaces(
                      apiKey: googleAPIkey,
                      apiHeaders: await GoogleApiHeaders().getHeaders(),
                    );
                    String placeid = place.placeId ?? "0";
                    final detail = await plist.getDetailsByPlaceId(placeid);
                    final geometry = detail.result.geometry!;
                    final lat = geometry.location.lat;
                    final lang = geometry.location.lng;
                    var newlatlang = LatLng(lat, lang);

                    mapController?.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(target: newlatlang, zoom: 27)));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width - 40,
                        child: ListTile(
                          title: Text(
                            "Search Location",
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: Icon(Icons.search),
                          dense: true,
                        )),
                  ),
                )),
          ),
          Positioned(
              bottom: 200,
              left: 50,
              child: Container(
                  child: Card(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "Total Distance: " +
                            distance.toStringAsFixed(2) +
                            " KM",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => getLocation(),
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }

  void abc(LatLng argument) {
    setState(() {
      mymarker.add(
          Marker(markerId: MarkerId(argument.toString()), position: argument));
    });
  }
}
