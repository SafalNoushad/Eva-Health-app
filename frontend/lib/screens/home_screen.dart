import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'chatbot_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _tabs = [
    HomeContent(),
    InsightsTab(),
    SymptomsTab(),
    PartnerTab(),
    ChatbotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ProfileScreen())),
        ),
        title: Text('Eva', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        elevation: 0,
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF7E57C2),
        unselectedItemColor: Colors.black.withOpacity(0.6),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.insights), label: 'Insights'),
          BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Symptoms'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Partner'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chatbot'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.week,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                    color: const Color(0xFF7E57C2).withOpacity(0.3),
                    shape: BoxShape.circle),
              ),
            ),
            const SizedBox(height: 24),
            Text('Daily Insights',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Daily insights...',
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Log Period'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InsightsTab extends StatelessWidget {
  const InsightsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Menstrual Health Facts',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Card(
              child: ListTile(
                  title: Text('Cycle Length',
                      style: Theme.of(context).textTheme.labelLarge),
                  subtitle: Text('21-35 days'))),
          const SizedBox(height: 16),
          Card(
              child: ListTile(
                  title: Text('Period Duration',
                      style: Theme.of(context).textTheme.labelLarge),
                  subtitle: Text('3-7 days'))),
        ],
      ),
    );
  }
}

class SymptomsTab extends StatelessWidget {
  const SymptomsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Card(
            child: ListTile(
                leading: const Icon(Icons.healing),
                title: Text('Cramps',
                    style: Theme.of(context).textTheme.labelLarge),
                trailing: const Icon(Icons.add))),
        const SizedBox(height: 16),
        Card(
            child: ListTile(
                leading: const Icon(Icons.sick),
                title: Text('Headache',
                    style: Theme.of(context).textTheme.labelLarge),
                trailing: const Icon(Icons.add))),
      ],
    );
  }
}

class PartnerTab extends StatelessWidget {
  const PartnerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Partner Section',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Share with Partner',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 8),
                  Text('Invite your partner...',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Link Partner')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
