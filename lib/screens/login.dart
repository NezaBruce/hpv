import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget{
const MyLogin({super.key});

@override
Widget build(BuildContext context){

return Scaffold(
 body: Center(  
  child: Container(  
    padding: const EdgeInsets.all(80.0),
    child: Column(  
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'username'
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'password'
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(  
          onPressed:() {
           Navigator.pushReplacementNamed(context,'/catalog');
          },
          style: ElevatedButton.styleFrom(foregroundColor: Colors.amber),
          child: const Text('Submit'),
        )
      ],
    ),
  ),
 ), 
);
}

}