import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

Future<List<List<dynamic>>> parseCsv(String filePath) async {
  final input = File(filePath).openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(const CsvToListConverter())
      .toList();

  // Print the rows
  for (var row in fields) {
    print('$row \n\n\n\n');
  }
  return fields;
}

void main() {
  parseCsv('/home/Ebad-ur-Rehman/Downloads/12-December-2024 - 08-27-48 PM.csv');
}
