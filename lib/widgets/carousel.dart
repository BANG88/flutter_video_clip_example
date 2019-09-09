import 'package:carousel_slider/carousel_slider.dart';
/**
 *
 * CarouselWidget
 *
 */
import 'package:flutter/material.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  var lists = [
    {
      'title': '延时摄影火热征稿',
      'url':
          'https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=260'
    },
    {
      'title': '延时摄影火热征稿',
      'url':
          'https://images.pexels.com/photos/2893960/pexels-photo-2893960.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=260'
    },
    {
      'title': '延时摄影火热征稿',
      'url':
          'https://images.pexels.com/photos/2422265/pexels-photo-2422265.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=260'
    },
    {
      'title': 'Two person jumping on brown soil',
      'url':
          'https://images.pexels.com/photos/2480524/pexels-photo-2480524.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=260'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        items: map<Widget>(
          lists,
          (index, l) => Container(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    l['url'],
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 26.0,
                    left: 15.0,
                    child: Text(
                      "${l['title']}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        autoPlayInterval: const Duration(seconds: 6),
        viewportFraction: 1.0,
        height: 160,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Positioned(
          bottom: 20.0,
          left: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: map<Widget>(lists, (index, url) {
              return Container(
                width: _current == index ? 16.0 : 8,
                height: 2.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _current == index
                        ? Color.fromRGBO(255, 255, 255, 0.9)
                        : Color.fromRGBO(255, 255, 255, 0.4)),
              );
            }),
          ))
    ]);
  }
}
