import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/send_email.dart';
import 'package:http/http.dart';

class EmailService extends ChangeNotifier {
  Future<void> sendEmail(SendEmail newEmail) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(newEmail);
    var url = Uri.parse('${dotenv.env['EMAIL_URL']}');
    await post(
      url,
      headers: headers,
      body: jsEncode,
    );
    notifyListeners();
  }
}
