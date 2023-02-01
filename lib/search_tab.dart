import 'package:flutter/material.dart';
import 'package:movies_app/model/SearchMoviesResponse.dart';
import 'package:movies_app/search_movie/search_movie_item_list.dart';
import 'package:movies_app/popular_movies/movie_details.dart';

import 'api/api_manger.dart';

class SearchTab extends StatefulWidget{
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String searchWord ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121312),
        title: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            height: 55,
            child: TextField(
              onChanged: (value) {
                print(value);
                searchWord = value;
                setState(() {
                });
              },
              decoration: InputDecoration(
                  hintText: "Search Movie",
                  hintStyle: TextStyle(color: Color(0xFF707070)),
                  filled: true,
                  fillColor: Color(0xFF514F4F),
                  border: UnderlineInputBorder(borderRadius: BorderRadius.circular(25),),
                  // suffixIcon: IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.search,
                  //       color: Colors.white,
                  //     )),
                  prefixIcon:IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
    ),
            )),
        leading: SizedBox(),
        leadingWidth: 10,
      ),
      body: Container(
        color: Color(0xFF121312),
        child: searchWord == '' ?
        Container(
          width: double.infinity,
          // alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_movies_rounded,size: 100,color: Color(0xFFB5B4B4),),
              Text('No movies found',style: TextStyle(fontSize: 13,color: Color(0xFFB5B4B4)),),
            ],
          ),
        ):
        FutureBuilder<SearchMoviesResponse>(
            future: ApiManger.getSearchMovie(searchWord),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text('Someting Wrong'),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              if (snapshot.data?.page == 0) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ''),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              var moviesList = snapshot.data?.results ?? [];
              // print(moviesList);
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,MovieDetails.routeName,arguments: moviesList[index].id);
                      },
                      child: SearchMovieItemList(
                        // movie: moviesList[index] ,
                        posterPath: moviesList[index].posterPath ?? '',
                      movieName: moviesList[index].title ?? '',
                      date: moviesList[index].releaseDate ?? '',
                      title: moviesList[index].originalTitle ?? '',
                      ));
                },
                itemCount: moviesList.length,
              );
            }),
      ),
    );
  }
}
