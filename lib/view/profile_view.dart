import 'package:flutter/material.dart';
import 'welcome_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(height: 160, width: double.infinity, decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://unsplash.com'), fit: BoxFit.cover))),
              Positioned(top: 40, right: 20, child: IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: () {})),
              const Positioned(bottom: -40, child: CircleAvatar(radius: 44, backgroundColor: Colors.white, child: CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://unsplash.com')))),
            ],
          ),
          const SizedBox(height: 50),
          const Text('Pramod Adhikari', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('pramod@gmail.com', style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [Text('5', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('Trips', style: TextStyle(color: Colors.grey))]),
              Column(children: [Text('12', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('Saved', style: TextStyle(color: Colors.grey))]),
              Column(children: [Text('3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('Reviews', style: TextStyle(color: Colors.grey))]),
            ],
          ),
          const SizedBox(height: 24),
          _tile(Icons.calendar_today_outlined, 'My Bookings'),
          _tile(Icons.favorite_border, 'Wishlist'),
          _tile(Icons.star_border, 'Reviews'),
          _tile(Icons.settings_outlined, 'Settings'),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeView()));
            },
            icon: const Icon(Icons.logout, color: Colors.black),
            label: const Text('Log Out', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String title) {
    return ListTile(leading: Icon(icon), title: Text(title), trailing: const Icon(Icons.arrow_forward_ios, size: 14));
  }
}
