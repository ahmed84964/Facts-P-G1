import 'package:facts_project_g1/cubit/fact_cubit.dart';
// import 'package:facts_project_g1/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/FavCubit.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_icon.dart';
import 'favourate_fact_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: CustomAppBar(text: "Daily Facts"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * .6,
              width: width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Fun Fact",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  BlocConsumer<FactCubit, FactState>(
                    listener: (context, state) {
                      if (state is FactSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Data Fetched Successfully"),
                          ),
                        );
                      } else if (state is FactError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${state.error}: ${state.error_message}"),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is FactLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is FactSuccess) {
                        String factText = FactCubit.get(context).model!.text ?? 'No Fact';
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            factText,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {
                        return Text(
                          "To Get A New Fact Press On Generate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFav = !isFav;
                          });

                          String factText = FactCubit.get(context).model!.text ?? 'No Fact';
                          if (isFav) {
                            BlocProvider.of<FavCubit>(context).addFactToFavorites(factText);
                          } else {
                            BlocProvider.of<FavCubit>(context).removeFactFromFavorites(factText);
                          }
                        },
                        child: CustomIcon(
                          icon: Icons.star_rounded,
                          size: 30,
                          color: isFav ? Colors.yellow : Colors.white30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  text: 'Fav',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavScreen()),
                    );
                  },
                ),
                CustomButton(
                  text: 'Generate',
                  onPressed: () {
                    FactCubit.get(context).getRandomFact();
                    setState(() {
                      isFav=!isFav;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
