import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0;
  bool _acceptedTnc = false;
  final _nicknameController = TextEditingController();
  String _userType = '';
  int? _birthYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_step == 0) ...[
                Text('Your Body, Your Data',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                          child: Text('Terms and conditions...',
                              style: Theme.of(context).textTheme.bodyLarge)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                        value: _acceptedTnc,
                        onChanged: (v) => setState(() => _acceptedTnc = v!)),
                    Expanded(
                        child: Text('I accept the terms',
                            style: Theme.of(context).textTheme.labelLarge)),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed:
                        _acceptedTnc ? () => setState(() => _step = 1) : null,
                    child: const Text('Accept & Continue'),
                  ),
                ),
              ],
              if (_step == 1) ...[
                Text("What's your nickname?",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                TextField(
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    hintText: 'Enter nickname',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nicknameController.text.isNotEmpty)
                        setState(() => _step = 2);
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
              if (_step == 2) ...[
                Text("For yourself or a partner?",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => setState(() => _userType = 'Myself'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56)),
                  child: const Text('For Myself'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _userType = 'Partner'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56)),
                  child: const Text('For a Partner'),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _userType.isNotEmpty
                        ? () => setState(() => _step = 3)
                        : null,
                    child: const Text('Next'),
                  ),
                ),
              ],
              if (_step == 3) ...[
                Text("Birth year?",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (_, i) {
                      final year = DateTime.now().year - i;
                      return ListTile(
                        title: Text(year.toString(),
                            style: Theme.of(context).textTheme.bodyLarge),
                        tileColor: _birthYear == year
                            ? const Color(0xFF7E57C2).withOpacity(0.1)
                            : null,
                        onTap: () => setState(() => _birthYear = year),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _birthYear != null
                        ? () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()))
                        : null,
                    child: const Text('Finish'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }
}
