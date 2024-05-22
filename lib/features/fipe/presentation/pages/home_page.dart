import 'package:caranga/features/fipe/presentation/cubit/brands_cubit.dart';
import 'package:caranga/features/fipe/presentation/cubit/brands_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caranga - Sua consulta FIPE'),
      ),
      body: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final brandsList = state.brandMap.brandsList;

            return ListView.builder(
              itemCount: brandsList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(brandsList[index]['nome'] ?? ''),
                  /*
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(movies[index].urlImage),
                  
                  ),
                  */
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
