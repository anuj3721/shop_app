import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String? id;
  final String? productId;
  final String? title;
  final double? price;
  final int? quantity;

  CartItem({this.id, this.productId, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId!);
        // this doesn't listen but the cart_screen listens and rebuild when an item is removed
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: FittedBox(
              child: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text('\$$price',style: TextStyle(fontSize: 12),),
                ),
              ),
            ),
            title: Text(title!),
            subtitle: Text('Total \$ ${quantity! * price!}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
