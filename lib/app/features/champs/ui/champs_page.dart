import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/app/features/champs/ui/cubit/champs_cubit.dart';
import 'package:pebol_app/app/features/champs/ui/cubit/champs_state.dart';

class ChampsPage extends StatefulWidget {
  const ChampsPage({Key? key}) : super(key: key);

  @override
  State<ChampsPage> createState() => _ChampsPageState();
}

class _ChampsPageState extends State<ChampsPage> {
  final ChampsCubit _champsCubit = getIt();

  @override
  void initState() {
    super.initState();
    _champsCubit.getChamps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Campeonatos",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF7F7F7),
      ),
      body: BlocBuilder(
        bloc: _champsCubit,
        builder: (_, state) {
          if (state is ChampsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ChampsSuccessState) {
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
