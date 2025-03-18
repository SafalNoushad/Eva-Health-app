import 'package:flutter/material.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Symptoms Tracker',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildSymptomCard(context, 'Cramps', Icons.healing),
                _buildSymptomCard(context, 'Headache', Icons.sick),
                _buildSymptomCard(context, 'Bloating', Icons.water),
                _buildSymptomCard(context, 'Mood Swings', Icons.mood_bad),
                _buildSymptomCard(context, 'Fatigue', Icons.battery_alert),
                _buildSymptomCard(context, 'Breast Tenderness', Icons.favorite),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomCard(
      BuildContext context, String symptom, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(symptom),
        trailing: const Icon(Icons.add_circle_outline),
        onTap: () {
          // TODO: Implement symptom logging functionality
        },
      ),
    );
  }
}
