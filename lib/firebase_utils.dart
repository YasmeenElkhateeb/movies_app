import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/model/WatchedMovies.dart';

CollectionReference<WatchedMovies> getMovieCollection(){
  return FirebaseFirestore.instance.collection('movieData')
      .withConverter<WatchedMovies>(
    fromFirestore: (snapshot, options) => WatchedMovies.fromJson(snapshot.data()!),
    toFirestore: (movieData, options) => movieData.toJson(),
  );
}

Future<void> addMovieToFireStore(WatchedMovies movieData){
  var collection = getMovieCollection(); //get collection
  var docRef = collection.doc('${movieData.idFierbase}'); // get document
  // movieData.idFierbase = docRef.id;
  movieData.idFierbase = movieData.movie.id!; //Auto generate Id
  // print('idFierbase =${docRef.id}');
  print("${docRef.set(movieData)}");
  return docRef.set(movieData); // to add movie
}

Future<void> editMovieIsDone(WatchedMovies movieData){
  movieData.idFierbase = movieData.movie.id!;
  return getMovieCollection().doc('${movieData.idFierbase}').update({
    'isDone': !movieData.isDone,
  });
}

Future<void> deleteMovieFromFireStore(WatchedMovies movieData){
  movieData.idFierbase = movieData.movie.id!;
  return getMovieCollection().doc('${movieData.idFierbase}').delete().timeout(Duration(milliseconds: 5),onTimeout: (){
    print('movie was deleted');
  });
}

