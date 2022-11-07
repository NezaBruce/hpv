import 'package:chtt/models/cart.dart';
import 'package:chtt/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget{
  const MyCatalog({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context,index) => _MyListItem(index)
            ),
          )
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget{
  final Item item;
  const _AddButton({required this.item});
  @override
  Widget build(BuildContext context){
        // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isInCart = context.select<CartModel,bool>(
      (cart) => cart.items.contains(item)
    );
    return TextButton(
      onPressed: isInCart
      ? null
      : () {
                      // If the item is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var cart = context.read<CartModel>();
              cart.add(item);

      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((state){
          if(state.contains(MaterialState.pressed)){
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ), child: isInCart
                  ? const Icon(Icons.check,semanticLabel:"added")
                  : const Text("ADD")
    );
  }
}

class _MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SliverAppBar(
      title: Text("Catalog",style: Theme.of(context).textTheme.displayLarge,),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: (() => Navigator.pushNamed(context, '/cart')),
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget{
  final int index;
  const _MyListItem(this.index);
  @override 
  Widget build(BuildContext context){
    var item = context.select<CatalogModel,Item>(
      (catalog) => catalog.getByPosition(index)
    );

    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(  
                color: item.color,
              ),
            ),
            const SizedBox(width: 24,),
            Expanded(
              child: Text(item.name,style:textTheme),
            ),
            const SizedBox(width: 24,),
            _AddButton(item: item)
          ],
        ),
      ),
    );
  }
}