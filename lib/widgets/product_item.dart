import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({required this.id, required this.title, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context);
    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
          ),
          footer: GridTileBar(
            leading: IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black45,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              //style: TextStyle(fontSize: 9),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          ),
        ),
      ),
      //child:
    );
  }
}
