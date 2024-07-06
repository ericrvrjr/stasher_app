import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stasher_app/viewmodels/stashpoint/stashpoint_viewmodel.dart';
import 'package:stasher_app/views/stashpoint/stashpoint_view.dart';

void main() async {
  await dotenv.load();
  runApp(ChangeNotifierProvider(
      create: (context) => StashpointViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return MaterialApp(
        debugShowCheckedModeBanner: (dotenv.env['APP_ENV'] ?? 'dev') == 'dev',
        title: 'Stasher',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Stashpoints'),
          ),
          body: Consumer<StashpointViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.stashpoints.isEmpty) {
                // Display a loading indicator while fetching data
                return const Center(child: CircularProgressIndicator());
              } else if (viewModel.hasError) {
                return Center(child: Text('Error: ${viewModel.errorMessage}'));
              }
              return ListView.builder(
                itemCount: viewModel.stashpoints.length +
                    (viewModel.isLoadingMore ? 1 : 0),
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (index == viewModel.stashpoints.length - 1) {
                    scrollController.addListener(() {
                      if (scrollController.position.pixels >=
                          scrollController.position.maxScrollExtent) {
                        viewModel
                            .fetchMoreStashpoints(); // Trigger fetch on end
                      }
                    });
                  }
                  if (index < viewModel.stashpoints.length) {
                    return StashpointView(
                        stashpoint: viewModel.stashpoints[index]);
                  } else {
                    return Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,width:20,child: CircularProgressIndicator()),
                          SizedBox(width: 8,),
                           Text("Loading more stashpoints. Please wait...", textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),),
                        ],
                      ),
                    );
                  }
                },
              );
            },
          ),
        ));
  }
}
