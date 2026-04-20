// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PlantScannerCamera extends StatefulWidget {
  final double width;
  final double height;
  final Function(FFUploadedFile? imageFile, PlantType scanType)? onCapture;
  final VoidCallback? onInfoAction;
  final VoidCallback? onBack;
  final Color? primaryColor;
  final PlantType? initialType;

  const PlantScannerCamera({
    Key? key,
    required this.width,
    required this.height,
    this.onCapture,
    this.onInfoAction,
    this.onBack,
    this.primaryColor,
    this.initialType,
  }) : super(key: key);

  @override
  State<PlantScannerCamera> createState() => _PlantScannerCameraState();
}

class _PlantScannerCameraState extends State<PlantScannerCamera> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  int _selectedCameraIndex = 0;
  late PlantType _selectedType;
  bool _isCameraInitialized = false;
  final ImagePicker _imagePicker = ImagePicker();

  final List<Map<String, dynamic>> _scanTypes = [
    {'id': PlantType.plant, 'label': 'Plant'},
    {'id': PlantType.mushroom, 'label': 'Mushroom'},
    {'id': PlantType.weed, 'label': 'Weed'},
    {'id': PlantType.disease, 'label': 'Disease'},
    {'id': PlantType.toxicity, 'label': 'Toxicity'},
    {'id': PlantType.tree, 'label': 'Tree'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType ?? PlantType.tree;
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        await _setupCamera(_selectedCameraIndex);
      }
    } catch (e) {
      debugPrint('Kamera xatolik: $e');
    }
  }

  Future<void> _setupCamera(int cameraIndex) async {
    if (_cameras == null || _cameras!.isEmpty) return;

    if (_cameraController != null) {
      await _cameraController!.dispose();
    }

    _cameraController = CameraController(
      _cameras![cameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Kamera initialization xatolik: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;

    setState(() {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
      _isCameraInitialized = false;
    });

    await _setupCamera(_selectedCameraIndex);
  }

  Future<void> _capturePhoto() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      final XFile image = await _cameraController!.takePicture();
      final File imageFile = File(image.path);

      if (widget.onCapture != null) {
        final ffFile = FFUploadedFile(
          name: imageFile.path.split('/').last,
          bytes: await imageFile.readAsBytes(),
        );

        widget.onCapture!(ffFile, _selectedType);
      }
    } catch (e) {
      debugPrint('Rasm olishda xatolik: $e');
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (image != null) {
        final File imageFile = File(image.path);

        if (widget.onCapture != null) {
          final ffFile = FFUploadedFile(
            name: imageFile.path.split('/').last,
            bytes: await imageFile.readAsBytes(),
          );

          widget.onCapture!(ffFile, _selectedType);
        }
      }
    } catch (e) {
      debugPrint('Gallery xatolik: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Color get _primaryColor => widget.primaryColor ?? const Color(0xFFEAB308);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Camera Preview - To'liq ekran
            Positioned.fill(
              child: _isCameraInitialized && _cameraController != null
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _cameraController!.value.previewSize!.height,
                        height: _cameraController!.value.previewSize!.width,
                        child: CameraPreview(_cameraController!),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
            ),

            // Main Content with SafeArea
            SafeArea(
              child: Column(
                children: [
                  // Header - X va Rotate tugmalari
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // X (Back) button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close,
                                color: Colors.white, size: 28),
                            onPressed: () {
                              if (widget.onBack != null) {
                                widget.onBack!();
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),

                        // Rotate Camera button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.cameraswitch_outlined,
                                color: Colors.white, size: 24),
                            onPressed: _switchCamera,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Frame overlay - o'rtada
                  Expanded(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                        child: Stack(
                          children: [
                            // Top-left corner
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                            // Top-right corner
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    right: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                            // Bottom-left corner
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                            // Bottom-right corner
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    right: BorderSide(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Scan Types
                  Container(
                    color: Colors.black.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 12,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: _scanTypes.map((type) {
                            final isSelected = _selectedType == type['id'];

                            return Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedType = type['id'];
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? _primaryColor.withOpacity(0.12)
                                        : Colors.white.withOpacity(0.0),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.eco_rounded,
                                        size: 18,
                                        color: isSelected
                                            ? _primaryColor
                                            : Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        type['label'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? _primaryColor
                                              : Colors.white,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  // Bottom Controls
                  Container(
                    color: Colors.black.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Gallery button
                        GestureDetector(
                          onTap: _pickFromGallery,
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/default_gallery.webp',
                                ) as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // Capture button
                        GestureDetector(
                          onTap: _capturePhoto,
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Info button
                        GestureDetector(
                          onTap: widget.onInfoAction,
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// FLUTTERFLOW DA ISHLATISH UCHUN TO'LIQ QO'LLANMA
// ═══════════════════════════════════════════════════════════════════════════

/*
══════════════════════════════════════════════════════════════════════════════
1. DEPENDENCIES (pubspec.yaml ga qo'shing)
══════════════════════════════════════════════════════════════════════════════
dependencies:
  camera: ^0.10.5+5
  image_picker: ^1.0.4

══════════════════════════════════════════════════════════════════════════════
2. ANDROID PERMISSIONS (android/app/src/main/AndroidManifest.xml)
══════════════════════════════════════════════════════════════════════════════
<manifest> ichiga qo'shing:

<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

══════════════════════════════════════════════════════════════════════════════
3. iOS PERMISSIONS (ios/Runner/Info.plist)
══════════════════════════════════════════════════════════════════════════════
<dict> ichiga qo'shing:

<key>NSCameraUsageDescription</key>
<string>Rasmga olish uchun kamera kerak</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Rasm tanlash uchun gallery kerak</string>

══════════════════════════════════════════════════════════════════════════════
4. FLUTTERFLOW SETUP
══════════════════════════════════════════════════════════════════════════════

A) DATA SCHEMA - PlantType ENUM yaratish:
   Settings > Data Schema > Enums > + Create
   
   Name: PlantType
   Values:
   ┌──────────┐
   │ plant    │
   │ mushroom │
   │ weed     │
   │ disease  │
   │ toxicity │
   │ tree     │
   └──────────┘

B) APP STATE VARIABLES yaratish:
   Settings > App State > + Variable
   
   - capturedImagePath (String, Nullable)
   - scanType (PlantType, Nullable)

C) CUSTOM WIDGET yaratish:
   Developer Menu > Custom Code > Custom Widgets > + Create
   
   Widget Name: PlantScannerCamera
   
   Parameters:
   ┌─────────────┬───────────┬──────────┬──────────────┐
   │ Parameter   │ Type      │ Required │ Default      │
   ├─────────────┼───────────┼──────────┼──────────────┤
   │ width       │ double    │ ✓        │ -            │
   │ height      │ double    │ ✓        │ -            │
   │ initialType │ PlantType │          │ tree         │
   │ onCapture   │ Action    │          │ -            │
   │ onInfoAction│ Action    │          │ -            │
   │ onBack      │ Action    │          │ -            │
   │ primaryColor│ Color     │          │ Theme.primary│
   └─────────────┴───────────┴──────────┴──────────────┘

══════════════════════════════════════════════════════════════════════════════
5. WIDGET PARAMETRLARI TUSHUNTIRILISHI
══════════════════════════════════════════════════════════════════════════════

width & height:
  - FlutterFlow qoidasi bo'yicha required
  - double.infinity yoki MediaQuery dan foydalaning
  - Masalan: width = MediaQuery.of(context).size.width
            height = MediaQuery.of(context).size.height

initialType:
  - Camera ochilganda qaysi type default bo'lishini belgilaydi
  - Type: PlantType (enum)
  - Default: PlantType.tree
  - Masalan: initialType = PlantType.plant

onCapture:
  - Bu callback function 2 ta parametr qaytaradi:
    * imageFile (File?) - rasmning file'i
    * scanType (PlantType) - tanlangan tur (enum)
  
  - FlutterFlow da Action yarating:
    1. Action Flow > Add Action
    2. Update App State > capturedImagePath = imageFile.path
    3. Update App State > scanType = scanType (PlantType enum)
    4. Navigate to > ResultPage

onInfoAction:
  - Info tugmasi bosilganda ishga tushadi
  - Alert yoki boshqa UI ko'rsatish uchun

onBack:
  - X tugmasi bosilganda ishga tushadi
  - Navigate Back action yarating

primaryColor:
  - FFThemeSystem.primary dan avtomatik oladi
  - Yoki boshqa rang berish mumkin

══════════════════════════════════════════════════════════════════════════════
6. FLUTTERFLOW PAGE DA ISHLATISH
══════════════════════════════════════════════════════════════════════════════

Page Layout:
┌─────────────────────────────────────┐
│ PlantScannerCamera (Custom Widget) │
│                                     │
│ Parameters:                         │
│ • width: double.infinity            │
│ • height: double.infinity           │
│ • primaryColor: Theme.primary       │
│ • onCapture: [Action Flow]          │
│ • onInfoAction: [Action Flow]       │
│ • onBack: [Action Flow]             │
└─────────────────────────────────────┘

══════════════════════════════════════════════════════════════════════════════
7. onCapture ACTION FLOW MISOLI
══════════════════════════════════════════════════════════════════════════════

Action Flow yaratish (onCapture parametri uchun):

1. Backend Call > Custom Function (optional - rasmni process qilish)
   
2. Update App State:
   ┌────────────────────────────────────────────┐
   │ FFAppState().capturedImagePath =           │
   │   imageFile.path                           │
   └────────────────────────────────────────────┘
   
3. Update App State:
   ┌────────────────────────────────────────────┐
   │ FFAppState().scanType = scanType           │
   └────────────────────────────────────────────┘
   
4. Navigate To:
   ┌────────────────────────────────────────────┐
   │ Page: ResultPage                           │
   │ Parameters:                                │
   │  - imagePath: FFAppState().capturedImagePath│
   │  - type: FFAppState().scanType             │
   └────────────────────────────────────────────┘

══════════════════════════════════════════════════════════════════════════════
8. onCapture PARAMETRLARINI ISHLATISH
══════════════════════════════════════════════════════════════════════════════

FlutterFlow da onCapture actionda 2 ta parameter mavjud bo'ladi:

PARAMETER 1: imageFile (File?)
  - Type: File
  - Name: imageFile
  - Ishlatish: imageFile.path yoki imageFile ni to'g'ridan-to'g'ri

PARAMETER 2: scanType (PlantType)
  - Type: PlantType (ENUM)
  - Name: scanType
  - Mumkin bo'lgan qiymatlar: 
    PlantType.plant
    PlantType.mushroom
    PlantType.weed
    PlantType.disease
    PlantType.toxicity
    PlantType.tree

FlutterFlow Action Flow da ishlatish:
┌──────────────────────────────────────────────────────────┐
│ Action 1: Update App State                              │
│   Variable: capturedImagePath                           │
│   Value: imageFile.path                                 │
│                                                          │
│ Action 2: Update App State                              │
│   Variable: scanType                                    │
│   Value: scanType (PlantType enum)                      │
│                                                          │
│ Action 3: Navigate                                      │
│   To: ResultPage                                        │
│   Pass Parameters:                                      │
│     - imagePath: FFAppState().capturedImagePath         │
│     - type: FFAppState().scanType                       │
└──────────────────────────────────────────────────────────┘

══════════════════════════════════════════════════════════════════════════════
9. RESULT PAGE DA RASMNI KO'RSATISH
══════════════════════════════════════════════════════════════════════════════

Result Page Parameters:
  - imagePath (String)
  - type (PlantType enum)

Layout:
┌─────────────────────────────────────────┐
│ Image Widget                            │
│   Source: From Path                     │
│   Path: imagePath (page parameter)      │
│                                         │
│ Text Widget                             │
│   Text: "Turi: ${type.name}"            │
│   (enum.name plantType ni String qiladi)│
│                                         │
│ [Analyze Button]                        │
│   → Navigate to AI Analysis Page       │
└─────────────────────────────────────────┘

══════════════════════════════════════════════════════════════════════════════
10. TO'LIQ MISOL - BITTA PAGE SETUP
══════════════════════════════════════════════════════════════════════════════

CameraPage (yangi page yarating):

├─ PlantScannerCamera (Custom Widget)
│  ├─ width: MediaQuery.of(context).size.width
│  ├─ height: MediaQuery.of(context).size.height
│  ├─ primaryColor: Theme.primary
│  ├─ initialType: PlantType.tree (yoki istalgan boshqa type)
│  │
│  ├─ onCapture: [Action Flow]
│  │  ├─ [1] Update App State
│  │  │     └─ capturedImagePath = imageFile.path
│  │  ├─ [2] Update App State
│  │  │     └─ scanType = scanType (PlantType enum)
│  │  └─ [3] Navigate
│  │        └─ To: ResultPage
│  │
│  ├─ onInfoAction: [Action Flow]
│  │  └─ [1] Show Alert Dialog
│  │        ├─ Title: "Ma'lumot"
│  │        └─ Content: "Qo'shimcha ma'lumot..."
│  │
│  └─ onBack: [Action Flow]
│     └─ [1] Navigate Back

══════════════════════════════════════════════════════════════════════════════
11. ENUM BILAN ISHLASH
══════════════════════════════════════════════════════════════════════════════

PlantType enum qiymatlari:
┌────────────────────────────────────────────────┐
│ Dart kodi:        │ Display:                   │
├───────────────────┼────────────────────────────┤
│ PlantType.plant   │ "plant"                    │
│ PlantType.mushroom│ "mushroom"                 │
│ PlantType.weed    │ "weed"                     │
│ PlantType.disease │ "disease"                  │
│ PlantType.toxicity│ "toxicity"                 │
│ PlantType.tree    │ "tree"                     │
└────────────────────────────────────────────────┘

Enum ni String ga o'girish:
  scanType.name  →  "tree"

String ni Enum ga o'girish:
  PlantType.values.firstWhere((e) => e.name == "tree")

══════════════════════════════════════════════════════════════════════════════
ESLATMA: 
══════════════════════════════════════════════════════════════════════════════
- onCapture callback'da imageFile va scanType parametrlari avtomatik keladi
- Bu parametrlarni Action Flow ichida to'g'ridan-to'g'ri ishlatishingiz mumkin
- imageFile - rasmning File object'i (imageFile.path orqali path olasiz)
- scanType - PlantType enum (tree, plant, mushroom, weed, disease, toxicity)
- initialType - Kamera ochilganda default type (masalan PlantType.plant)
- scanType.name - enum ni String ga o'girish uchun
*/
