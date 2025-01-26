import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../api/data/source/list_teachers.dart';
import '../../api/data/source/suggestion.dart';

class GoogleMapsView extends ConsumerStatefulWidget {
  const GoogleMapsView({super.key});

  @override
  ConsumerState<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends ConsumerState<GoogleMapsView> {
  late final TextEditingController autoCompleteController;
  @override
  void initState() {
    super.initState();
    autoCompleteController = TextEditingController();
  }

  @override
  void dispose() {
    autoCompleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final circle = ref.watch(circleProvider);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: {
              ...teacherList.map((e) => Marker(
                    markerId: MarkerId(e.teacherName!),
                    position:
                        LatLng(e.location!.latitude, e.location!.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen,
                    ),
                    infoWindow: InfoWindow(
                      title: e.teacherName!,
                      snippet: e.teacherBio!,
                    ),
                  ))
            },
            onTap: (latLng) {
              ref.read(circleProvider.notifier).update(
                    (state) => {
                      Circle(
                          circleId: CircleId("1"),
                          radius: 20000,
                          center: latLng)
                    },
                  );
            },
            circles: circle,
            initialCameraPosition:
                CameraPosition(target: LatLng(27.7172, 85.3240), zoom: 13),
          ),
          Positioned(
            bottom: 120,
            right: 20,
            child: MaterialButton(
              height: 50,
              minWidth: 50,
              shape: CircleBorder(),
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.gps_fixed,
              ),
              onPressed: () {
                ref.read(circleProvider.notifier).update(
                      (state) => {},
                    );
              },
            ),
          ),
          Positioned(
              top: 50,
              left: 10,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 110),
                child: TypeAheadField(
                  debounceDuration: Duration(seconds: 1),
                  builder: (context, controller, focusNode) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    );
                  },
                  itemBuilder: (context, value) {
                    return ListTile(
                      title: Text(value),
                    );
                  },
                  onSelected: (value) {},
                  suggestionsCallback: (search) {
                    print(search);
                    if (search.isEmpty) {
                      return null;
                    } else {
                      return suggestions
                          .where((element) => element.contains(search))
                          .toList();
                    }
                  },
                ),
              )),
          Positioned(
              right: 30,
              top: 50,
              child: MaterialButton(
                height: 54,
                minWidth: 40,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Icon(Icons.search),
              )),
          // Positioned(
          //     top: 80,
          //     left: 20,
          //     child: GooglePlaceAutoCompleteTextField(
          //         textEditingController: autoCompleteController,
          //         googleAPIKey: ApiKey.apiKey))
        ],
      ),
    );
  }
}

final circleProvider = StateProvider<Set<Circle>>((ref) {
  return {};
});

final markerProvider = StateProvider<Set<Marker>>((ref) {
  return {};
});
