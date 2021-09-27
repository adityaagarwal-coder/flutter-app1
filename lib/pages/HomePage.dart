import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedata = jsonDecode(catalogjson);
    var productsdata = decodedata["products"];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromdata(item))
        .cast<Item>()
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(),
        body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ?
            // ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(item: CatalogModel.items[index]);
            //     },
            //   )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      child: GridTile(
                          header: Container(
                            child: Text(item.name),
                            decoration: BoxDecoration(),
                            padding: EdgeInsets.all(10),
                          ),
                          child: Image.network(item.image),
                          footer: Text(item.price.toString())));
                },
                itemCount: CatalogModel.items.length)
            : Center(
                child: CircularProgressIndicator(),
              ),
        drawer: MyDrawer());
  }
}
