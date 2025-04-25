import 'package:flutter/material.dart';

List<dynamic> stockList=[];
class stock{
  String hotelName,category,name,description;
  num price,qty;
  String image;
  stock({required this.hotelName,required this.category,required this.name,
    required this.description,required this.price,required this.qty,
    required this.image});
}
class ItemsPage extends StatefulWidget{
  const ItemsPage({Key? key, required this.title}): super(key: key);
  final String title;
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}
class _ItemsPageState extends State<ItemsPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Form(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:stockList.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(2.0),
              color:Colors.white,
              child:Flexible(
                child: ListTile(
                  //leading: 
                  title: Text('${stockList[index].name}',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      )
                  ),
                  subtitle:Text('${stockList[index].hotelName}'
                  '\t ${stockList[index].category}\t ${stockList[index].qty}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                      )
                  ),
                  trailing: Text('KShs ${stockList[index].price}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                      )
                  ),
                  onTap:(){},
                  onLongPress:(){}
                )
              )
            );
          }      
        ),
      )
    );
  }
}