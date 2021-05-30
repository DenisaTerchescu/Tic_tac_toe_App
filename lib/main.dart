
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Play Tic-Tac-Toe!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _i = 0;

  late AnimationController animationController;

  Color container_color = Colors.green.withOpacity(0.8);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        container_color = Colors.black87;
      });
    });
  }

  void _keepTrack() {
    setState(() {
      _i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<bool> elements = List<bool>.generate(100000, (index) => false);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Let's play tic tac toe!"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: 15, bottom: 2, top: 25, right: 15),
          child: Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.70,
              ),
              itemCount: 9,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (BuildContext context, int index) {
                return FavoriteWidget(
                  index: index,
                  container_color: Colors.red,
                  changeColor: elements[index],
                  onTap: () {
                    setState(() {


                    });
                  },
                );
              },


            ),

          ),
        ),

      ),
    );
  }

}



  typedef OnTap =

  void Function()

  ;



class FavoriteWidget extends StatefulWidget {
  final bool changeColor;
  final Color container_color;
  final int index;
  final OnTap onTap;
  int i=0;
  FavoriteWidget({Key? key, required this.changeColor, required this.container_color, required this.index,required this.onTap}) : super(key: key);
  @override
  FavoriteWidgetState createState() => FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavoriteWidget> with SingleTickerProviderStateMixin{

  int _taps = 0;
  Color colorContainer = Colors.green.withOpacity(0.8);

   late AnimationController _controller;
   late Animation _colorAnimation;
  @override
  void _letsKeepTrack(){
    setState(() {
      _taps++;

    });
  }
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this,
    );

     _colorAnimation=ColorTween(begin:Colors.grey, end:Colors.green).animate(_controller);

    _controller.forward();
    _controller.addListener(() {
      setState(() {
        _controller.forward();
      });
      print('_controller.value');
    });

  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: ()
      {
        setState(() {
          _letsKeepTrack();
          if(_taps % 2==0)
            {
                colorContainer=Colors.green;

            }
          else
          colorContainer=Colors.black;

        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        alignment: AlignmentDirectional.bottomCenter,
        decoration: BoxDecoration(
          color: colorContainer,

        ),
      ),
    );

  }
}