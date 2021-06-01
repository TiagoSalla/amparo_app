import 'package:amparo_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {

  final String nomeAsilo, nomeUsuario;
  final _pageController = PageController();
  HistoryPage({Key key, @required this.nomeAsilo, this.nomeUsuario}) : super(key: key);

  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),

      children: <Widget>[
        Scaffold(

          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF1D6AFF),
          ),
          drawer: CustomDrawer(nomeAsilo, nomeUsuario, _pageController),

          backgroundColor: Color(0xFF1D6AFF),
          body: Column(

            children: <Widget>[

              Expanded(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                      height: 100,
                      width: 80,),
                    Text(
                      'amparo |>',
                      style: TextStyle(
                          fontSize: 34,
                          fontFamily: 'Audiowide',
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Card(
                  margin:  const EdgeInsets.symmetric(horizontal: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50), topRight: Radius.circular(50)
                      )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        Text(
                          'História do Amparo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 3, bottom: 4, top: 6),

                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus commodo viverra maecenas accumsan.'
                                ' Mus mauris vitae ultricies leo integer malesuada. Congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque. Urna condimentum mattis pellentesque'
                                ' id nibh tortor id aliquet. Tristique senectus et netus et. Laoreet suspendisse interdum consectetur libero id faucibus. Condimentum id venenatis a condimentum '
                                'vitae sapien pellentesque habitant morbi. Turpis egestas maecenas pharetra convallis posuere morbi. Sociis natoque penatibus et magnis dis parturient.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'SF Pro Medium',
                                color: Colors.black
                            ),
                          ),
                        )
                      ],
                    ),

                  ),
                ),
              )
            ],
          ),

        ),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),
        Container(color: Colors.grey,),
        Container(color: Colors.deepOrange,),
        Container(color: Colors.deepPurpleAccent,),
      ],
    );
  }
}

