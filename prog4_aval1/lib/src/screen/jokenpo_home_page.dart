// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';

class JokenpoHomePage extends StatefulWidget {
  const JokenpoHomePage({super.key});

  @override
  _JokenpoHomePageState createState() => _JokenpoHomePageState();
}

class _JokenpoHomePageState extends State<JokenpoHomePage> {
  String _result = '';
  String _playerChoice = '';
  String _computerChoice = '';
  String _previousComputerChoice = '';
  int _playerScore = 0;
  int _computerScore = 0;
  var _imagemApp = const AssetImage("assets/images/padrao.png");

  final List<String> _choices = ['Pedra', 'Papel', 'Tesoura'];

  void _playGame(String playerChoice) {
    setState(() {
      if (_playerChoice == playerChoice) {
        _result = 'Escolha outro gesto!';
        return;
      }

      _playerChoice = playerChoice;

      final Random random = Random();
      int computerIndex;
      do {
        computerIndex = random.nextInt(3);
      } while (_choices[computerIndex] == _playerChoice ||
          _choices[computerIndex] == _previousComputerChoice);

      _previousComputerChoice = _computerChoice;
      _computerChoice = _choices[computerIndex];

      _result = _getResult(_playerChoice, _computerChoice)!;

      if (_result == "Você venceu!") {
        _playerScore++;
      } else if (_result == "Você perdeu!") {
        _computerScore++;
      }
    });
  }

  String? _getResult(String playerChoice, String computerChoice) {
    //Exibição da imagem escolhida pelo App
    switch (_computerChoice) {
      case "Pedra":
        setState(() {
          _imagemApp = const AssetImage("assets/images/pedra.png");
        });
        break;
      case "Papel":
        setState(() {
          _imagemApp = const AssetImage("assets/images/papel.png");
        });
        break;
      case "Tesoura":
        setState(() {
          _imagemApp = const AssetImage("assets/images/tesoura.png");
        });
        break;
    }

    Map<String, String> resultMappings = {
      'PedraTesoura': 'Você venceu!',
      'PapelPedra': 'Você venceu!',
      'TesouraPapel': 'Você venceu!',
      'PedraPapel': 'Você perdeu!',
      'PapelTesoura': 'Você perdeu!',
      'TesouraPedra': 'Você perdeu!',
    };

    if (playerChoice == computerChoice) {
      return 'Empate!';
    }

    String key = playerChoice + computerChoice;
    return resultMappings.containsKey(key) ? resultMappings[key] : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Image(
                image: _imagemApp,
                height: 122,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 22),
              child: Text(
                'Escolha sua jogada:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _playGame('Pedra'),
                  child: Image.asset('assets/images/pedra.png', height: 95),
                ),
                GestureDetector(
                  onTap: () => _playGame('Papel'),
                  child: Image.asset('assets/images/papel.png', height: 95),
                ),
                GestureDetector(
                  onTap: () => _playGame('Tesoura'),
                  child: Image.asset('assets/images/tesoura.png', height: 95),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Container(
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.purple.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(
                        "Placar",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Usuário: $_playerScore",
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Computador: $_computerScore",
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        },
        child: const Icon(Icons.replay_sharp),
      ),
    );
  }
}