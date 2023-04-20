import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetGetLocalstorag extends StatefulWidget {
  const SetGetLocalstorag({Key? key}) : super(key: key);

  @override
  State<SetGetLocalstorag> createState() => _SetGetLocalstoragState();
}

class _SetGetLocalstoragState extends State<SetGetLocalstorag> {
  SharedPreferences? prefs;
  String? stringData = "";
  int? intData = 0;
  bool? BoolData = false;
  double? DoubleData = 11.2;
  List? ListData = ['pinal', 'priyanshi'];

  setInstant() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Local Storag",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(
                  CircleBorder(
                    side: BorderSide(
                      width: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                fixedSize: MaterialStatePropertyAll(
                  Size(120, 80),
                ),
              ),
              onPressed: () {
                prefs!.setString("name", "pinal");
                prefs!.setString("last_name", "trapasiya");
                prefs!.setBool("hello", true);
                prefs!.setDouble("pinal", 5.3);
                prefs!.setInt("number", 9909874386);
                prefs!.setStringList('items', <String>['work', 'car', 'name']);
              },
              child: const Text("Set Data"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(
                  CircleBorder(
                    side: BorderSide(
                      width: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                fixedSize: MaterialStatePropertyAll(
                  Size(120, 80),
                ),
              ),
              onPressed: () {
                if (prefs!.containsKey("last_name")) {
                  stringData = prefs!.getString("last_name");
                  BoolData = prefs!.getBool("hello");
                  DoubleData = prefs!.getDouble("pinal");
                  intData = prefs!.getInt("number");
                  ListData = prefs!.getStringList("items");
                  setState(() {});
                } else {
                  debugPrint("No Data");
                }
              },
              child: const Text("Get Data"),
            ),
            const SizedBox(height: 15),
            Text(
              BoolData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              stringData!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              intData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ListData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              DoubleData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
