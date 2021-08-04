import 'package:api_dio/Widgets/article.dart';
import 'package:api_dio/cubit/cubit.dart';
import 'package:api_dio/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NewsApp",
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) => NewsCubit()..getBusiness(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var list = NewsCubit.get(context).business;
            return ConditionalBuilder(
              condition: state is! NewsGetBusinessLodingState,
              builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => BuildArticleItem(
                  [
                    list[index],
                  ],
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
