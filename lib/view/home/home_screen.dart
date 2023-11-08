import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:tvoyo/models/trendingMovies/trendingMovies_model.dart';
import 'package:tvoyo/services/bloc/trendingBloc/trendingBloc.dart';
import 'package:tvoyo/widgets/comedy/comedy_widget.dart';
import 'package:tvoyo/widgets/poster/poster_widget.dart';
import 'package:tvoyo/widgets/top10/top10_widget.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<int> top = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
  ];
  @override
  void initState() {
    trendingBloc.getTrending();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w  = Utils.getWidth(context);
    double h  = Utils.getHeight(context);
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<TrendingMoviesModel>(
          stream: trendingBloc.getTrendingMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return ListView(
                children: [
                  SizedBox(
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 650 * h,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 7),
                      ),
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context,index,realIndex){
                        return PosterWidget(
                            image: "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}",
                            description: snapshot.data!.results![index].title .toString());
                      },
                    ),
                  ),
                  SizedBox(height: 40 *h,),
                  Padding(
                    padding: EdgeInsets.only(left: 20 * w),
                    child: const Text("Комедии",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                  ),
                  SizedBox(height: 20 * h,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400 * h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context,i){
                      return ComedyMoviesWidget(image: "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![i].posterPath}",
                        rating: snapshot.data!.results![i].voteAverage!, name: snapshot.data!.results![i].title!);
                    }),
                  ),
                  SizedBox(height: 40 * h,),
                  Row(
                    children: [
                      SizedBox(width: 15 * w,),
                      Image.asset("assets/images/top10.png",width: 100 * w,height: 20,),
                      SizedBox(width: 10 * w,),
                      Text("просмотров за неделю",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                    ],
                  ),
                  SizedBox(height: 40 * h,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400 * h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context,i){
                          return Top10Widget(image: "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![i].posterPath}", num: top[i],);
                        }),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).iconTheme.color,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (i){
          setState(() {
            selectedIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 20,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 20,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined,size: 20,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.tv,size: 20,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border,size: 20,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline,size: 20,),label: ""),
        ],
      ),
    );
  }
}
