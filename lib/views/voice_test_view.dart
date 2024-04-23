import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceTestView extends StatefulWidget {
  const VoiceTestView({Key? key}) : super(key: key);

  @override
  _VoiceTestViewState createState() => _VoiceTestViewState();
}

class _VoiceTestViewState extends State<VoiceTestView> {
  final SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  Color _circleColor = Colors.green;
  List<String> _lastWords = [];
  String _currentWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  void dispose() {
    super.dispose();
    _stopListening();
  }

  void _initSpeech() async {
    bool available = await _speech.initialize(
      onError: (error) => print(error.errorMsg),
      onStatus: (status) async {
        if (status == "notListening" && _isListening) {
          _startListening();
        }
      },
    );
    if (available) {
      _isListening = true;
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  void _startListening() async {
    await _stopListening();
    await Future.delayed(const Duration(milliseconds: 50));
    _speech.listen(
      onResult: (val) => setState(() {
        _currentWords = val.recognizedWords;
        if (_currentWords == 'vermelho' || _currentWords == 'Vermelho')
          _circleColor = Colors.red;
        else if (_currentWords == 'azul' || _currentWords == 'Azul')
          _circleColor = Colors.blue;
        else if (_currentWords == 'amarelo' || _currentWords == 'Amarelo')
          _circleColor = Colors.yellow;
        else if (_currentWords == 'verde' || _currentWords == 'Verde')
          _circleColor = Colors.green;
        else if (_currentWords == 'roxo' || _currentWords == 'Roxo')
          _circleColor = Colors.purple;
        else if (_currentWords == 'laranja' || _currentWords == 'Laranja')
          _circleColor = Colors.orange;
        else if (_currentWords == 'rosa' || _currentWords == 'Rosa')
          _circleColor = Colors.pink;
        else if (_currentWords == 'preto' || _currentWords == 'Preto')
          _circleColor = Colors.black;
        else if (_currentWords == 'branco' || _currentWords == 'Branco')
          _circleColor = Colors.white;
        else if (_currentWords == 'cinza' || _currentWords == 'Cinza')
          _circleColor = Colors.grey;
        else if (_currentWords == 'marrom' || _currentWords == 'Marrom')
          _circleColor = Colors.brown;
        else if (_currentWords == 'ciano' || _currentWords == 'Ciano')
          _circleColor = Colors.cyan;
        else if (_currentWords == 'amarelo' || _currentWords == 'Amarelo')
          _circleColor = Colors.yellow;
        else if (_currentWords == 'transparente' ||
            _currentWords == 'Transparente')
          _circleColor = Colors.transparent;
        else if (_currentWords == 'aleatório' || _currentWords == 'Aleatório')
          _circleColor =
              Colors.primaries[Random().nextInt(Colors.primaries.length)];
        _lastWords.add(_currentWords);
        _currentWords = '';
        if (_lastWords.length > 1) {
          _lastWords.removeAt(0);
        }
      }),
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 10),
      // cancelOnError: true,
      // partialResults: true,
    );
    setState(() {
      _isListening = true;
    });
  }

  Future _stopListening() async {
    await _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Test'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _isListening ? Icons.mic : Icons.mic_off,
              color: _isListening ? Colors.green : Colors.red,
            ),
            onPressed: () {
              if (_isListening) {
                _stopListening();
              } else {
                _startListening();
              }
              setState(() {}); // Atualiza a UI
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: _circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 20),
                Text('Última palavra: ${_lastWords.join(', ')}'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cores disponíveis:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Vermelho, Azul, Amarelo, Verde, Roxo, Laranja, Rosa, Preto, Branco, Cinza, Marrom, Ciano, Transparente, Aleatório'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
