import 'package:flutter/material.dart';

class CarbonFootprintCalculator extends StatefulWidget {
  @override
  _CarbonFootprintCalculatorState createState() =>
      _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  // Variables to store user inputs
  double electricitySpending = 0.0;
  double gasSpending = 0.0;
  double waterSpending = 0.0;
  int householdSize = 1;
  bool recyclesWaste = false;
  String dietChoice = 'Omnivore';
  double clothingSpending = 0.0;
  double healthSpending = 0.0;
  double eventsSpending = 0.0;
  double taxiTravelTime = 0.0;
  double carTravelTime = 0.0;
  double mrtTravelTime = 0.0;
  double busTravelTime = 0.0;

  // Function to calculate and display carbon footprint
  void calculateFootprint() {
    // Calculate carbon footprint based on user inputs
    double carbonFootprint = 0.0;

    // Consider electricity, gas, and water spending
    carbonFootprint +=
        electricitySpending * 0.5; // Assign a carbon value based on spending
    carbonFootprint += gasSpending * 0.7;
    carbonFootprint += waterSpending * 0.3;

    // Adjust for household size
    carbonFootprint += (householdSize - 1) * 100.0;

    // Adjust for recycling
    carbonFootprint -= recyclesWaste ? 50.0 : 0.0;

    // Adjust for diet choices
    if (dietChoice == 'Vegan') {
      carbonFootprint -= 150.0;
    } else if (dietChoice == 'Vegetarian') {
      carbonFootprint -= 100.0;
    }

    // Consider spending on clothes, health, and events
    carbonFootprint += clothingSpending * 0.2;
    carbonFootprint += healthSpending * 0.3;
    carbonFootprint += eventsSpending * 0.4;

    // Consider travel time and mode
    carbonFootprint += taxiTravelTime * 0.1;
    carbonFootprint += carTravelTime * 0.05;
    carbonFootprint += mrtTravelTime * 0.03;
    carbonFootprint += busTravelTime * 0.02;

    // Display the calculated carbon footprint
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Carbon Footprint'),
          content: Text(
              'Estimated Carbon Footprint: ${carbonFootprint.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Utility Spending Inputs
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  electricitySpending = double.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Monthly Electricity Spending'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  gasSpending = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Monthly Gas Spending'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  waterSpending = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Monthly Water Spending'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  householdSize = int.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Number of People in Household'),
            ),

            // Recycling and Diet Choices
            SwitchListTile(
              title: Text('Recycles Waste'),
              value: recyclesWaste,
              onChanged: (value) {
                setState(() {
                  recyclesWaste = value;
                });
              },
            ),
            DropdownButtonFormField(
              value: dietChoice,
              onChanged: (value) {
                setState(() {
                  dietChoice = value.toString();
                });
              },
              items: ['Omnivore', 'Vegetarian', 'Vegan']
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: InputDecoration(labelText: 'Diet Choice'),
            ),

            // Spending on Other Categories
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  clothingSpending = double.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Monthly Clothing Spending'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  healthSpending = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Monthly Health Spending'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  eventsSpending = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Monthly Events Spending'),
            ),

            // Travel Time and Mode
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  taxiTravelTime = double.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Daily Taxi Travel Time (hours)'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  carTravelTime = double.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Daily Car Travel Time (hours)'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  mrtTravelTime = double.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Daily MRT Travel Time (hours)'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  busTravelTime = double.parse(value);
                });
              },
              decoration:
                  InputDecoration(labelText: 'Daily Bus Travel Time (hours)'),
            ),

            // Calculate Button
            ElevatedButton(
              onPressed: calculateFootprint,
              child: Text('Calculate Carbon Footprint'),
            ),
          ],
        ),
      ),
    );
  }
}
