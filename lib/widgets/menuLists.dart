import 'package:flutter/material.dart';
import 'package:rest/constant/constant.dart';
import 'package:rest/models/menu.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key, required this.selectedTopic});
  final String selectedTopic;
  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  Map<String, List<MenuModel>> menuMap = {
    "pizza": pizzaList,
    "burger": burgerList,
    "pasta": pastaList,
    "soup": soupList,
    "shawerma": shawermaList,
    "grilled": grilledList,
  };
  @override
  Widget build(BuildContext context) {
    List<MenuModel> menuList = menuMap[widget.selectedTopic] ?? [];
    return Expanded(
      child: GridView.builder(
        physics:const BouncingScrollPhysics() ,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: menuList.length,
        itemBuilder: (BuildContext context,index){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              width:ScreenSize.constWidth/2,
              height: ScreenSize.constHeight/3,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image:AssetImage(menuList[index].img),
                  fit: BoxFit.fill,
                ),
              ),
              child:Container(
                width: double.infinity,
                height:78,
                decoration:const BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(110, 82, 81, 81),
                ),
                child:Column(
                  children: [
                    Text(
                      menuList[index].name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      menuList[index].weight,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      width:50,
                      decoration:const BoxDecoration(
                        color:kPrimaryColor,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        menuList[index].price,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
