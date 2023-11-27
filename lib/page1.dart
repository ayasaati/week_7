import 'package:flutter/material.dart';
import 'page2.dart';
import 'employee.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //declare TextEditingController to retrieve value of the Text Fields
  final TextEditingController _controllerHours=TextEditingController();
  final TextEditingController _controllerRate = TextEditingController();


  //DESTRUCTOR
@override
void dispose(){
  _controllerRate.dispose();
  _controllerHours.dispose();
  super.dispose();
}

void openPage2(){
  try{
    int hours=int.parse(_controllerHours.text);
    double rate = double.parse(_controllerRate.text);
    Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>const Page2(),
 settings:RouteSettings(arguments: Employee(hours,rate))
        )
    );
  }
  catch(e){
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.purpleAccent,
       title: const Text("Page 1"),
       centerTitle: true,
     ),
body:Center(child:Column(children:[
  const SizedBox(height:10),
 SizedBox(width:200,height:50,
 child:TextField(controller:_controllerHours,keyboardType: TextInputType.number,decoration:const InputDecoration(border:OutlineInputBorder(),hintText: 'Enter hours')),
 ),
  const SizedBox(height:10),
  SizedBox(width:200,height:50,
    child:TextField(controller:_controllerRate,keyboardType: TextInputType.number,decoration:const InputDecoration(border:OutlineInputBorder(),hintText: 'Enter hours')),
  ),
  const SizedBox(height:10),
 ElevatedButton(onPressed: openPage2,

   child: const Icon(Icons.navigate_next,size:50)
  )
]),
),


    );
  }
}


