import 'package:flutter/material.dart';

class GbvRecoveryCenter {
  final String name;
  final String contact;
  final String website;
  final String services;
  final String location;

  GbvRecoveryCenter(this.name, this.contact, this.website, this.services, this.location);
}

List<GbvRecoveryCenter> gbvRecoveryCenters = [
  // Established GBVRCs
  GbvRecoveryCenter(
    'The Nairobi Women\'s Hospital Gender Violence Recovery Centre (GVRC)',
    '+254 719 638 006 | 0709 667 000',
    'https://gvrc.or.ke/',
    'Medical treatment, psychosocial support, legal aid (referral)',
    'Nairobi (Ngong Road)',
  ),
  GbvRecoveryCenter(
    'Marie Stopes International Kenya',
    '+254 708 070 800',
    'https://mariestopes.org.ke/',
    'Medical services (including sexual assault care), counseling',
    'Multiple locations across Kenya (check website for details)',
  ),
  GbvRecoveryCenter(
    'Médecins Sans Frontières (MSF) - Lavender House Clinic',
    '+254 (0) 722 506 299', // Placeholder, replace with actual contact information
    'https://www.msf.org/kenya',
    'Medical treatment, psychosocial support for survivors of sexual violence',
    'Nairobi (Mathare)',
  ),
  GbvRecoveryCenter(
    'Kenya Red Cross Society - Sexual Assault Referral Centres (SARCs)',
    'National Toll-Free Hotline: 0800 720 700',
    'https://www.redcross.ke/',
    'Medical treatment, forensic examination, psychosocial support',
    'Multiple locations across Kenya (check website for details)',
  ),

  // Additional Support Organizations (consider adding more based on availability)
  GbvRecoveryCenter(
    'Enda Mali (End Violence Against Women)',
    '+254 718 113 888',
    'https://endamalikenya.org/',
    'Legal aid, psychosocial support for GBV survivors',
    'Nairobi',
  ),
  GbvRecoveryCenter(
    'SheSays Sacco Society',
    '+254 790 633 399', // Placeholder, replace with actual contact information
    'https://she-says.org/',
    'Financial empowerment programs for GBV survivors',
    'Nairobi',
  ),
  GbvRecoveryCenter(
    'Hope Restoration Kenya',
    '+254 722 713 003',
    'https://hoperestorationkenya.org/',
    'Safe houses, vocational training, and support for survivors',
    'Multiple locations across Kenya (check website for details)',
  ),
  GbvRecoveryCenter(
    'Utumishi Kwa Jamii (Service to the Community) - Uganja Empowerment Centre',
    '+254 722 478 883',
    'https://ukj.or.ke/',
    'Legal aid, medical referrals, psychosocial support for GBV survivors',
    'Nairobi',
  ),
];

class GVRCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('GBV Rescue Services'),
        backgroundColor: Colors.deepOrange, // Updated to teal color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: gbvRecoveryCenters.length,
                itemBuilder: (context, index) {
                  final center = gbvRecoveryCenters[index];
                  return InkWell(
                    onTap: () {
                      // Navigate to a new screen to display center details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GbvRecoveryCenterDetailsScreen(center: center),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
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
                                fontSize: 14.0,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddGbvRecoveryCenterScreen()),
          );
        },
        backgroundColor: Colors.deepOrange, //
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddGbvRecoveryCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add GBV Recovery Center'),
        backgroundColor: Colors.white, // Updated to teal color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contact',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Website',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Services',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to save the new center to the database
                Navigator.pop(context); // Return to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 
              ),
              child: Text('Save', style: TextStyle(color: Colors.deepOrange)),
            ),
          ],
        ),
      ),
    );
  }
}

class GbvRecoveryCenterDetailsScreen extends StatelessWidget {
  final GbvRecoveryCenter center;

  GbvRecoveryCenterDetailsScreen({required this.center});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(center.name),
        backgroundColor: Colors.teal, // Updated to teal color
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GVRCScreen(),
  ));
}
