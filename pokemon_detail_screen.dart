import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class PokemonDetailScreen extends StatefulWidget {
  final  pokemonDetail;
   final Color color;
   final int heroTag;
  const PokemonDetailScreen({Key? key,this.pokemonDetail,required this.color, required this.heroTag}) : super(key: key);
  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}
class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  get type => null;
  get pokedex => null;
  @override
  Widget build(BuildContext context) {
    // print(widget.pokemonDetail['id']);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Container(
        child: Hero(
          tag: {widget.pokemonDetail['id']},
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 35,
                left: 1,
                child: IconButton(onPressed:(){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),),
              ),
              Positioned(
                top: 90,
                  left: 20,
                  child: Text(widget.pokemonDetail['name'], style: TextStyle(
                    color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Positioned(
                top: 130,
                left: 20,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8, top: 4, bottom: 4),
                    child: Text(
                      widget.pokemonDetail['type'].join(','),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height*0.18,
                right: -30,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset('assets/images/pokeball.png',
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                  left: (width/2) -80,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemonDetail['img'],
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: height*0.6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:width*0.3,
                                child: Text('Name',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18
                                ),
                                ),
                              ),
                              SizedBox(
                                  width:width*0.3,
                                  child: Text(widget.pokemonDetail['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              SizedBox(
                                width:width*0.3,
                                child: const Text('Height',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:width*0.3,
                                child: Text(widget.pokemonDetail['height'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width:width*0.3,
                                child: Text('Weight',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(widget.pokemonDetail['weight'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width:width*0.3,
                                child: Text('Spawn Time',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(widget.pokemonDetail['spawn_time'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width:width*0.3,
                                child: Text('Spawn Chance',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Container(

                                child: Text(widget.pokemonDetail['spawn_chance'].toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width:width*0.3,
                                child: Text('Weakness',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Container(
                                width:width*0.5,
                                child: Text(widget.pokemonDetail['weaknesses'].join(", "),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width:width*0.3,
                                child: Text('Prev Form',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              widget.pokemonDetail['prev_evolution'] != null?
                              SizedBox(
                                height: 20,
                                width: width*0.55-2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.pokemonDetail['prev_evolution'].length,
                                  itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right:8.0,),
                                      child: Text(widget.pokemonDetail['prev_evolution'][index]['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ):Text('Just Hatched',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Container(
                                width:width*0.3,
                                child: Text('Evolution',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              widget.pokemonDetail['next_evolution'] != null?
                              SizedBox(
                                height: 20,
                                width: width*0.55-2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.pokemonDetail['next_evolution'].length,
                                    itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right:8.0,),
                                      //add InkWell to jump to the evolved pokemon
                                      child: Text(widget.pokemonDetail['next_evolution'][index]['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                    },
                                ),
                              ):Text('Maxed Out',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}