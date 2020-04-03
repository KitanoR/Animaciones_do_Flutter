import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (_) => _NotificacionModel(),
          child: Scaffold(
              appBar: AppBar(
                title: Text('Notification page'),
                backgroundColor: Colors.pink,
              ),
              body: Center(
                child: Text('Hola Mundo'),
            ),
            floatingActionButton: BotonFlotante(),
            bottomNavigationBar: BottmNavigation(),
        ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        final noficacionModel = Provider.of<_NotificacionModel>(context, listen: false);
        int numero = noficacionModel.numero;
        numero++ ;
        noficacionModel.numero = numero;
        if(numero >= 2){
          final controller = noficacionModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class BottmNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificacionModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone)
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                right: 0,
                top: 0,
                // child:Icon(Icons.brightness_1, size: 8, color: Colors.redAccent,)
                child: BounceInDown(
                    from: 10,
                    animate: (numero > 0) ? true : false,
                    child: Bounce(
                        from: 10,
                        controller: (controller) => Provider.of<_NotificacionModel>(context).bounceController = controller,
                        child: Container(
                          width: 14,
                          height: 14,
                          alignment: Alignment.center,
                          child: Text('$numero', style: TextStyle(fontSize: 9, color: Colors.white),),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle
                          ),
                        ),
                    ),
                ),
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          title: Text('My dog'),
          icon: FaIcon(FontAwesomeIcons.dog)
        )
      ],
    );  
  }
}

class _NotificacionModel extends ChangeNotifier {
  int _numero =0;
  AnimationController _bounceController;

  int get numero => this._numero;
  set numero(int valor){
    this._numero = valor;
    notifyListeners();
  }

  get bounceController => this._bounceController;

  set bounceController(AnimationController controller){
    this._bounceController = controller;
  }
}