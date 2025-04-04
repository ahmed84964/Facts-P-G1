import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/FavCubit.dart';
import '../widget/custom_app_bar.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "My Favorite Facts"),
      body: BlocBuilder<FavCubit, List<String>>(
        builder: (context, favFacts) {
          return ListView.builder(
            itemCount: favFacts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.only(left: 15, top: 24, bottom: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: ListTile(
                    title: Text(favFacts[index],style: TextStyle(
                      color: Colors.white
                    ),),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.red,),
                      onPressed: () {
                        // Remove from favorites
                        BlocProvider.of<FavCubit>(context)
                            .removeFactFromFavorites(favFacts[index]);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
