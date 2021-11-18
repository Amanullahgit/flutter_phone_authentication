import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:supabase/supabase.dart' as supa;
import '../common/constants.dart';

class FileUploadScreen extends StatefulWidget {
  FileUploadScreen({Key key}) : super(key: key);

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  void _onFileUpload() async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    var pickedFile = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (pickedFile != null) {
      final file = File(pickedFile.files.first.path);

      await client.storage
          .from("resume")
          .upload(pickedFile.files.first.name, file)
          .then((value) {
        print(">>>>>>>>>>>>>>>>>>> $value");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resume"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    _onFileUpload();
                  },
                  child: Text("Upload"),
                )
              ]),
        ));
  }
}
