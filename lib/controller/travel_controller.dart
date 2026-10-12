import '../model/destination_model.dart';

class TravelController {
  // Mock data for your views
  final String userName = "Pramod";

  final List<DestinationModel> popularDestinations = [
    DestinationModel(
      title: 'Annapurna Circuit',
      country: 'Nepal',
      rating: '4.8',
      imageUrl: 'https://unsplash.com',
    ),
    DestinationModel(
      title: 'Langtang Valley',
      country: 'Nepal',
      rating: '4.6',
      imageUrl: 'https://unsplash.com',
    ),
  ];

  final DestinationModel recommendedTrek = DestinationModel(
    title: 'Mardi Himal Trek',
    country: 'Nepal',
    rating: '4.5',
    imageUrl: 'https://unsplash.com',
  );
}
