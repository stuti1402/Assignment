import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


import '../BeanData/menu_bean.dart';
import '../ViewModels/ItemAddVm.dart';
import '../utility/ui_utility.dart';

class ItemAddPage extends StatelessWidget {
  const ItemAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemAddVm>.reactive(
        viewModelBuilder: () => ItemAddVm(),
        builder: (context, itemAddVm, widget) => menuUi(context, itemAddVm));
  }

  Widget menuUi(context, ItemAddVm itemAddVm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Menu Screen"),
      ),
      body: ListView.builder(
        itemCount: itemAddVm.menuItems.length,
        itemBuilder: (context, index) {
          return singleChildrenUi(
              itemAddVm.menuItems.elementAt(index), itemAddVm,context);
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0) //
              ),
        ),
        margin: const EdgeInsets.only(left: 7, right: 7, bottom: 7),
        height: MediaQuery.of(context).size.height * .07,
        child: ElevatedButton(
          onPressed: () {
            itemAddVm.handleOrderPlaced().then((value){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => this));
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Place Order",
                style: whiteNormalText(),
              ),
              const Spacer(),
              Text(
                "\$${itemAddVm.totalPayableAmount}",
                style: whiteNormalText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleChildrenUi(MenuBean menuBean, ItemAddVm viewModel, BuildContext context) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            menuBean.category ?? "",
            style: normalText(),
          ),
          const Spacer(),
          Text(
            "${menuBean.products?.length ?? ""}",
            style: greyNormalText(),
          ),

        ],
      ),
      children: menuBean.products
              ?.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2.0),
                    child: productsView(e, viewModel,context),
                  ))
              .toList() ??
          [],
    );
  }

  Widget productsView(Product product, ItemAddVm viewModel, BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titlePriceView(product),
          const SizedBox(width: 10),
          bestSellerUi(product),
          const Spacer(),
          Container(
              width: MediaQuery.of(context).size.width*.2,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.orange,
                  width: 2, //
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15.0) //
                    ),
              ),
              child: product.count > 0
                  ? Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.remove,
                            color: Colors.orange,
                          ),
                          onTap: () {
                            viewModel.handleElementAdd(product, isAdd: false);
                          },
                        ),
                        const Spacer(),
                        Container(
                          height: 30,width: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                          shape:BoxShape.circle,
                          ),
                            child: Center(child:Text(
                          product.count.toString(),
                          style: whiteSmallText()
                        ),),),
                        const Spacer(),
                        InkWell(
                          child: const Icon(
                            Icons.add,
                            color: Colors.orange,
                          ),
                          onTap: () {
                            viewModel.handleElementAdd(product);
                          },
                        ),
                      ],
                    )
                  : InkWell(
                      child: Text(
                        "Add",
                        style: whiteOrangeText(),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        viewModel.handleElementAdd(product);
                      },
                    ))
        ],
      ),
    );
  }

  Widget titlePriceView(Product product) {

    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 5,bottom: 5,left: 3),
    child:Text(
          product.name ?? "",
          style: normalText(),
        ),),
        const SizedBox(
          height: 4,
        ),

        Padding(padding: EdgeInsets.only(left: 0),child:Text(
          "\$ ${product.price?.toString() ?? ""}",
          style: greyNormalText(),
        ),),
      ],
    );
  }

  Widget bestSellerUi(Product product) {
    return product.isBestSeller
        ? Container(
            padding: const EdgeInsets.all(7.0),
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(15.0) //
                  ),
            ),
            child: Text(
              "Best Seller",
              style: whiteSmallText(),
            ),
          )
        : const SizedBox();
  }
}
