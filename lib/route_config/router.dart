import 'package:flutter/material.dart';
import 'package:flutter_base/route_config/route_name_config.dart';
import 'package:flutter_base/ui/pages/detail_movie/detail_movie_page.dart';
import 'package:flutter_base/ui/pages/home/home_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNameConfgi.homePage:
      return MaterialPageRoute(builder: (_) =>  const HomePage(),settings: settings);
    case RouteNameConfgi.detailMoviePage:
      return MaterialPageRoute(builder: (_) =>  const DetailMoviePage(),settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => Container(
                alignment: Alignment.center,
                child: const Text("Undefined page route"),
              ));
  }
}
