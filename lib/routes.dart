import 'package:musapp/about/about.dart';
import 'package:musapp/home/home.dart';
import 'package:musapp/map/map.dart';
import 'package:musapp/routes/routes.dart';

final appRoutes = {
  '/': (context) => const HomeScreen(),
  '/routes': (context) => const RoutesScreen(),
  '/map': (context) => const MapScreen(),
  '/about': (context) => const AboutScreen(),
};
