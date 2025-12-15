import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class BrevoService {
  final String brevoApiKey =
      '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';

  Future<void> sendEmail({
    required String toEmail,
    required String subject,
    required String textContent,
  }) async {
    final url = Uri.parse('https://api.brevo.com/v3/smtp/email');
    final response = await http.post(
      url,
      headers: {
        'accept': 'application/json',
        'api-key': brevoApiKey,
        'content-type': 'application/json',
      },
      body: jsonEncode({
        'sender': {
          'name': 'Thameen App',
          'email': 'thameenapp10@gmail.com', // must be verified in Brevo
        },
        'to': [
          {'email': toEmail},
        ],
        'subject': subject,
        'textContent': textContent,
      }),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      log('Brevo Error: ${response.body}');
      throw Exception('Failed to send email');
    }
  }
}
