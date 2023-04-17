import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:jejuinfo/store/searchListStore.dart';
import 'package:provider/provider.dart';


class FNMapPage extends StatefulWidget {
  const FNMapPage({Key? key}) : super(key: key);

  @override
  State<FNMapPage> createState() => _FNMapPageState();
}

class _FNMapPageState extends State<FNMapPage> {
  /* ----- UI Size ----- */
  late EdgeInsets safeArea;
  double drawerHeight = 0;
  double lat = 37;
  double long = 127;

  @override
  void initState() {
    super.initState();
    lat = context.read<SearchListStore>().detailItem['latitude'] ?? 0;
    long = context.read<SearchListStore>().detailItem['longitude'] ?? 0;
  }


  @override
  Widget build(BuildContext context) {
    safeArea = MediaQuery.of(context).padding;
    return Container(
      child: mapWidget(),
    );
  }

  /*
    --- Naver Map Widget ---
  */



  late NaverMapController mapController;

  NaverMapViewOptions options = NaverMapViewOptions(
    initialCameraPosition: NCameraPosition(
        target: NLatLng(33.33, 126.55),
        zoom: 8.45,
        bearing: 0,
        tilt: 0
    ),
  );

  Widget mapWidget() {
    final mapPadding = EdgeInsets.only(bottom: drawerHeight - safeArea.bottom);
    return NaverMap(
      options: options.copyWith(contentPadding: mapPadding),
      onMapReady: onMapReady,
      onMapTapped: onMapTapped,
      onSymbolTapped: onSymbolTapped,
      onCameraChange: onCameraChange,
      onCameraIdle: onCameraIdle,
      onSelectedIndoorChanged: onSelectedIndoorChanged,
    );
  }

  /* ----- Events ----- */

  void onMapReady(NaverMapController controller) {
    mapController = controller;

    final marker1 = NMarker(id: '1', position: NLatLng(lat, long));

// 지도에 하나씩 추가
    mapController.addOverlay(marker1);
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    // ...
  }

  void onSymbolTapped(NSymbolInfo symbolInfo) {
    // ...
  }

  void onCameraChange(NCameraUpdateReason reason, bool isGesture) {
    // ...
  }

  void onCameraIdle() {
    // ...
  }

  void onSelectedIndoorChanged(NSelectedIndoor? selectedIndoor) {
    // ...
  }

  /*
    --- Bottom Drawer Widget ---
  */


  Widget _cameraMoveTestPage() {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: const [
          //
          // // todo
          // Text("_cameraMoveTestPage"),
          // Text("카메라 이동"),
          //
        ]));
  }

  Widget _controllerTestPage() {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: const [
          // todo
          Text("_etcControllerTestPage"),
          Text("기타 컨트롤러 기능"),
        ]));
  }

  Widget _pickTestPage() {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: const [
          // todo
          Text("_pickTestPage"),
          Text("주변 심볼 및 오버레이 가져오기"),
        ]));
  }
}