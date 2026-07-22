import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Dashboard'),
            floating: true,
            automaticallyImplyLeading: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth > 800) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth > 500) {
                    crossAxisCount = 2;
                  }
                  
                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 2.0,
                    children: [
                      _buildMetricCard(context, 'Active Shipments', '12', Icons.directions_boat),
                      _buildMetricCard(context, 'Express Shipments', '2', Icons.bolt, iconColor: Colors.amber),
                      _buildMetricCard(context, 'Pending Clearance', '4', Icons.document_scanner),
                      _buildMetricCard(context, 'Delivered This Week', '28', Icons.check_circle),
                      _buildMetricCard(context, 'Revenue', '\$42,500', Icons.attach_money),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      const ListTile(
                        leading: CircleAvatar(child: Icon(Icons.info_outline)),
                        title: Text('Shipment #FF-1002 cleared customs'),
                        subtitle: Text('2 hours ago'),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: CircleAvatar(child: Icon(Icons.warning_amber)),
                        title: Text('Delay in transit for Shipment #FF-1004'),
                        subtitle: Text('5 hours ago'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, String title, String value, IconData icon, {Color? iconColor}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: iconColor ?? Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
