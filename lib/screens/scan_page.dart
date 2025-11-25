import 'package:flutter/material.dart';
import 'package:foodify/const/constants.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> with SingleTickerProviderStateMixin {
  MobileScannerController cameraController = MobileScannerController();
  bool scanning = false;

  // For moving scan line
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Camera view
          if (scanning)
            MobileScanner(
              controller: cameraController,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  final String? code = barcode.rawValue;
                  debugPrint("Scanned: $code");
                }
                cameraController.stop();
                setState(() {
                  scanning = false;
                });
              },
            ),

          // Overlay
          if (scanning)
            Center(
              child: Stack(
                children: [
                  // Transparent overlay
                  Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  // Cut-out scanning frame
                  Positioned(
                    left: 40,
                    right: 40,
                    top: size.height * 0.2,
                    bottom: size.height * 0.2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.greenAccent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  // Moving scan line
                  Positioned(
                    left: 40,
                    right: 40,
                    top: size.height * 0.2 +
                        (size.height * 0.6) * _animationController.value,
                    child: Container(
                      height: 2,
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),

          // Top buttons
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(Icons.close, color: Constants.primaryColor),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(Icons.share, color: Constants.primaryColor),
                ),
              ],
            ),
          ),

          // Tap to start scanning
          if (!scanning)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => scanning = true),
                    child: Image.asset("assets/images/qr-code.png", width: 250),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Click To Scan",
                    style: TextStyle(
                      color: Constants.primaryColor.withOpacity(0.8),
                      fontFamily: "QuickBold",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
