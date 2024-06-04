import 'package:url_launcher/url_launcher.dart';

Future<void> _sendEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'example@email.com',
    queryParameters: {'subject': 'Hello from Salama!'},
  );

  if (await canLaunchUrl(emailUri.toString() as Uri)) {
    await launchUrl(emailUri.toString() as Uri);
  } else {
    throw 'Could not launch email app';
  }
}