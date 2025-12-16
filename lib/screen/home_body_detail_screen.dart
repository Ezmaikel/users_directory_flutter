import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:users_directory_flutter/data/model/Users.dart';

class homeBodyDetailScreen extends StatefulWidget {
  final Users user;
  const homeBodyDetailScreen({super.key, required this.user});

  @override
  State<homeBodyDetailScreen> createState() => _homeBodyDetailScreenState();
}

class _homeBodyDetailScreenState extends State<homeBodyDetailScreen> {
  GoogleMapController? _controller;
  @override
  Widget build(BuildContext context) {
    final Set<Marker> _marker = {
      Marker(
        markerId: MarkerId(widget.user.userName),
        position: LatLng(
          double.parse(widget.user.address!.geo!.lat),
          double.parse(widget.user.address!.geo!.lng),
        ),
        infoWindow: InfoWindow(title: widget.user.name),
      ),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          flex: 1,
          child: Column(
            children: [
              Row(
                children: [
                  Text("N° de Identificacion:"),
                  SizedBox(width: 12),
                  Text(
                    widget.user.id.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Nombre de Usuario:"),
                  SizedBox(width: 12),
                  Text(
                    widget.user.userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Correo electronico:"),
                  SizedBox(width: 12),
                  Text(
                    widget.user.email,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dirección",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text("Calle:"),
                          SizedBox(width: 12),
                          Text(
                            widget.user.address!.street,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Suite:"),
                          SizedBox(width: 12),
                          Text(
                            widget.user.address!.suite,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Ciudad:"),
                          SizedBox(width: 12),
                          Text(
                            widget.user.address!.city,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Codigo Postal:"),
                          SizedBox(width: 12),
                          Text(
                            widget.user.address!.zipcode,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      double.parse(widget.user.address!.geo!.lat),
                      double.parse(widget.user.address!.geo!.lng),
                    ),
                    zoom: 10,
                  ),
                  onMapCreated: (controller) {
                    _controller = controller;
                  },
                  markers: _marker,
                  mapType: MapType.hybrid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
