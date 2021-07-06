import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gsg_project_1/data/data_paint.dart';
import 'package:gsg_project_1/model/painting_model.dart';
import 'package:gsg_project_1/ui/home_page/grid_view_paint_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'What painting style are you looking for?',
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/icon_bell.png',
                width: 36,
                height: 36,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Color(0xFF47292A),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Color(0xFFBCBCBD),
            unselectedLabelStyle: Theme.of(context).textTheme.headline3,
            labelStyle: Theme.of(context).textTheme.headline2,
            labelColor: Color(0xFF47292A),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Abstract Art'),
              Tab(text: 'Conceptual Art'),
              Tab(text: 'Hyperrealism'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Show All Paint
            GridViewPaintWidget(paint: DataPaint.dataPaint.paint),

            // Show Abstract Art Paint
            GridViewPaintWidget(
                paint: DataPaint.dataPaint.paint
                    .where((painting) =>
                        painting.categoriesPainting ==
                        CategoriesPainting.Abstract)
                    .toList()),

            // Show Conceptual Art Paint
            GridViewPaintWidget(
                paint: DataPaint.dataPaint.paint
                    .where((painting) =>
                        painting.categoriesPainting ==
                        CategoriesPainting.Conceptual)
                    .toList()),

            // Show Hyperrealism Paint
            GridViewPaintWidget(
              paint: DataPaint.dataPaint.paint
                  .where((painting) =>
                      painting.categoriesPainting ==
                      CategoriesPainting.Hyperrealism)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
