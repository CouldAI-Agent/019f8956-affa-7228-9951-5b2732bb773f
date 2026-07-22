import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/shipments_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    ShipmentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;
    
    return Scaffold(
      appBar: isDesktop ? null : AppBar(
        title: const Text('Freight Forward'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: isDesktop ? null : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: const Text('Freight Forward', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping),
              title: const Text('Shipments'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              extended: MediaQuery.of(context).size.width >= 1000,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              leading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.anchor, size: 32),
                    if (MediaQuery.of(context).size.width >= 1000)
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Freight Forward', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                  ],
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.local_shipping_outlined),
                  selectedIcon: Icon(Icons.local_shipping),
                  label: Text('Shipments'),
                ),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
