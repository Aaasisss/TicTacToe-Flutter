import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage ImageCross = AssetImage('images/cross.png');
  AssetImage ImageCircle = AssetImage('images/circle.png');
  AssetImage ImageEdit = AssetImage('images/edit.png');

  late bool isCross;
  late String winMessage;
  late List<String> gameState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      isCross = true;
      this.winMessage = '';
    });
  }

  resetGame() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      isCross = true;
      this.winMessage = '';
    });
  }

  getImage(String value) {
    switch (value) {
      case ('empty'):
        return ImageEdit;
        break;
      case ('cross'):
        return ImageCross;
        break;
      case ('circle'):
        return ImageCircle;
        break;
    }
  }

  playGame(int i) {
    if (gameState[i] == 'empty') {
      setState(() {
        if (isCross) {
          this.gameState[i] = 'cross';
        } else if (!isCross) {
          this.gameState[i] = 'circle';
        }
        isCross = !isCross;
        checkWinner(i);
      });
    }
  }

  checkWinner(i) {
    bool won = false;
    if (this.gameState[0] != 'empty' &&
        this.gameState[0] == this.gameState[1] &&
        this.gameState[1] == this.gameState[2]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[3] != 'empty' &&
        this.gameState[3] == this.gameState[4] &&
        this.gameState[4] == this.gameState[5]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[6] != 'empty' &&
        this.gameState[6] == this.gameState[7] &&
        this.gameState[7] == this.gameState[8]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[0] != 'empty' &&
        this.gameState[0] == this.gameState[3] &&
        this.gameState[3] == this.gameState[6]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[1] != 'empty' &&
        this.gameState[1] == this.gameState[4] &&
        this.gameState[4] == this.gameState[7]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[2] != 'empty' &&
        this.gameState[2] == this.gameState[5] &&
        this.gameState[5] == this.gameState[8]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[0] != 'empty' &&
        this.gameState[0] == this.gameState[4] &&
        this.gameState[4] == this.gameState[8]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    } else if (this.gameState[2] != 'empty' &&
        this.gameState[2] == this.gameState[4] &&
        this.gameState[4] == this.gameState[6]) {
      winMessage = ('The Winner is ${this.gameState[i]}');
      won = true;
    }
    if (won) {
      Future.delayed(Duration(seconds: 3), () => resetGame());
      print('${this.gameState[i]} wins');
    }
  }

  String displayMessage() {
    return winMessage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int i) {
                    return MaterialButton(
                      height: 100,
                      onPressed: () => playGame(i),
                      color: Colors.amber,
                      child: Center(
                        child: Image(
                          image: this.getImage(this.gameState[i]),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              displayMessage(),
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
            ),
            MaterialButton(
              onPressed: resetGame,
              color: Colors.orange,
              child: Text('RESET'),
            ),
            Container(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
