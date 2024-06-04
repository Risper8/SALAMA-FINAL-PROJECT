import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // For all media picking
import 'report.dart';

void main() {
  runApp(MaterialApp(
    home: ReportIncidentScreen(),
    theme: ThemeData(
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.black,
    ),
  ));
}

class ReportIncidentScreen extends StatefulWidget {
  @override
  _ReportIncidentScreenState createState() => _ReportIncidentScreenState();
}

class _ReportIncidentScreenState extends State<ReportIncidentScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController(); // Location controller
  String _selectedViolenceType = 'None'; // Default value for violence type
  List<String> _violenceTypes = [
    'None',
    'Physical',
    'Sexual',
    'Emotional or Psychological',
    'Economic'
  ];
  String _selectedEvidence = 'None'; // Default value for evidence type
  List<String> _evidenceTypes = ['None', 'Image', 'Document', 'Video', 'Audio']; // evidence types

  String? _uploadedFilePath; // Store the path of the uploaded file

  // File extensions allowed for each evidence type
  Map<String, List<String>> _evidenceFileExtensions = {
    'Image': ['jpg', 'jpeg', 'png'],
    'Document': ['pdf', 'doc', 'docx'],
    'Video': ['mp4', 'avi', 'mov'],
    'Audio': ['mp3', 'wav', 'aac'],
  };

  // To store report ID
  String _reportId = '';

  // Placeholder report submission logic (replace with actual implementation)
  Future<void> _submitReport() async {
    if (_descriptionController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide description and email address.')),
      );
      return;
    }

    // Generate report ID (replace with actual implementation)
    _reportId = ReportId.generateReportId();

    String message = 'Report submitted successfully! Your report ID is: $_reportId';

    // Send incident report form to user's email (replace with actual email sending logic)
    // Example: sendEmailWithReportForm();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5), // Display for 5 seconds
      ),
    );

    // Clear form after successful submission
    setState(() {
      _descriptionController.text = '';
      _emailController.text = '';
      _locationController.text = '';
      _selectedViolenceType = 'None'; // Reset violence type
      _selectedEvidence = 'None'; // Reset evidence type
    });
  }

  void _pickMedia() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Allow only multiple file selection
      type: FileType.custom, // Dynamically filter based on type
      allowedExtensions: _evidenceFileExtensions[_selectedEvidence], // Filter based on the type selected
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _uploadedFilePath = result.files.first.path; // Store the path of the uploaded file
      });
      // Do something with the picked file
    } else {
      print('User canceled the picker');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Report GBV Incident'),
        backgroundColor: Colors.deepOrange,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About the Incident Report Form:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              Text(
                'Please fill out the incident report form below:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              Text(
                'Email Address *:', // Mandatory field indicator
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextField(
                style: TextStyle(color: Colors.white), // Set text color to white
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                ),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              Text(
                'Location (Postal Address) *:', // Mandatory field indicator
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  hintText: 'Enter your postal address',
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                ),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              Text(
                'Describe the incident *:', // Mandatory field indicator
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextField(
                style: TextStyle(color: Colors.white), // Set text color to white
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Provide details of the assault or abuse...',
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                ),
                maxLines: null, // Allow multiple lines for description
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              Text(
                'Select type of violence *:', // Mandatory field indicator
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              DropdownButtonFormField<String>(
                value: _selectedViolenceType,
                 dropdownColor: Colors.black,
                hint: const Text('Choose violence type'),
                items: _violenceTypes.map((violenceType) => DropdownMenuItem<String>(
                  value: violenceType,
                  child: Text(violenceType, style: TextStyle(color: Colors.white))
                )).toList(),
                onChanged: (value) => setState(() => _selectedViolenceType = value!),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              Text(
                'Select evidence type *:', // Mandatory field indicator
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              DropdownButtonFormField<String>(
                value: _selectedEvidence,
                dropdownColor: Colors.black,
                hint: const Text('Choose evidence type'),
                items: _evidenceTypes.map((evidenceType) => DropdownMenuItem<String>(
                  value: evidenceType,
                  child: Text(evidenceType, style: TextStyle(color: Colors.white)),
                )).toList(),
                onChanged: (value) => setState(() => _selectedEvidence = value!),
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              ElevatedButton.icon(
                onPressed: _pickMedia,
                icon: Icon(Icons.upload_file),
                label: Text('Upload Evidence', style: TextStyle(color: Colors.black))
              ),
              const SizedBox(height: 16.0), // Spacing between fields
              // Display the uploaded file path if available
              if (_uploadedFilePath != null)
                Text(
                  'Uploaded File: $_uploadedFilePath',
                  style: TextStyle(color: Colors.black),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _submitReport,
                    child: const Text('Submit Report', style: TextStyle(color: Colors.black))
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
