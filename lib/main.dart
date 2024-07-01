import 'package:create_pdf/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as f;
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MainApp());
}

class _PDFGenerator extends f.StatefulWidget {
  const _PDFGenerator();

  @override
  _PDFGeneratorState createState() => _PDFGeneratorState();
}

class _PDFGeneratorState extends f.State<_PDFGenerator> {
  

  Future<void> checkPermission() async {
    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      await openAppSettings();
    }
  }

  void showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Izin Diperlukan'),
          content: const Text(
              'Aplikasi memerlukan izin akses penyimpanan untuk menyimpan file. Silakan aktifkan di pengaturan.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
              child: const Text('Buka Pengaturan'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  // Future<void> savePDF() async {
  //   // await checkPermission();

  //   final status = await Permission.storage.status;

  //   // if (status.isGranted) {
  //   final directory = Directory('/storage/emulated/0/Download');
  //   final file = File('${directory.path}/resume.pdf');
  //   await file.writeAsBytes(await pdf.save());
  //   print('PDF saved at ${file.path}');
  //   // } else {
  //   //   print('Permission denied');
  //   // }
  // }

  @override
  f.Widget build(f.BuildContext context) {
    return f.Scaffold(
      appBar: f.AppBar(
        title: const f.Text('PDF Generator'),
      ),
      body: f.Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const f.Center(
            child: f.Text('Generating PDF...'),
          ),
          f.ElevatedButton(
            onPressed: () {
              // createPdf();
            },
            child: const Text('Download Pdf'),
          )
        ],
      ),
    );
  }
}
