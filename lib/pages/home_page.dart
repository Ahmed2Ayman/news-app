import 'package:flutter/material.dart';
import 'package:newsapp/widgets/list_view_category_card.dart';
import 'package:newsapp/widgets/news_list_view_builder.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //centerTitle: true,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body:  const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
       child: CustomScrollView(
         physics: BouncingScrollPhysics(),
         slivers: [
           SliverToBoxAdapter(child: ListViewCategoryCard()),
        SliverToBoxAdapter(
          child: SizedBox(
                  height: 32,
          ),
         ),

           NewsListViewBuilder(
             category: 'general',
           ) ,

           // const SliverToBoxAdapter(
           //   child: NewsListView(),
           // )
         ],
       ),


        // child: Column(
        //   children: [
        //     ListViewCategoryCard(),
        //     SizedBox(
        //       height: 32,
        //     ),
        //     Expanded(child: NewsListView()),
        //   ],
      //  ),
      ),
    );
  }
}
