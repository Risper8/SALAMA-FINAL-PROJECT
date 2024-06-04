import 'package:flutter/material.dart';

class CounsellingCenter {
  final String name;
  final String contact;
  final String website;
  final String services;
  final String location;

  CounsellingCenter(this.name, this.contact, this.website, this.services, this.location);
}

List<CounsellingCenter> counsellingCenters = [
  CounsellingCenter(
    'National Gender and Equality Commission (NGEC)',
    '+254 709 375 100 or 0800 720187',
    'https://www.gender.go.ke/',
    'GBV support, legal aid, counseling',
    'Multiple(Nairobi, Kisumu, Nakuru, Malindi, Kitui, Isiolo and Garissa)',
  ),
  CounsellingCenter(
    'Ministry of Health - Mental Health Unit',
    '+254-20-2717077 or  ps.medical@health.go.ke',
    'https://health.go.ke/mental-health/',
    'Mental health services, referrals',
    'National (Ministry headquarters likely in Nairobi)',
  ),
  CounsellingCenter(
    'Cognitive Behavioural Therapy Kenya (CBT Kenya)',
    '+254 739 935 333/+254 756 454 585, info@cbtkenya.org',
    'https://www.cbtkenya.org/',
    'CBT therapy, anxiety and depression treatment',
    'Nairobi',
  ),
  CounsellingCenter(
    'Tumaini Counselling Centre',
    'clinicalasst.ac@aimint.org',
    'https://tumainicounselling.net/',
    'Individual therapy, couples counseling, child and adolescent counseling',
    'Nairobi (Karen)',
  ),
  CounsellingCenter(
    'Psychologist Rechael Mbugwa',
    '+254 728 284187, info@psychologistrechaelmbugwa.com',
    'https://psychologistrechaelmbugwa.com/',
    'Individual therapy, couples counseling, trauma counseling',
    'Nairobi',
  ),
  CounsellingCenter(
    'Giving Hope Counseling Services',
    '+254 721 240462/0733932470, info@givinghope.co.ke',
    'https://www.givinghope.co.ke/',
    'Individual therapy, family therapy, addiction counseling',
    'Nairobi',
  ),
  CounsellingCenter(
    'Meridian Counselling and Psychological Services',
    '+254 722 506 221',
    '',
    'Individual therapy, couples counseling, child and adolescent counseling',
    'Nairobi',
  ),
  CounsellingCenter(
    'Shamiri Health',
    '+254 708 054 800',
    'https://shamiri.org/',
    'HIV/AIDS prevention, sexual health services, mental health counseling',
    'Multiple locations across Kenya (check website for details)',
  ),
  CounsellingCenter(
    'Tulivu Psychological Counselling & Wellness Services (Elite)',
    '+254 790 440 020',
    'https://tulivupsychologicalservices.co.ke/',
    'Individual therapy, couples counseling,Group Therapy, Tele-therapy, Family Therapy',
    'Nairobi',
  ),
  CounsellingCenter(
    'Wazi',
    'N/A', 
    'https://www.wazi.co/',
    'Tele-therapy',
    'Anywhere',
  ),
];

class CounselingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Counseling Services'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text('Tap on a center to find your ray of sunshine!',
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                color: Colors.white
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: counsellingCenters.length,
                itemBuilder: (context, index) {
                  final center = counsellingCenters[index];
                  return InkWell(
                    onTap: () {
                      // Navigate to a new screen to display center details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CounselingCenterDetailsScreen(center: center),
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
          // Navigate to a screen for adding a new counseling center
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCounselingCenterScreen()),
          );
        },
        child:Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class CounselingCenterDetailsScreen extends StatelessWidget {
  final CounsellingCenter center;

  CounselingCenterDetailsScreen({required this.center});

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

class AddCounselingCenterScreen extends StatefulWidget {
  @override
  _AddCounselingCenterScreenState createState() => _AddCounselingCenterScreenState();
}

class _AddCounselingCenterScreenState extends State<AddCounselingCenterScreen> {
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
        title: Text('Add Counseling Center'),
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
                    final newCenter = CounsellingCenter(
                      _nameController.text,
                      _contactController.text,
                      _websiteController.text,
                      _servicesController.text,
                      _locationController.text,
                    );
                    // Add the new center to the list
                    counsellingCenters.add(newCenter);
                    // Navigate back to the counseling screen
                    Navigator.pop(context);
                  },
                  child: Text('Save', style:TextStyle(color: Colors.deepOrange))
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}