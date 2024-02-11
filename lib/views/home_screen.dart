import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:galaxy_planets_animator/components/planet_card.dart';
import 'package:galaxy_planets_animator/provider/planet_provider.dart';
import 'package:galaxy_planets_animator/views/detail_screen/planet_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    PlanetProvider planetProvider = Provider.of<PlanetProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planets'),
        centerTitle: true,
      ),
      body: CarouselSlider.builder(
        itemCount: planetProvider.planets.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final planet = planetProvider.planets[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetDetailScreen(planet: planet),
                ),
              );
            },
            child: Hero(
              tag: planet.name,
              child: PlanetCard(
                planets: [planet],
                currentIndex: index,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.7,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
