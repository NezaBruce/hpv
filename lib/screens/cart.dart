import 'package:chtt/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",style:Theme.of(context).textTheme.displayLarge,),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children:[
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(32),
              child: _CartList(),
            ),
          ),
          const  Divider(height: 4,color: Colors.black,),
          _CartTotal()
          ],
        ),
      ),
    );
  }
}
class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var itemnamestyle= Theme.of(context).textTheme.titleLarge;
       // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context,index)=> ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon:const Icon(Icons.remove_circle_outline_rounded),
          color: Colors.red,
          onPressed: () => {
            cart.remove(cart.items[index])
          },
        ),
        title: Text(cart.items[index].name,
        style: itemnamestyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    var hugeStyle = Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                        // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<CartModel>(
              builder: (context,cart,child)=>
                Text('\$${cart.totalPrice}',style: hugeStyle)),
            SizedBox(width: 24,),
            TextButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Buying not supported "))
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Text("Buy"),
            )
          ],
        ),
      ),
    );
  }
}