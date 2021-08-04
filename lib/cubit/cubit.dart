import 'package:api_dio/Screens/business/controller.dart';
import 'package:api_dio/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLodingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '7af8d8482878494985f9cf71aa13b9dc'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetSuccessState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(
          NewsGetErrorState(
            error.toString(),
          ),
        );
      },
    );
  }
}
