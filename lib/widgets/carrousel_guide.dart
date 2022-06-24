import 'package:flutter/material.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';
import 'package:interviewapp/pages/login/login_page.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/widgets/common_button.dart';

class CarrouselGuide extends StatefulWidget {
  const CarrouselGuide({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  _CarrouselGuideState createState() => _CarrouselGuideState();
}

class _CarrouselGuideState extends State<CarrouselGuide> {
  int page = 0;

  final indexData = [
    {
      'title': '''Olá, tudo bem?
Eu sou o Felipe Santos e desenvolvi esse app para conectar pessoas e novidades, sobre oBoticário e você!''',
      'image': 'assets/images/developer.png',
      'button': '',
      'textColor': AppColors.boticario900,
    },
    {
      'title': '''É compartilhando que nos conhecemos!
Um espaço para troca, falando sobre realizações, pensamentos, metas, enfim, tudo o que quiser.''',
      'image': 'assets/images/puzzle.png',
      'button': '',
      'textColor': AppColors.boticario900,
    },
    {
      'title': '''oBoticário não poderia ficar de fora..
Vamos contribuir para essa troca ser ainda mais completa, contando tudo em primeira mão para quem faz acontecer: vocês, nós, juntos!''',
      'image': 'assets/images/news.png',
      'button': 'Continuar',
      'textColor': AppColors.backgroundWhite,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GooeyCarousel(
      onIndexUpdate: (index) {
        setState(() {
          page = index % indexData.length;
        });
      },
      children: <Widget>[
        Container(
          color: AppColors.backgroundWhite,
          child: _buildPage(page),
        ),
        Container(
          color: AppColors.boticario50,
          child: _buildPage(page),
        ),
        Container(
          color: AppColors.boticario300,
          child: _buildPage(page),
        ),
      ],
    );
  }

  Widget _buildPage(int i) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(indexData[i]['image']),
            ),
            height: constraints.maxHeight / 2,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(i == 0),
                SizedBox(
                  width: 4,
                ),
                _buildDot(i == 1),
                SizedBox(
                  width: 4,
                ),
                _buildDot(i == 2),
              ],
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              indexData[i]['title'],
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: indexData[i]['textColor']),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: indexData[i]['button'].toString().isEmpty
                  ? Align(
                      alignment: Alignment(0.8, 0.8),
                      child: Text(
                        '''<- Arraste para continuar''',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: indexData[i]['textColor']),
                      ),
                    )
                  : Align(
                      alignment: Alignment(0, 0),
                      child: CommonButton(
                        onPressed: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        text: indexData[i]['button'],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDot(bool fill) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: fill ? AppColors.boticario900 : Colors.transparent,
        border: Border.all(
          color: AppColors.boticario900,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
    );
  }
}
