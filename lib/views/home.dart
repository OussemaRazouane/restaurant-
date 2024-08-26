import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rest/constant/constant.dart';
import 'package:rest/models/menu.dart';
import 'package:rest/widgets/menuLists.dart';
import 'package:rest/widgets/topiclists.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController(text: "Resturant");
  String selectedTopic = "pizza";
  void updatesSelectedTopic(String selected) {
    setState(() {
      selectedTopic = selected;
    });
  }

  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ScreenSize.constWidth,
          height: ScreenSize.constHeight,
          decoration: const BoxDecoration(
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
                  height: ScreenSize.constHeight / 1.45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenSize.constHeight / 11.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name.text,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title:
                                            const Text("Enter resturant name"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Form(
                                              key:key,
                                              child: TextFormField(
                                                controller: name,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Write th name of the resturant";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  if(key.currentState!.validate()==true)
                                                  {Navigator.pop(context);}
                                                },
                                                child: const Text('Save'))
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                      MenuTopic(
                        selectedTopic: selectedTopic,
                        onSelected: updatesSelectedTopic,
                      ),
                      MenuList(
                        selectedTopic: selectedTopic,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: ScreenSize.constHeight / 4.5,
                child: CircleAvatar(
                  radius: ScreenSize.constWidth / 6.5,
                  backgroundImage: const AssetImage("assets/logo.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
