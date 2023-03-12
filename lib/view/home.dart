import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tuto_mvvm/view_model/list_pictures_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) :super (key: key);

  @override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPicturesViewModel listPicturesViewModel = new ListPicturesViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pictures'),),
      body:FutureBuilder(
        future: listPicturesViewModel.fetchPictures() , 
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else {
            return StaggeredGridView.countBuilder(
              crossAxisCount:2,
              itemBuilder:(BuildContext context, int index)=>Container(
                color: Colors.grey,
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, 
                image: '${listPicturesViewModel.pictures![index].picsumModel!.downloadUrl}', 
                fit:BoxFit.cover),
              ),
              staggeredTileBuilder: (index) =>
                     StaggeredTile.count(2, index.isEven ? 2 : 1),
                      mainAxisSpacing : 4.0,
                      crossAxisSpacing: 4.0,
                );
          }
        }  ,
      ),

    );
  }
}