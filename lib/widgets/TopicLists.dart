import 'package:flutter/material.dart';
import 'package:rest/constant/constant.dart';

class MenuTopic extends StatefulWidget {
  const MenuTopic({super.key});

  @override
  State<MenuTopic> createState() => _MenuTopicState();
}

class _MenuTopicState extends State<MenuTopic> {
  List topic = [
    "pizza",
    "burger",
    "pasta",
    "soup",
    "shawerma",
    "grilled",
  ];
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SizedBox(
      height: ScreenSize.constHeight/12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics:const BouncingScrollPhysics(),
        itemCount: topic.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              width: ScreenSize.constWidth/5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kprimaryColor,
              ),
              child: Text(topic[index],style:const TextStyle(fontSize: 17,fontWeight:FontWeight.bold )),
            ),
          ) ;
        },
      ),
    );
  }
}
