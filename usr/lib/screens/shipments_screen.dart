import 'package:flutter/material.dart';
import '../models/shipment.dart';

class ShipmentsScreen extends StatefulWidget {
  const ShipmentsScreen({super.key});

  @override
  State<ShipmentsScreen> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<ShipmentsScreen> {
  final List<Shipment> _shipments = Shipment.mockData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipments'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add shipment dialog not implemented yet')),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return _buildDesktopTable();
          }
          return _buildMobileList();
        },
      ),
    );
  }

  Widget _buildDesktopTable() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Tracking No.')),
                DataColumn(label: Text('Client')),
                DataColumn(label: Text('Origin')),
                DataColumn(label: Text('Destination')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Actions')),
              ],
              rows: _shipments.map((shipment) {
                return DataRow(cells: [
                  DataCell(Text(shipment.trackingNumber)),
                  DataCell(Text(shipment.clientName)),
                  DataCell(Text(shipment.origin)),
                  DataCell(Text(shipment.destination)),
                  DataCell(_buildStatusChip(shipment.status)),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileList() {
    return ListView.builder(
      itemCount: _shipments.length,
      itemBuilder: (context, index) {
        final shipment = _shipments[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text('${shipment.trackingNumber} - ${shipment.clientName}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('${shipment.origin} → ${shipment.destination}'),
                const SizedBox(height: 8),
                _buildStatusChip(shipment.status),
              ],
            ),
            isThreeLine: true,
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'in transit':
        color = Colors.blue;
        break;
      case 'customs clearance':
        color = Colors.orange;
        break;
      case 'delivered':
        color = Colors.green;
        break;
      case 'pending':
        color = Colors.grey;
        break;
      default:
        color = Colors.grey;
    }
    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white, fontSize: 12)),
      backgroundColor: color,
      padding: EdgeInsets.zero,
    );
  }
}
