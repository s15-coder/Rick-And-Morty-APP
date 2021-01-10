import 'package:flutter/material.dart';

import 'package:rick_y_morty/src/models/location_model.dart';
import 'package:rick_y_morty/src/providers/location_provider.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/drawer.dart';
import 'package:rick_y_morty/src/widgets/loading_indicator.dart';
import 'package:rick_y_morty/src/widgets/location_card.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key key}) : super(key: key);
  static final String routeName = "locations_page";

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  LocationProvider _locationProvider = new LocationProvider();
  ScrollController _scrollController = new ScrollController();
  List<Location> _locations = [];
  int _page = 1;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    fetchLocations();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchLocations();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'Locations'),
        drawer: NavDrawer(),
        body: Stack(
          children: [
            _listBuilder(context),
            LoadingIndicatorCustom(
              loading: _loading,
            )
          ],
        ));
  }

  Future fetchLocations() async {
    _loading = true;
    setState(() {});
    _locations += await _locationProvider.getLocationsByPage(page: this._page);
    _page++;
    _loading = false;
    setState(() {});
    _scrollController.animateTo(_scrollController.position.pixels + 50,
        duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  Widget _listBuilder(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _locations.length,
        itemBuilder: (BuildContext context, int index) {
          return LocationCard(location: _locations[index],);
        });
  }

}
