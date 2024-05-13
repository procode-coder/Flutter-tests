import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;
  final List data;

  const HomePage({Key? key, required this.username, required this.data})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCardName;
  Color? selectedCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCardName != null ? selectedCardName! : 'Home',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: selectedCardColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome to the Home Page! ${widget.username}'),
            const SizedBox(height: 30),
            ...List.generate(widget.data.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCardName = widget.data[index]["phone"];
                    selectedCardColor = _getColor(widget.data[index]["color"]);
                  });
                  print('Tapped on ${widget.data[index]["phone"]} card.');
                },
                child: SizedBox(
                  width: 500,
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: _getColor(widget.data[index]["color"]),
                      child: Text(
                        widget.data[index]["phone"],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "black":
        return Colors.black;
      case "yellow":
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
