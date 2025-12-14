import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget({
    super.key,
    required this.centerText,
    required this.posters,
    this.height = 700,   this.isMobile = false,
    // required this.title,
    // required this.body
  });

  final bool centerText;
  final List<String> posters;
  final double? height;
  final bool isMobile;
  @override
  State<BannersWidget> createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 8.0 : 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: widget.posters.map((banner) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BannerImageOnly(banner: banner),
              );
            }).toList(),
            options: CarouselOptions(
              initialPage: 0,
              height:widget. height,

              viewportFraction: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              onPageChanged: (s, c) {
                currentIndex = s;
                // debugPrint('${currentIndex}index');
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.posters.map((e) {
              int index = widget.posters.indexOf(e);
              return Container(
                width: 80,
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? const Color(0xff827153)
                      : const Color(0xffC4C4C4),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class BannerImageOnly extends StatelessWidget {
  const BannerImageOnly({super.key, required this.banner});
  final String banner;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
      child: Image.asset(banner, fit: BoxFit.contain, width: double.infinity ,),
    );
  }
}
