import 'package:flutter/material.dart';
import 'package:galaxy_planets_animator/models/planet_model.dart';
import 'package:galaxy_planets_animator/views/detail_screen/widgets/desc_text.dart';
import 'package:galaxy_planets_animator/views/detail_screen/widgets/detail_row.dart';
import 'package:galaxy_planets_animator/views/detail_screen/widgets/section_title.dart';

class PlanetDetailScreen extends StatelessWidget {
  final PlanetModel planet;

  const PlanetDetailScreen({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 550,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                planet.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.brown,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Hero(
                      tag: planet.name,
                      child: Image.network(
                        planet.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),
                buildDetailRow("Position", planet.position),
                buildDetailRow("Velocity", "${planet.velocity} km/s"),
                buildDetailRow(
                    "Distance from Sun", "${planet.distance} million km"),
                const SizedBox(height: 20),
                buildSectionTitle("Description"),
                const SizedBox(height: 10),
                buildDescriptionText(planet.description),
                const SizedBox(height: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
