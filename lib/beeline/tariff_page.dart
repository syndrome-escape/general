import 'package:flutter/material.dart';

class TariffPage extends StatelessWidget {
  const TariffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Биline: Tariflar",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.yellow,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "OY"),
              Tab(text: "KUN"),
              Tab(text: "TO'PLAMLAR"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTariffList(),
            const Center(child: Text("Kunlik tariflar")),
            const Center(child: Text("To'plamlar")),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomItem(Icons.headphones, "Operator"),
              _buildBottomItem(Icons.attach_money, "Balans"),
              _buildBottomItem(Icons.person, "Kabinet"),
              _buildBottomItem(Icons.settings, "Yazyk / Til"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTariffList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTariffCard("OSON 10", "14,000 so'm.", "500 daq."),
        _buildTariffCard("YANA BITTA", "20,000 so'm.", "VIP daq."),
        _buildTariffCard("HAMMASI ZO'R 1", "20,000 so'm.", "1500 daq."),
        _buildTariffCard("HAMMASI ZO'R 2", "40,000 so'm.", "Cheksiz"),
      ],
    );
  }

  Widget _buildTariffCard(String title, String price, String minutes) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24), // Balanslash uchun
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              ],
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Abonent to'lovi:", style: TextStyle(color: Colors.grey)),
                Text(price, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Chiquvchi O'zb. bo'yicha:", style: TextStyle(color: Colors.grey)),
                Text(minutes, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black54),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.black54)),
      ],
    );
  }
}
