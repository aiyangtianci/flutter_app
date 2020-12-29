import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

void main() => runApp(new MaterialApp(
      title: '页面跳转',
      home: new NavigatorDemo(),
    ));

class NavigatorDemo extends StatelessWidget {
  final List<Product> products =
      List.generate(20, (i) => new Product('商品${i}', '这是一个商品详情${i}'));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('商品列表'),
        ),
        body: new ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: Text(products[index].title),
                leading: Icon(Icons.add_comment),
                onTap: () {
                  _navigatetoSecondScreen(context, products[index]);
                },
              );
            }));
  }
}

/**
 * 跳转方法+回传值 result
 */
_navigatetoSecondScreen(BuildContext context, Product product) async {
  final result = await Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
              new SecondScreen(product.title, product.description),
      ),
  );
  Scaffold.of(context).showSnackBar(new SnackBar(content: Text('${result}')));
}

class SecondScreen extends StatelessWidget {
  final String title;
  final String description;

  SecondScreen(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('商品详情'),
        ),
        body: new Center(
              child: new RaisedButton(
                child: Text('${title}:${description}\n 点击回传字符串“hi flutter”',textAlign: TextAlign.center,),
                onPressed: () {
                  Navigator.pop(context,'hi ,flutter,I am ${title}');
                },
              ),
            ),
        );
  }
}
