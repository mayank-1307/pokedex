import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  const HomeScreen({Key? key, required this.name}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List pokedex = [];
  var pokeApi="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  get name => null;


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = name ?? "Ash";
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: GradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.black,
              Colors.white,
            ],
                begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          leading: Container(
                width: width *0.5,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                ),
              ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: -60,
               right: -80,
              child: Opacity(
                child: Image.asset('assets/images/pokeball_dark.png',
                  width:250,
                  fit: BoxFit.fitWidth,),
                opacity: 0.2,
              ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Text(
              "Hi, ${user}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: Text('(Pokemon Trainer)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              )
          ),
          Positioned(
            top: 150,
            left: 0, // Adjust the left position as needed
            right: 0, // Adjust the right position as needed
            bottom: 0,

            child: Column(
            children: [
              pokedex !=null ? Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
              ),
                  itemCount: pokedex.length,
                itemBuilder: ( context,  index) {
                var type = pokedex[index]['type'][0];
                print(pokedex[index]['id']);
                return InkWell(
                  child: Hero(
                    tag: {pokedex[index]['id']},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: type == 'Grass' ? Colors.green : type=='Ice'? Colors.lightBlueAccent : type== 'Fire' ? Colors.red: type=='Water'? Colors.blueAccent:type=='Electric'? Colors.yellow:  type =='Poison' ? Colors.pinkAccent: type=='Bug'? Colors.lightGreenAccent: type=='Ground'? Colors.brown:type=='Fighting' ? Colors.red: type=='Psychic'?Colors.purpleAccent : type=='Rock'? Colors.grey: type =='Ghost' ? Color.fromRGBO(230,230,250,0.7) : type =='Dragon'?Colors.orangeAccent : Colors.black26 ,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom:-10,
                              right: -10,
                              child: Opacity(
                                child: Image.asset('assets/images/pokeball.png',
                              height: 100,
                                fit: BoxFit.fitHeight,
                              ), opacity: 0.3,
                              ),
                            ),

                            Positioned(
                              top: 20,
                              left: 10,
                              child: Text(
                                pokedex[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 10,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0, right: 8.0, top:4.0, bottom: 4.0),
                                  child: Text(
                                      type.toString(),
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5 ,
                              child: CachedNetworkImage(imageUrl: pokedex[index]['img'],
                              height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                        ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (_) => PokemonDetailScreen(
                      pokemonDetail: pokedex[index],
                      color: type == 'Grass' ? Colors.green : type=='Ice'? Colors.lightBlueAccent : type== 'Fire' ? Colors.red: type=='Water'? Colors.blueAccent:type=='Electric'? Colors.yellow:  type =='Poison' ? Colors.pinkAccent: type=='Bug'? Colors.lightGreenAccent: type=='Ground'? Colors.brown:type=='Fighting' ? Colors.red: type=='Psychic'?Colors.purpleAccent : type=='Rock'? Colors.grey: type =='Ghost' ? Color.fromRGBO(230,230,250,0.7) : type =='Dragon'?Colors.orangeAccent : Colors.black26 ,
                      heroTag: index,
                    ),
                    ),
                    );
                  },
                );
                },
              )
              ):Center(
                child: CircularProgressIndicator(),
              )
            ],
        ),
          ),
    ],
      )
    );
  }
  void fetchPokemonData(){
    var url=Uri.http("raw.githubusercontent.com","/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      var decodedData = jsonDecode(value.body);
      pokedex=decodedData['pokemon'];
      setState(() {

      });
    }
    );
  }
}
