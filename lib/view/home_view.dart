import 'package:flutter/material.dart';
import '../controller/travel_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TravelController();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning,', style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                    Row(
                      children: [
                        Text(controller.userName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 6),
                        const Text('🏔️', style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ],
                ),
                IconButton(icon: const Icon(Icons.notifications_none, size: 28), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search destinations, treks...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Featured Card
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://unsplash.com'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.6)]))),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.green.withOpacity(0.8), borderRadius: BorderRadius.circular(12)), child: const Text('FEATURED', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Everest Base Camp', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), Text('The journey of a lifetime', style: TextStyle(color: Colors.white70, fontSize: 12))]),
                            CircleAvatar(backgroundColor: Colors.white, radius: 18, child: Icon(Icons.arrow_forward, size: 18, color: Colors.black))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCat(Icons.terrain, 'Trekking', Colors.green.shade50, Colors.green),
                _buildCat(Icons.flight_takeoff, 'Tours', Colors.blue.shade50, Colors.blue),
                _buildCat(Icons.hotel, 'Hotels', Colors.orange.shade50, Colors.orange),
                _buildCat(Icons.explore, 'Explore', Colors.purple.shade50, Colors.purple),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Popular Destinations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(color: Colors.teal))),
              ],
            ),
            const SizedBox(height: 12),
            // Popular List
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularDestinations.length,
                itemBuilder: (context, index) {
                  final item = controller.popularDestinations[index];
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.network(item.imageUrl, height: 100, width: 150, fit: BoxFit.cover)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, key: const ValueKey('title'), style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.teal), Text(item.country, style: const TextStyle(color: Colors.grey, fontSize: 11))]),
                                  Row(children: [const Icon(Icons.star, size: 12, color: Colors.amber), Text(item.rating, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text('Recommended For You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            // Recommended Layout
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]),
              child: Row(
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(controller.recommendedTrek.imageUrl, width: 70, height: 70, fit: BoxFit.cover)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.recommendedTrek.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 14, color: Colors.teal),
                            Text(controller.recommendedTrek.country, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                            const SizedBox(width: 16),
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            Text(controller.recommendedTrek.rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const CircleAvatar(backgroundColor: Colors.transparent, child: Icon(Icons.arrow_forward_ios, size: 14))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCat(IconData icon, String label, Color bg, Color iconColor) {
    return Column(
      children: [
        Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)), child: Icon(icon, color: iconColor)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
