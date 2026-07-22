class Shipment {
  final String id;
  final String trackingNumber;
  final String clientName;
  final String origin;
  final String destination;
  final String status;
  final DateTime expectedDelivery;

  Shipment({
    required this.id,
    required this.trackingNumber,
    required this.clientName,
    required this.origin,
    required this.destination,
    required this.status,
    required this.expectedDelivery,
  });

  static List<Shipment> mockData = [
    Shipment(
      id: '1',
      trackingNumber: 'FF-1001',
      clientName: 'Global Tech Industries',
      origin: 'Shenzhen, CN',
      destination: 'Los Angeles, US',
      status: 'In Transit',
      expectedDelivery: DateTime.now().add(const Duration(days: 14)),
    ),
    Shipment(
      id: '2',
      trackingNumber: 'FF-1002',
      clientName: 'Euro Imports Co.',
      origin: 'Rotterdam, NL',
      destination: 'New York, US',
      status: 'Customs Clearance',
      expectedDelivery: DateTime.now().add(const Duration(days: 2)),
    ),
    Shipment(
      id: '3',
      trackingNumber: 'FF-1003',
      clientName: 'Aussie Distributors',
      origin: 'Sydney, AU',
      destination: 'Tokyo, JP',
      status: 'Delivered',
      expectedDelivery: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Shipment(
      id: '4',
      trackingNumber: 'FF-1004',
      clientName: 'National Logistics',
      origin: 'Chicago, US',
      destination: 'Miami, US',
      status: 'Pending',
      expectedDelivery: DateTime.now().add(const Duration(days: 4)),
    ),
  ];
}
