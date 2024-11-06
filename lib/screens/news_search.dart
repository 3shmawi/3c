part of 'news.dart';

class NewsSearch extends StatelessWidget {
  const NewsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCtrl, NewsStates>(
      builder: (context, state) {
        final cubit = context.read<NewsCtrl>();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: TextField(
              controller: cubit.searchCtrl,
              onSubmitted: (v) {
                cubit.search();
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for News",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.clearData();
                  },
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
              ),
            ),
          ),
          body: BlocBuilder<NewsCtrl, NewsStates>(
            builder: (context, state) {
              final cubit = context.read<NewsCtrl>();
              if (state is NewsLoadingState) {
                return const UseCaseBuild(UseCase.loading);
              }
              if (state is NewsErrorState) {
                return const UseCaseBuild(UseCase.error);
              }
              if (cubit.searchResults.isEmpty) {
                return const UseCaseBuild(UseCase.empty);
              }
              return ListView.builder(
                itemBuilder: (context, index) =>
                    _NewsItem(cubit.searchResults[index]),
                itemCount: cubit.searchResults.length,
              );
            },
          ),
        );
      },
    );
  }
}
