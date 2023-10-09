import 'package:flutter/material.dart';
import 'package:flutter_googlesheets/pages/homepage.dart';
import 'package:gsheets/gsheets.dart';

//create credentials of the gsheets
const credentials = r'''
       {
  "type": "service_account",
  "project_id": "flutter-gsheets-400805",
  "private_key_id": "f5fa88b28152128c5ce7d2c29fe89a376ad254a8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCmzG0VMrFO8ZoR\n4GiPX5Dk0QR4EkJpv/uaxTGEMg0qt3MxeqNNyMCJERcafbIGT99/d+sOYyYSjXqY\n50WPJYaaCU7AhTgU0W/7EnDKRomgoJnypKJjuZy0CUb7Q5qcPyxzYoZhEDPHfxdT\niOCaG6iwzH8OVupLXtZqmDpwXPlO/pEA6eUEP9whe5m4esMrqSaASsw0io1gbyM7\nj7TYylIkKfqx6ISE8wJRTQDftE3frJuNX3snopouFXuuXiWT9rLTnjJ7YYz9ZRjs\nJkN3EYRvORotGhbZjgmHOyNp6KWWTDc190ihkYKq89cRcQvPW2ISOPBgoRUN9/m1\nTrEPdEATAgMBAAECgf8862zr0RfxPUyIOu31b3H8IFsBf6nB9dxvKpZrMdydPWNV\nLvV181xes188zau3onR+mc2/83Z0UDf2oIFHRu1iVQPuTLmu4M+FY7bOKfUaNY4E\nkRy+T4xsNPc3zfkqF+ikO9fYm5JNyp06ZUOjBXcXG5lMI3JvFLQ7Ol4dq9digf+S\nWwBBJPeM+cF0KK6zOvhzvjV7+SjkyHwKKBmY5U+LwWdH8nlDZ3/LxYy6elXSnkYB\nzPu+BfgL3ZVkkLhjuPbh/pHyEFiwW2cA7rJYL7d/XqyVl474vwxF8mWYAEFBsmTJ\nmpPLs2WlT5RrM1ImUVdNUxqhVzePP3REMrBEzfUCgYEA5vjJ/pDhC+p5rB6VRerv\nbF9MdhxBRlLxBEk41CuxJA6uVMke8K0OYwv0fLO7ZsxQoJej7XecrCgAWqjvYoRD\nN+VcrWOoEwPr5zbf8cFymDpNNUbg4gUK6rOsvhWRHoeejAdCnG6Cl/M5laHepn/A\nb9xVudjz7B8rC67wWTAGSOcCgYEAuN90lAK3MODrL4F9Etuo1QJKjvhM/X3n3bh0\nnOabfEaVzCQQETav4c2Ao6h5aazQFKCnC4QyhyjCol4CTXPLJyJj35wmMhhnJcTJ\nMXb3vShdDLmv6rsJOicUFy+otkQzauIMqF4atb9fSQVkkCjk5Y/JdaB4MA0Dpsx0\nXs8FTfUCgYB8wa8hkJHuRMVZwd8xN9gA+myrc1GSsaQ7g21ttPfmmQNzCntq1p7p\nwwBZBx/XQ87dH2tNDgmTN7wRPCSpWvWP0JTBlw2mz7xxVEOcKrhCH2OqvlEj5ENk\nSI6q0a1kBy8NRbKmGk7x0k+tUhSYbHK+OQ4Y52XBiYhPtDtggT8zywKBgQCLwLAZ\n62ucUYq4YMSx6sdYLuE57s4Umoca/wN4UIOdkKZQqbpTqOmQYo8qKIOPtQmfbkqY\n1Bh2QAPSRgqrjis2rDKfqSTenb/rtzT4ZZylq8ubgQtRAI7bHQt885QwJKJR3AwB\ngxHh7ocTZjY9HAzc1LNQbjws5smp38jgmtLBuQKBgQDGSCd9xoZPhcR8h3wR75vS\ngM4A6y2MzieNRUc5V1InqTnsiY7rzEnQafDZZfmIfdAm5+wL7W9UznN8evtWoEZC\npKd4u+tm8rFQ0IDrT61m1FNeaiOSGjsfsvvBuPUiaCR4hAjOoBuvKvMpeAami456\niKDkt35gnLj5SBMyGUwAVA==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@flutter-gsheets-400805.iam.gserviceaccount.com",
  "client_id": "104575031709564642988",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-gsheets-400805.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

//gsheets id
const _spreadsheetId = "1bM_Du76Zm-DkGCKw-ePFw4thT5bVYc9v0gk6Ho8h0nk";

void main() async {
  //initalize the google spreadsheets
  final gsheets = GSheets(credentials);

  //fetcheing the spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);

  //grabing the worksheet  by its tile
  var ws = ss.worksheetByTitle("worksheet1");

  //updating a cell
  await ws?.values.insertValue(20, column: 1, row: 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
