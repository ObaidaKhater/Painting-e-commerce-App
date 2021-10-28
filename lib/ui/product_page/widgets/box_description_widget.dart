import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_project_1/providers/card_provider.dart';
import 'package:gsg_project_1/providers/product_provider.dart';
import 'package:gsg_project_1/ui/constant_values.dart';
import 'package:gsg_project_1/ui/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class BoxDescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CardProvider>(
        builder: (context, productProvider, cardProvider, x) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.33,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0),
                      child: Text(
                        productProvider.product.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '\$${productProvider.product.price.toInt()}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
              Divider(color: Color(0xFFA8A8A8).withOpacity(0.2), height: 10),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          ExactAssetImage(userImage),
                    ),
                    SizedBox(width: 15),
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ]),
                  SizedBox(height: 15),
                  Text(productProvider.product.description,
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              SizedBox(height: 20),
              CustomButtonWidget(
                onTap: () => cardProvider.addProductToCard(productProvider.product),
                label: productButtonName,
              ),
            ],
          ),
        ),
      );
    });
  }
}
