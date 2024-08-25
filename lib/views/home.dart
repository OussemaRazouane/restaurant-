import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rest/constant/constant.dart';
import 'package:rest/widgets/topiclists.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context); 
    return SafeArea(
      child:Scaffold(
        body:Container(
          width: ScreenSize.constWidth,
          height: ScreenSize.constHeight,
          decoration:const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage("assets/bg.jpg"),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: ScreenSize.constWidth,
                  height: ScreenSize.constHeight/1.45,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ) ,
                  ),
                  child:const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuTopic(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:ScreenSize.constHeight/4.5 ,
                child: CircleAvatar(
                  radius: ScreenSize.constWidth/6.5,
                  backgroundImage:const AssetImage("assets/logo.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}