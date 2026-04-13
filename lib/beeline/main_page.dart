import 'package:flutter/material.dart';
import 'tariff_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "beeline",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          actionbutton(Icons.phone, () {}),
          actionbutton(Icons.camera_alt_outlined, () {}),
          actionbutton(Icons.telegram, () {}),
        ],
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildGridItem(Icons.public, "Internet paketlar", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TariffPage()),
                    );
                  }),
                  buildGridItem(Icons.file_copy_sharp, "Tariflar", () {}),
                  buildGridItem(Icons.alarm, "Daqiqa paketlar", () {}),
                  buildGridItem(Icons.newspaper_outlined, "Aktsiya va Yangiliklar", () {}),
                  buildGridItem(Icons.mail, "SMS paketlar", () {}),
                  buildGridItem(Icons.dialpad, "USSD Kodlar va Xizmatlar", () {}),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, color: Colors.black),
                label: const Text(
                  "RESTART XIZMATI",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80), // Pastki bar uchun joy
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.yellow,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.yellow,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.headphones_rounded),
                color: _selectedIndex == 0 ? Colors.white : Colors.white54,
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.attach_money),
                color: _selectedIndex == 1 ? Colors.white : Colors.white54,
                onPressed: () => _onItemTapped(1),
              ),
              const SizedBox(width: 40), // FAB uchun joy
              IconButton(
                icon: const Icon(Icons.person_outline),
                color: _selectedIndex == 2 ? Colors.white : Colors.white54,
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                color: _selectedIndex == 3 ? Colors.white : Colors.white54,
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.yellow, width: 2),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: Colors.grey),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget actionbutton(IconData icon, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.yellow, size: 20),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 35, minHeight: 35),
    ),
  );
}
