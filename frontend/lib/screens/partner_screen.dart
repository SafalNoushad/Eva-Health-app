import 'package:flutter/material.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Partner Section',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Share with Your Partner',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Invite your partner to connect with your menstrual health journey. They can receive updates and learn how to support you better.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement partner linking functionality
                    },
                    child: const Text('Link Partner'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Partner Tips',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  _buildTip(context,
                      'Be supportive and understanding during your partner\'s menstrual cycle.'),
                  _buildTip(context,
                      'Offer to help with daily tasks or errands during their period.'),
                  _buildTip(context,
                      'Learn about the menstrual cycle to better understand your partner\'s experience.'),
                  _buildTip(context,
                      'Be patient and considerate of mood changes that may occur due to hormonal fluctuations.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTip(BuildContext context, String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(tip, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
