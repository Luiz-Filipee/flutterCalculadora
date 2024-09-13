import 'package:calculadoraapp/model/calculadora.dart';
import 'package:flutter/material.dart';

class Corpo extends StatefulWidget {
  @override
  State<Corpo> createState() {
    return CorpoEstado();
  }
}

class CorpoEstado extends State<Corpo> {
  TextEditingController _controller = new TextEditingController();
  double? _primeiroValor;
  double? _segundoValor;
  String? _operacao;
  String _tela = '';

  Calculadora calculadora = Calculadora();

  void _atualizarTela(String valor) {
    setState(() {
      _tela += valor;
      _controller.text = _tela;
    });
  }

  void _limparTela() {
    setState(() {
      _tela = '';
      _controller.text = '0';
      _primeiroValor = null;
      _segundoValor = null;
      _operacao = '';
    });
  }

  void _calculaResultado() {
    setState(() {
      _segundoValor = double.tryParse(_tela);

      if (_primeiroValor != null &&
          _segundoValor != null &&
          _operacao != null) {
        double resultado =
            calculadora.calcular(_operacao!, _primeiroValor!, _segundoValor!);
        _controller.text = resultado.toString();
        _tela = resultado.toString();
      }
    });
  }

  void _selecionaOperacao(String operacao) {
    setState(() {
      _primeiroValor = double.tryParse(_tela);
      _operacao = operacao;
      _tela = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 35.0),
                textAlign: TextAlign.end,
                controller: _controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '0',
                ),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _botaoNumero('9'),
            _botaoNumero('8'),
            _botaoNumero('7'),
            _botaoOperacao('+'),
          ]),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _botaoNumero('6'),
              _botaoNumero('5'),
              _botaoNumero('4'),
              _botaoOperacao('-'),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _botaoNumero('3'),
              _botaoNumero('2'),
              _botaoNumero('1'),
              _botaoOperacao('x'),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _botaoOperacao('/'),
              _botaoNumero('0'),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(70, 70)),
                      onPressed: _limparTela,
                      child: Text('C'))),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(70, 70)),
                      onPressed: _calculaResultado,
                      child: Text('='))),
            ],
          )
        ],
      ),
    ));
  }

  Widget _botaoNumero(String numero) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(70, 70)),
        onPressed: () {
          _atualizarTela(numero);
        },
        child: Text(numero),
      ),
    );
  }

  Widget _botaoOperacao(String operacao) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(70, 70)),
        onPressed: () {
          _selecionaOperacao(operacao);
        },
        child: Text(operacao),
      ),
    );
  }
}
