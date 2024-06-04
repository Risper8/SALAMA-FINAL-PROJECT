import 'package:uuid/uuid.dart';

class ReportId {
  // Method to generate a unique report ID
  static String generateReportId() {
    // Use UUID (Universally Unique Identifier) for generating unique IDs
    var uuid = Uuid();
    return uuid.v4();
  }
}
