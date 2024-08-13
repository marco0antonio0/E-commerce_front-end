import 'package:carousel_slider/carousel_slider.dart';
import 'package:dirrocha_ecommerce/components/banner.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<String> images;
  const Carousel({super.key, required this.images});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  void _precacheImages() {
    for (var image in widget.images) {
      precacheImage(AssetImage(image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double wscreen = MediaQuery.of(context).size.width;
    wscreen = wscreen > 700 ? 700 : wscreen;
    return Column(
      children: [
        CarouselSlider(
          items: [
            banner(wscreen, image: widget.images[0]),
            banner(wscreen, image: widget.images[1]),
            banner(wscreen, image: widget.images[2]),
            banner(wscreen, image: widget.images[3]),
          ],
          carouselController: _controller,
          options: CarouselOptions(
            height: wscreen < 500 ? 150 : 300,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 16,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: wscreen >= 700 ? 12.0 : 9.0,
                height: wscreen >= 700 ? 12.0 : 9.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(
                      _current == entry.key ? 0.9 : 0.4), // Indicador verde
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
