import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.custom, allowedExtensions: ['csv', 'xlsx']);

  return result?.files.single.path;
}

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Data')),
        body: Text(pickFile().toString()));
  }
}
