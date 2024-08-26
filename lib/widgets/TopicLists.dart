import 'package:flutter/material.dart';
import 'package:rest/constant/constant.dart';

class MenuTopic extends StatefulWidget {
  const MenuTopic({super.key, required this.selectedTopic, required this.onSelected});
  final String? selectedTopic;
  final ValueChanged<String> onSelected;
  @override
  State<MenuTopic> createState() => _MenuTopicState();
}

class _MenuTopicState extends State<MenuTopic> {
  bool isSelected = false;
  List topics = [
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
      height: ScreenSize.constHeight / 12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          isSelected = topics[index] == widget.selectedTopic;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.onSelected(topics[index]);
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenSize.constWidth / 4.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? Colors.grey : kPrimaryColor,
                ),
                child: Text(topics[index],
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },
      ),
    );
  }
}
