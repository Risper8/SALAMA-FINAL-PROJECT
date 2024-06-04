import 'package:flutter/material.dart';

class LegalAidOrganization {
  final String name;
  final String contact;
  final String website;
  final String services;
  final String location;

  LegalAidOrganization(this.name, this.contact, this.website, this.services, this.location);
}

List<LegalAidOrganization> legalAidOrganizations = [
  // Public Legal Aid Organizations
  LegalAidOrganization(
    'Federation of Women Lawyers (FIDA Kenya)',
    'Toll-free: 0800-720-500 | Nairobi: +254 20 2724579',
    'https://fida-kenya.org/',
    'Legal aid for GBV survivors, legal representation in court',
    'National (offices in Nairobi and Mombasa)',
  ),
  LegalAidOrganization(
    'Kenya National Commission on Human Rights (KNHCR)',
    '+254 20 255 8500',
    'https://www.knhcr.org/',
    'Human rights advocacy, legal representation in GBV cases (limited)',
    'National (offices in Nairobi and some counties)',
  ),

  // Private Legal Aid Organizations
  LegalAidOrganization(
    'International Justice Mission (IJM)',
    '+254 20 763 2000',
    'https://www.ijm.org/kenya',
    'Rescue operations, legal aid for victims of trafficking and violence',
    'Nairobi',
  ),
  LegalAidOrganization(
    'Her Justice',
    '+254 790 633 399', // Placeholder, replace with actual contact information
    'https://herjustice.co.ke/',
    'Legal aid for GBV survivors, access to justice initiatives',
    'Nairobi',
  ),
  LegalAidOrganization(
    'Enda Mali (End Violence Against Women) ',
    '+254 718 113 888',
    'https://endamalikenya.org/',
    'Legal aid, psychosocial support for GBV survivors',
    'Nairobi',
  ),
  LegalAidOrganization(
    'Justice Centres Network (JCN)',
    '+254 790 623 000',
    'https://jcnkenya.org/',
    'Legal aid for various issues, including GBV',
    'Multiple locations across Kenya (check website for details)',
  ),
];

class LegalAidScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Legal Aid Services'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Tap on an organization to delve deeper into the support they offer! ",
                    style:TextStyle(color: Colors.black)
                  ),
                  WidgetSpan(
                    child: Icon(Icons.touch_app, color: Colors.deepOrange), // Example emoji
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: legalAidOrganizations.length,
                itemBuilder: (context, index) {
                  final center = legalAidOrganizations[index];
                  return InkWell(
                    onTap: () {
                      // Navigate to a new screen to display center details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LegalAidOrganizationDetailsScreen(center: center)
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              center.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              center.services,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen for adding a new legal aid organization
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddLegalAidOrganizationScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class LegalAidOrganizationDetailsScreen extends StatelessWidget {
  final LegalAidOrganization center;

  LegalAidOrganizationDetailsScreen({required this.center});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(center.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50], // Set a background color
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact: ${center.contact}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Website: ${center.website}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Services: ${center.services}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Location: ${center.location}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddLegalAidOrganizationScreen extends StatefulWidget {
  @override
  _AddLegalAidOrganizationScreenState createState() => _AddLegalAidOrganizationScreenState();
}

class _AddLegalAidOrganizationScreenState extends State<AddLegalAidOrganizationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _servicesController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _websiteController.dispose();
    _servicesController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Legal Aid Organization'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(labelText: 'Contact'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _websiteController,
              decoration: InputDecoration(labelText: 'Website'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _servicesController,
              decoration: InputDecoration(labelText: 'Services'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Validate input and save the counseling center
                    final newCenter = LegalAidOrganization(
                      _nameController.text,
                      _contactController.text,
                      _websiteController.text,
                      _servicesController.text,
                      _locationController.text,
                    );
                    // Add the new center to the list
                    legalAidOrganizations.add(newCenter);
                    // Navigate back to the counseling screen
                    Navigator.pop(context);
                  },
                  child: Text('Save',  style:TextStyle(color: Colors.deepOrange)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
