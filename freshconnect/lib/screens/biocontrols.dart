import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bio-Waste to Bio-Diesel Control',
      home: ControlScreen(),
    );
  }
}

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  double temperature = 25.0; // Initial temperature in Celsius
  double slurryVolume = 100.0; // Initial slurry volume in Liters
  double chemical1 = 0.0; // Chemical 1 to be added (Liters)
  double chemical2 = 0.0; // Chemical 2 to be added (Liters)

  // Valve status flags
  bool valve1Status = false;
  bool valve2Status = false;
  bool valve3Status = false;

  // Function to calculate the chemical proportions
  void _calculateChemicals() {
    if (temperature > 50) {
      chemical1 = slurryVolume * 0.4; // 40% of slurry volume for chemical1
      chemical2 = slurryVolume * 0.6; // 60% of slurry volume for chemical2
    } else {
      chemical1 = slurryVolume * 0.5; // 50% of slurry volume for chemical1
      chemical2 = slurryVolume * 0.5; // 50% of slurry volume for chemical2
    }
    setState(() {});
  }

  // Function to control valves
  void _controlValve(int valveId) {
    setState(() {
      if (valveId == 1) {
        valve1Status = !valve1Status;
      } else if (valveId == 2) {
        valve2Status = !valve2Status;
      } else if (valveId == 3) {
        valve3Status = !valve3Status;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bio-Waste to Bio-Diesel Control'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying current temperature and slurry volume
            Text(
              'Current Temperature: ${temperature.toStringAsFixed(1)}°C',
              style: const TextStyle(fontSize: 18),
            ),
            Slider(
              value: temperature,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${temperature.toStringAsFixed(1)}°C',
              onChanged: (double newValue) {
                setState(() {
                  temperature = newValue;
                });
                _calculateChemicals();
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Slurry Volume: ${slurryVolume.toStringAsFixed(1)} L',
              style: const TextStyle(fontSize: 18),
            ),
            Slider(
              value: slurryVolume,
              min: 10,
              max: 500,
              divisions: 50,
              label: '${slurryVolume.toStringAsFixed(1)} L',
              onChanged: (double newValue) {
                setState(() {
                  slurryVolume = newValue;
                });
                _calculateChemicals();
              },
            ),
            const SizedBox(height: 20),
            // Displaying calculated chemical proportions
            Text(
              'Chemical 1 to be added: ${chemical1.toStringAsFixed(1)} L',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Chemical 2 to be added: ${chemical2.toStringAsFixed(1)} L',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            // Valve control buttons
            Text(
              'Valve 1 Status: ${valve1Status ? "ON" : "OFF"}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => _controlValve(1),
              child: Text(valve1Status ? 'Turn Valve 1 OFF' : 'Turn Valve 1 ON'),
            ),
            const SizedBox(height: 20),
            Text(
              'Valve 2 Status: ${valve2Status ? "ON" : "OFF"}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => _controlValve(2),
              child: Text(valve2Status ? 'Turn Valve 2 OFF' : 'Turn Valve 2 ON'),
            ),
            const SizedBox(height: 20),
            Text(
              'Valve 3 Status: ${valve3Status ? "ON" : "OFF"}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => _controlValve(3),
              child: Text(valve3Status ? 'Turn Valve 3 OFF' : 'Turn Valve 3 ON'),
            ),
          ],
        ),
      ),
    );
  }
}
