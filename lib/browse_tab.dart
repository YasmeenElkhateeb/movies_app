import 'package:flutter/material.dart';
import 'package:movies_app/category_list/list_movies_of_category.dart';
import 'package:movies_app/model/CateguryResponse.dart';

import 'api/api_manger.dart';
import '/category_list/category_item.dart';

class BrowseTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF121312),
        appBar: AppBar(
          title: Text(
            'Browse Category',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder<CateguryResponse>(
            future: ApiManger.getCateguryList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text('Someting Wrong'),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              if (snapshot.data?.success == false) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ''),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                );
              }
              var categoryList = snapshot.data?.genres ?? [];
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        // call back function
                        print(categoryList[index].name ?? '');
                        // ListMoviesOfCategury(Category: categoryList[index],);
                        Navigator.pushNamed(context,ListMoviesOfCategory.routeName,arguments: categoryList[index].id);

                      },
                      child: CategoryItem(categoryName: categoryList[index].name ?? '',)
                  );
                },
                itemCount: categoryList.length,
              );
            })
    );
  }

}
