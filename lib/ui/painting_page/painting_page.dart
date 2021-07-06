import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_project_1/model/painting_model.dart';
import 'package:gsg_project_1/ui/painting_page/box_description_widget.dart';
import 'package:gsg_project_1/ui/painting_page/close_widget.dart';
import 'package:gsg_project_1/ui/painting_page/indicator_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PaintingPage extends StatefulWidget {
  Painting painting;

  PaintingPage({@required this.painting});

  @override
  _PaintingPageState createState() => _PaintingPageState();
}

class _PaintingPageState extends State<PaintingPage> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.painting.imagesPath.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: widget.painting.imagesPath.length,
                  itemBuilder: (context, index) {
                    return Image.asset(widget.painting.imagesPath[index],
                        fit: BoxFit.cover);
                  },
                  onPageChanged: (newIndex) {
                    _currentIndex = newIndex;
                    setState(() {});
                  },
                  controller: PageController(
                    initialPage: widget.painting.imagesPath.length ~/ 2,
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.36,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IndicatorWidget(
                    currentIndex: _currentIndex,
                    countItems: widget.painting.imagesPath.length,
                  ),
                  BoxDescriptionWidget(painting: widget.painting),
                ],
              ),
            ),
          ),
          CloseWidget(),
        ],
      ),
    );
  }
}
