import 'package:flutter/material.dart';
import 'package:gsg_project_1/providers/card_provider.dart';
import 'package:gsg_project_1/ui/card_page/widgets/custom_item_card_widget.dart';
import 'package:gsg_project_1/ui/card_page/widgets/custom_total_price_card_widget.dart';
import 'package:gsg_project_1/ui/widgets/custom_button_widget.dart';
import 'package:gsg_project_1/ui/widgets/custom_loading_widget.dart';
import 'package:provider/provider.dart';

import '../constant_values.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My Card',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: (provider.cardProducts == null)
            ? CustomLoadingWidget()
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: provider.cardProducts.length,
                          itemBuilder: (context, index) {
                            return CustomItemCardWidget(
                              product: provider.cardProducts[index],
                            );
                          }),
                    ),
                  ),
                  CustomTotalPriceCardWidget(),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: CustomButtonWidget(
                      label: checkoutText,
                      onTap: () => provider.checkoutCard(),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
