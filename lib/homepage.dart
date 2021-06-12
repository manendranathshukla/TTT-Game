import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  To add Icon Image

  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(
    Icons.edit,
    size: 80,
  );

// Initialize Box With Empty Value

  bool isCross = true;
  String message = "";
  List<String> gameState = [];

  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

// To Play Game
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWon();
      });
    }
  }

  // Reset Game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
    });
  }

// To get Icon Image

  Icon getIcon(String title) {
    switch (title) {
      case ("cross"):
        return cross;
        break;
      case ("circle"):
        return circle;
        break;
    }
    return edit;
  }

// To Check For Wonning

  checkWon() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = this.gameState[0] + " Won";
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = this.gameState[3] + " Won";
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = this.gameState[6] + " Won";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = this.gameState[0] + " Won";
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = this.gameState[1] + " Won";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = this.gameState[2] + " Won";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = this.gameState[0] + " Won";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = this.gameState[2] + " Won";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIC TOC TOE"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: gameState.length,
                  itemBuilder: (context, index) => SizedBox(
                        width: 100,
                        height: 100,
                        child: MaterialButton(
                          onPressed: () {
                            this.playGame(index);
                          },
                          child: getIcon(this.gameState[index]),
                        ),
                      ))),
          SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: createButton(Colors.red, 'red'),
            // child: MaterialButton(
            //   color: Colors.blue[800],
            //   minWidth: 200,
            //   onPressed: resetGame,
            //   child: Text(
            //     "Reset Game",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ),
          SizedBox(
            height: 100,
          ),
          Text("Developed By: Manendra Nath Shukla")
        ],
      ),
    );
  }

  RaisedButton createButton(Color color, String name) {
    return RaisedButton(
      padding: EdgeInsets.all(16),
      color: color,
      onPressed: resetGame,
      textColor: Colors.white,
      child: Center(
        child: Text(
          'Reset Game',
          style: TextStyle(fontSize: 20),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
