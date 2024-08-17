import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Settings'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool switchValueID =
      true; //initial values of switches (values do not change in this example)
  bool switchValuePIN = false;

  @override
  Widget build(BuildContext context) {
    double margin = MediaQuery.sizeOf(context).width *
        0.05; //container margin depends on screen width
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            //leading back icon currently does nothing when pressed
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Title(title: "Security Settings"), //using Title custom widget
            Container(
                margin: EdgeInsets.only(
                    left: margin,
                    right: margin), //same margin on left and right
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    //border decoration for every field
                    shape: BoxShape.rectangle,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    TextSwitch(
                        text: 'Face ID',
                        switchValue:
                            switchValueID), //using TextSwitch custom widget
                    TextSwitch(text: 'PIN', switchValue: switchValuePIN),
                    const TextIcon(
                        //using TextIcon custom widget
                        text: "Change PIN",
                        icon: Icon(Icons.arrow_forward_ios)),
                  ],
                )),
            const Title(title: "Password"),
            Container(
              //same box decoration for every field
              margin: EdgeInsets.only(left: margin, right: margin),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: const TextIcon(
                  text: "Change PIN", icon: Icon(Icons.arrow_forward_ios)),
            ),
            const Title(title: 'Approved adresses'),
            Container(
                margin: EdgeInsets.only(left: margin, right: margin),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    TextIcon(
                        text: "Manage", icon: Icon(Icons.arrow_forward_ios)),
                  ],
                )),
            const Title(title: "Security Keys"),
            Container(
                margin: EdgeInsets.only(left: margin, right: margin),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Icon(Icons.add, color: Colors.blue),
                    Expanded(
                        child: TextIcon(
                            text: "Add security keys",
                            icon: Icon(Icons.arrow_forward_ios))),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

//Title widget constructor takes title as a string parameter
class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
          ),
        ),
      ],
    );
  }
}

//TextIcon widget takes a text and an icon and
//creates a custom button with expanded width.

class TextIcon extends StatelessWidget {
  const TextIcon({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text), icon],
        ),
      ),
    );
  }
}

//TextSwitch widget takes a text and an icon and
//creates a custom cupertino switch with expanded width.

class TextSwitch extends StatelessWidget {
  const TextSwitch({
    super.key,
    required this.text,
    required this.switchValue,
  });

  final String text;
  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        CupertinoSwitch(
          value: switchValue,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
