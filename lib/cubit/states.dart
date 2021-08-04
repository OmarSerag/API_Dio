abstract class NewsState{}
  class NewsInitialState extends NewsState{}
class NewsGetBusinessLodingState extends NewsState{}
 class NewsGetSuccessState extends NewsState{}
 class NewsGetErrorState extends NewsState{
  final String error;

  NewsGetErrorState(this.error);
}

