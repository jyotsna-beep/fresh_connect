import 'package:flutter/material.dart';


void main() => runApp(SlurryProcessApp());

class SlurryProcessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Slurry Process Control"),
        ),
        body: SlurryProcessSimulation(),
      ),
    );
  }
}

class SlurryProcessSimulation extends StatefulWidget {
  @override
  _SlurryProcessSimulationState createState() => _SlurryProcessSimulationState();
}

class _SlurryProcessSimulationState extends State<SlurryProcessSimulation> {
  // Valve states
  bool valve1Open = false;
  bool valve2Open = false;
  bool valve3Open = false;
  bool heating = false;
  bool mixing = false;

  // Slurry state color
  Color slurryColor = Colors.green;
  bool isFlowing = false;

  void toggleValve(int valveNumber) {
    setState(() {
      switch (valveNumber) {
        case 1:
          valve1Open = !valve1Open;
          break;
        case 2:
          valve2Open = !valve2Open;
          break;
        case 3:
          valve3Open = !valve3Open;
          break;
      }
      isFlowing = valve1Open || valve2Open || valve3Open;
    });
  }

  void toggleHeating() {
    setState(() {
      heating = !heating;
      slurryColor = heating ? Colors.purple : Colors.green;
    });
  }

  void toggleMixing() {
    setState(() {
      mixing = !mixing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Header
          Text(
            "Biogas Slurry Process",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          // Slurry Tank
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TankWidget(
                        label: "Slurry Tank",
                        color: slurryColor,
                        child: Text(
                          heating
                              ? "Heating..."
                              : mixing
                                  ? "Mixing..."
                                  : "Idle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ValveWidget(
                        label: "Valve 1",
                        isOpen: valve1Open,
                        onToggle: () => toggleValve(1),
                      ),
                      PipeFlowWidget(
                        isActive: valve1Open,
                      ),
                      ValveWidget(
                        label: "Valve 2",
                        isOpen: valve2Open,
                        onToggle: () => toggleValve(2),
                      ),
                      TankWidget(
                        label: "Heating Tank",
                        color: Colors.orange,
                        child: Icon(
                          heating ? Icons.local_fire_department : Icons.timer,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      ValveWidget(
                        label: "Valve 3",
                        isOpen: valve3Open,
                        onToggle: () => toggleValve(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutputTank(label: "Biogas"),
                          OutputTank(label: "Bio Diesel"),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isFlowing)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: FlowAnimation(),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: toggleHeating,
                child: Text(heating ? "Stop Heating" : "Start Heating"),
              ),
              ElevatedButton(
                onPressed: toggleMixing,
                child: Text(mixing ? "Stop Mixing" : "Start Mixing"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Valve Widget
class ValveWidget extends StatelessWidget {
  final String label;
  final bool isOpen;
  final VoidCallback onToggle;

  const ValveWidget({
    required this.label,
    required this.isOpen,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          isOpen ? Icons.check_circle : Icons.cancel,
          color: isOpen ? Colors.green : Colors.red,
          size: 30,
        ),
        Switch(
          value: isOpen,
          onChanged: (value) => onToggle(),
        ),
        Text(label),
      ],
    );
  }
}

// Tank Widget
class TankWidget extends StatelessWidget {
  final String label;
  final Color color;
  final Widget child;

  const TankWidget({required this.label, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.brown, width: 2),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

// Pipe Flow Widget
class PipeFlowWidget extends StatelessWidget {
  final bool isActive;

  const PipeFlowWidget({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 10,
      color: isActive ? Colors.green : Colors.grey,
    );
  }
}

// Output Tank Widget
class OutputTank extends StatelessWidget {
  final String label;

  const OutputTank({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Flow Animation Widget
class FlowAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}
