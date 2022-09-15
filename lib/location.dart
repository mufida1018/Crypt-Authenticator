import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class LocationApp extends StatefulWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  State<LocationApp> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var locationMessage = "";

  void getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition();
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  String qrCodeResult = "Not yet scanned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authenticator with Location"),
        backgroundColor: Color(0xFF161C40),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          SizedBox(
            height: 20.0,
          ),
          Text("Poistion: $locationMessage"),
          TextButton(
            onPressed: () {
              getCurrentLocation();
            },
            child: Text("Get Current Location"),
          ),
          Text(
            "Result",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            qrCodeResult,
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () async {
              var codeSanner = await BarcodeScanner.scan(); //barcode scnner
              setState(() {
                qrCodeResult = codeSanner.toString();
              });

              // try{
              //   BarcodeScanner.scan()    this method is used to scan the QR code
              // }catch (e){
              //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
              //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
              // }
            },
            child: Text(
              "Open Scanner",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0xFF161C40),
        children: [
          SpeedDialChild(
            child: Icon(Icons.qr_code_2_rounded),
            label: 'Scan a QR Code',
            backgroundColor: Colors.cyan,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.keyboard),
            label: 'Enter a key manually',
            backgroundColor: Colors.cyan,
          )
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
