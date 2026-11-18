import 'package:flutter/material.dart';

// 1. Data Model for a Car
class Car {
  final String make;
  final String model;
  final double price;

  Car(this.make, this.model, this.price);
}

class LabBScreen extends StatefulWidget {
  const LabBScreen({super.key});

  @override
  State<LabBScreen> createState() => _LabBScreenState();
}

class _LabBScreenState extends State<LabBScreen> {
  // 2. Sample data list
  List<Car> cars = [
    Car('Toyota', 'Camry', 120000.0),
    Car('Honda', 'Civic', 110000.0),
    Car('Proton', 'X50', 85000.0),
    Car('Perodua', 'Myvi', 55000.0),
    Car('Nissan', 'Almera', 75000.0),
  ];

  bool _sortAscending = true;
  int? _sortColumnIndex;

  // 3. Sorting helper function
  void _sort<T>(
    Comparable<T> Function(Car car) getField,
    int columnIndex,
    bool ascending,
  ) {
    cars.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab B: DataTable with Sorting')),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              // Column 0: Car Make
              DataColumn(
                label: const Text(
                  'Make',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onSort: (columnIndex, ascending) {
                  _sort((car) => car.make, columnIndex, ascending);
                },
              ),
              // Column 1: Model
              DataColumn(
                label: const Text(
                  'Model',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onSort: (columnIndex, ascending) {
                  _sort((car) => car.model, columnIndex, ascending);
                },
              ),
              // Column 2: Price
              DataColumn(
                numeric: true,
                label: const Text(
                  'Price (RM)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onSort: (columnIndex, ascending) {
                  _sort((car) => car.price, columnIndex, ascending);
                },
              ),
            ],
            rows: cars.map((car) {
              return DataRow(
                cells: [
                  DataCell(Text(car.make)),
                  DataCell(Text(car.model)),
                  DataCell(Text('RM ${car.price.toStringAsFixed(2)}')),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
