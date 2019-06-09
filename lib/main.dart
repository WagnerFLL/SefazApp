import 'dart:convert';
import 'package:search/API.dart';
import 'package:search/models/Product.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(title: 'Search'),
    );
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {

  final TextEditingController searchControl = new TextEditingController();

  void _nextPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyListScreen(text: this.searchControl.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: searchControl,
                  decoration: InputDecoration(
                    labelText: "Produto",
                    hintText: "Leite"
                  ),
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      onPressed: _nextPage,
                      color: Colors.blue,
                      child: Text("Pesquisar"),
                      textColor: Colors.white,
                  ),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyListScreen extends StatefulWidget {
  MyListScreen({Key key, this.text}) : super(key: key);

  final String text;
  @override
  createState() => _MyListScreenState(this.text);
}

class _MyListScreenState extends State {
  var products = new List<Product>();
  String  text;
  _MyListScreenState(this. text);

  _getProducts(String desc) {
    API.getProducts(desc).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        print(list);
        products = list.map((model) => Product.fromJson(model)).toList();
      });
    });

  }

  initState() {
    super.initState();
    _getProducts(this.text);
  }

  dispose() {
    super.dispose();
  }

  Future<Null> _showDetail(num index) async {
    switch(
    await showDialog(
        context: context,
        child:  new SimpleDialog(
          title: new Text(products[index].dscProduto),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text("R\$ " + products[index].valMinimoVendido.toString())
              ),
            )
          ],
        )
    )) {}
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resultados"),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(products[index].nomRazaoSocial),
                subtitle: Text(products[index].valMinimoVendido.toString()),
                onTap: () => _showDetail(index)
            );
          },
        ));
  }
}