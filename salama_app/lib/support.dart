import 'package:flutter/material.dart';
import 'counselling.dart';
import 'legal.dart';
import 'rescue.dart';

class SupportServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support Services'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SupportServiceItem(
              title: 'Counseling Services',
              description:
                  'Professional counseling services for individuals affected by gender-based violence.',
              icon: Icons.people,
              onTap: () {
                // Navigate to CounselingScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounselingScreen(),
                  ),
                );
              },
            ),
            SupportServiceItem(
              title: 'Legal Assistance',
              description:
                  'Legal aid and support for navigating legal processes related to gender-based violence cases.',
              icon: Icons.gavel,
              onTap: () {
                // Navigate to CounselingScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LegalAidScreen(),
                  ),
                );
              },
            ),
            SupportServiceItem(
              title: 'GBV Rescue Centres',
              description:
                  'Safe and secure shelters for individuals seeking refuge from abusive environments.',
              icon: Icons.home,
              onTap: () {
                // Navigate to CounselingScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GVRCScreen(),
                  ),
                );
              }
            ),
            // Add more support service items as needed
          ],
        ),
      ),
    );
  }
}

class SupportServiceItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Function()? onTap; // Add onTap parameter

  const SupportServiceItem({
    required this.title,
    required this.description,
    required this.icon,
    this.onTap, // Define onTap parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: GestureDetector(
        onTap: onTap, // Call onTap function when tapped
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 30.0,
                  color: Colors.deepOrange,
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 20.0, thickness: 1.0),
          ],
        ),
      ),
    );
  }
}
