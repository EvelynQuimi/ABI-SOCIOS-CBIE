import 'dart:io';

import 'package:app_socios/utils/global.dart';
import 'package:flutter/material.dart';

class Slide {
  Slide({
    this.title,
    required this.height,
    this.color,
    this.path,
  });

  final Color? color;
  final double height;
  final String? title;
  final String? path;
}

var slides = List.generate(
  maxItemsToPost,
  (index) => Slide(
    path: "",
    title: 'Slide ${index + 1}',
    height: 100.0 + index * 50,
    color: Colors.primaries[index % Colors.primaries.length],
  ),
);

List<Widget> sliders = slidesWidget(slides);

List<Padding> slidesWidget(List<Slide>? newSlides) => (newSlides ?? slides)
    .map(
      (item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            color: item.color,
            width: double.infinity,
            height: item.height,
            child: Center(
              child: item.path != null
                  ? Image.file(File(item.path!))
                  : Text(
                      item.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    )
    .toList();
