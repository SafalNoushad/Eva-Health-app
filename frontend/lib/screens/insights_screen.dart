import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menstrual Health Facts',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            _buildFactCard(
              context,
              'Menstrual Cycle Length',
              'The average menstrual cycle is 28 days, but it can range from 21 to 35 days.',
            ),
            _buildFactCard(
              context,
              'Period Duration',
              'Periods typically last 3 to 7 days, with an average of 5 days.',
            ),
            _buildFactCard(
              context,
              'Menstrual Blood Loss',
              'The average amount of blood lost during a period is 30 to 40 milliliters.',
            ),
            _buildFactCard(
              context,
              'Ovulation',
              'Ovulation usually occurs about 14 days before the start of the next period.',
            ),
            _buildFactCard(
              context,
              'Premenstrual Syndrome (PMS)',
              'PMS affects up to 75% of menstruating women and can include symptoms like mood swings, bloating, and breast tenderness.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFactCard(BuildContext context, String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
