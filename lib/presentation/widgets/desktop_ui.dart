import 'package:flutter/material.dart';

class DesktopUi extends StatelessWidget {
  const DesktopUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OSTAD"),
        actions: [
          // I can't catch the words it is so blurry
          // That's why I put the random Text Button
          TextButton(onPressed: () {}, child: Text("Explore")),
          TextButton(onPressed: () {}, child: Text("About")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header
                  Text(
                    "FLUTTER WEB.\nTHE BASICS",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Body
                  Text(
                    "Flutter is a free, open-source framework from Google that allows developers to build applications for multiple platforms using a single codebase. It's used to create the user interface (UI) for apps on mobile, web, desktop, and embedded devices.",
                    maxLines: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32,),
            Flexible(
                fit: FlexFit.loose,
                child: Center(
                    child: FilledButton(
                      style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder()), backgroundColor: WidgetStatePropertyAll(Colors.teal)),
                        onPressed: () {}, child: Text("Get Started"))))
          ],
        ),
      ),
    );
  }
}
