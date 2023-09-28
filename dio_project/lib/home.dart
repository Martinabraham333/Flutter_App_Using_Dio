import 'package:dio_project/fectProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
    appBar: AppBar(),
    body: Padding(padding: EdgeInsets.all(8),
      child: Column(

        children: [

          Expanded(
      child: FutureBuilder(
                future:fetchProducts() ,
                builder:(context, snapshot) {
                  if(snapshot.hasData){
                     
                     return Container(
                       child:  StaggeredGridView.countBuilder(
                         physics: BouncingScrollPhysics(),
                           // shrinkWrap: true,
                         crossAxisCount: 2,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final product=snapshot.data![index];
                          return InkWell(
                            onTap: (){
                                
                            },

                            child: Container(
                              child: Card(
                                child:Column(
                                children: [
                                  Image(image: NetworkImage('http://bootcamp.cyralearnings.com/products/'+product.image!)),
                                  Text(product.productname!),
                      Text("RS:${product.price.toString()}",style: TextStyle(color: Colors.red),)
                                ],
                              ),
                              )
                            )
                          );
                        }, staggeredTileBuilder: (int index) { 
                          return StaggeredTile.fit(1);
                         }, 
                        ) 
                     );
                  }

                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
                 )
      
      )

        ],
      ),
    
    ),

      
    );
  }
}