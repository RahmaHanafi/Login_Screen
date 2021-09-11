import 'package:flutter/material.dart';
import 'package:login_screen/models/clothes/clothes_model.dart';
import 'package:login_screen/shared/components/components.dart';

class ClothesMenu extends StatefulWidget {
  @override
  _ClothesMenuState createState() => _ClothesMenuState();
}

class _ClothesMenuState extends State<ClothesMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: defaultIconButton(iconButton:Icons.arrow_back,
              onPressedFunction: (){
                Navigator.pop(context);
              }
              ),
          title: Text('DISCOVER',style: TextStyle(color: Colors.black87),),
          actions: [
            defaultIconButton(iconButton: Icons.shopping_cart,
                onPressedFunction: (){}
                ),
            defaultIconButton(iconButton: Icons.close,iconColor: Colors.pink,
                onPressedFunction: (){}
            ),
          ],
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Jackets',),
              Tab(text: 'Trousers',),
              Tab(text: 'TShirts',),
              Tab(text: 'Shoes',),
            ],
            labelColor: Colors.black,
            indicatorColor: Colors.yellow,
          ),
        ),
        body: TabBarView(
            children: [
              defaultGridViewList(
                  itembuild: (context,index)=>defaultJackets(jackets[index]),
                  list: jackets,
              ),
              SizedBox(),
              defaultGridViewList(
                  itembuild: (context,index)=>defaultTshirts(shirts[index]),
                  list: shirts,
              ),
              SizedBox(),
            ],
          ),
      ),
    );
  }
}