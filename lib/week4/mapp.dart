import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart' as prefix;
import 'package:google_maps_flutter/google_maps_flutter.dart';

const googleAPIkey = "AIzaSyDJdsa3g6TdmOCfwJs2A5_xZbTWpKjezCk";

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(21.24149, 72.88487), zoom: 15);
  late GoogleMapController mapController;

  Position? _currentPosition;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final destinationAddressFocusNode = FocusNode();

  // String location = "Search Location";
  Set<Marker> markers = {};

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  prefix.GoogleMapsPlaces _places =
      prefix.GoogleMapsPlaces(apiKey: googleAPIkey);

  late prefix.PlaceDetails arrival;
  late prefix.PlaceDetails dire;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method for retrieving the current location

  @override
  void initState() {
    super.initState();
    //_determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.satellite,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              onTap: multmrk,
            ),
            // Show zoom buttons
            // SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         ClipOval(
            //           child: Material(
            //             color: Colors.blue.shade100, // button color
            //             child: InkWell(
            //               splashColor: Colors.blue, // inkwell color
            //               child: SizedBox(
            //                 width: 50,
            //                 height: 50,
            //                 child: Icon(Icons.add),
            //               ),
            //               onTap: () {
            //                 mapController.animateCamera(
            //                   CameraUpdate.zoomIn(),
            //                 );
            //               },
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 20),
            //         ClipOval(
            //           child: Material(
            //             color: Colors.blue.shade100, // button color
            //             child: InkWell(
            //               splashColor: Colors.blue, // inkwell color
            //               child: SizedBox(
            //                 width: 50,
            //                 height: 50,
            //                 child: Icon(Icons.remove),
            //               ),
            //               onTap: () {
            //                 mapController.animateCamera(
            //                   CameraUpdate.zoomOut(),
            //                 );
            //               },
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Places',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 15,
                            child: TextField(
                              onTap: () async {
                                prefix.Prediction? p =
                                    await PlacesAutocomplete.show(
                                        context: context,
                                        apiKey: googleAPIkey,
                                        mode: Mode.overlay,
                                        language: "en",
                                        types: [],
                                        strictbounds: false,
                                        components: [
                                          prefix.Component(
                                              prefix.Component.country, "ind")
                                        ]);
                                displaystartlocation(p!);
                              },
                              focusNode: startAddressFocusNode,
                              controller: startAddressController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(Icons.looks_two),
                                labelText: "Search other Location",
                                suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 15,
                            child: TextField(
                              onTap: () async {
                                prefix.Prediction? p =
                                    await PlacesAutocomplete.show(
                                        context: context,
                                        apiKey: googleAPIkey,
                                        mode: Mode.overlay,
                                        language: "en",
                                        types: [],
                                        strictbounds: false,
                                        components: [
                                          prefix.Component(
                                              prefix.Component.country, "ind")
                                        ]);
                                displayPredictionArrival(p!);
                              },
                              focusNode: destinationAddressFocusNode,
                              controller: destinationAddressController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(Icons.looks_two),
                                labelText: "Search other Location",
                                suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),m . .
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white70, // button color
                      child: InkWell(
                        splashColor: Colors.white70, // inkwell color
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: SizedBox(child: Icon(Icons.my_location)),
                        ),
                        onTap: () async {
                          _currentPosition = await _determinePosition();
                          mapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(_currentPosition!.latitude,
                                      _currentPosition!.longitude),
                                  zoom: 14)));
                          markers.clear();
                          polylines.clear();

                          markers.add(Marker(
                              markerId: MarkerId('currentLocation'),
                              position: LatLng(_currentPosition!.latitude,
                                  _currentPosition!.longitude)));

                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> displayPredictionArrival(prefix.Prediction p) async {
    if (p != null) {
      prefix.PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      dire = detail.result;
      destinationAddressController.text = detail.result.name;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 10.0)),
      );
      markers.add(Marker(
        markerId: MarkerId('DirectionMarker'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: detail.result.name,
        ),
      ));

      getDirections();
      setState(() {});
    }
  }

  Future<void> displaystartlocation(prefix.Prediction p) async {
    if (p != null) {
      prefix.PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      arrival = detail.result;
      startAddressController.text = detail.result.name;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 10.0)),
      );

      markers.add(Marker(
        markerId: MarkerId('arrivalMarker'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: detail.result.name,
        ),
      ));

      getDirections();
      setState(() {});
    }
  }

  Future<void> getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIkey,
      PointLatLng(
          arrival.geometry!.location.lat, arrival.geometry!.location.lng),
      PointLatLng(dire.geometry!.location.lat, dire.geometry!.location.lng),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
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

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    _currentPosition = await Geolocator.getCurrentPosition();

    return _currentPosition;
  }

  void multmrk(LatLng argument) {
    setState(() {
      markers.add(
        Marker(markerId: MarkerId(argument.toString()), position: argument),
      );
    });
  }
}
