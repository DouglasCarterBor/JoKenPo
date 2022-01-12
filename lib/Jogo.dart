import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _imagemUsuario = AssetImage ("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  var _mensagemEscolha = "Escolha do usuário";
  var _mensagemJogarNovamente = "";

  void _opcaoSelecionada(String escolhaUsuario){

 var opcoes = ["pedra","papel","tesoura"];
 var numero = Random().nextInt(3);
 var escolhaApp = opcoes[numero];

 //Exibição de imagem escolhida pelo Usuário
 switch ( escolhaUsuario ) {
   case"pedra":
     setState(() {
       this._imagemUsuario = AssetImage("images/pedra.png");
     });
     break;
   case"papel":
     setState(() {
       this._imagemUsuario = AssetImage("images/papel.png");
     });
     break;
   case"tesoura":
     setState(() {
       this._imagemUsuario = AssetImage("images/tesoura.png");
     });
break;

 }


 //print("Escolha do App: "+ escolhaApp);
 //print("Escolha do usuario: "+ escolhaUsuario);

 //Exibição da imagem escolhida pelo App
 switch ( escolhaApp ){
   case "pedra":
     setState(() {
       this._imagemApp = AssetImage("images/pedra.png");
     });
   break;
  case "papel":
    setState(() {
      this._imagemApp = AssetImage("images/papel.png");
    });
    break;
   case"tesoura":
     setState(() {
       this._imagemApp = AssetImage("images/tesoura.png");
     });
    break;
 }
//Validação do ganhador
    //Usuário Ganhador
  if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
  ){
    setState(() {
      this._mensagem = "Resultado Parabéns!!! Você ganhou :)";
    });
  }

  //App Ganhador
    else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
      ){
      setState(() {
        this._mensagem = "Resultado: Você perdeu :(";
      });

  }else{
      setState(() {
        this._mensagem = "Resultado: Empatamos ;)";
      });
  }
    //Condição para imprimir a mensagem de imprimir novamente
    if(
    (escolhaApp == "pedra" || escolhaApp == "papel" || escolhaApp == "tesoura")
    ){
      setState(() {
        this._mensagemJogarNovamente = "Para jogar outra vez, escolha novamente uma opção:";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         //1)text
          //2)imagem
          //3)text resultado
          //4)linha com 3 imagens
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text("Escolha do App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
          ),
          Image(image: _imagemApp, height: 100,),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
            Text(this._mensagemEscolha,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imagemUsuario, height: 100,),


          Padding(
             padding: EdgeInsets.only(top: 32, bottom: 16),
             child:
               Text(this._mensagem,
               textAlign: TextAlign.center,
               style: TextStyle(
               fontSize: 20,
                 fontWeight: FontWeight.bold,
    ),
  ),
),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
            Text(this._mensagemJogarNovamente,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
              ),
/*
              Image.asset("images/pedra.png", height: 120,),
              Image.asset("images/papel.png", height: 120,),
              Image.asset("images/tesoura.png", height: 120,)

 */
            ],
          ),

        ],

      ),
    );
  }
}


