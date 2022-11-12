import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/cubit/match_cubit.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/cubit/match_state.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/match_page_params.dart';

class MatchPage extends StatefulWidget {
  final MatchPageParams params;

  const MatchPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final MatchCubit _matchCubit = getIt();

  @override
  void initState() {
    super.initState();
    _matchCubit.getMatchById(widget.params.id);
  }

  @override
  void dispose() {
    _matchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<MatchCubit, MatchState>(
        bloc: _matchCubit,
        builder: (_, state) {
          if (state is MatchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MatchFailureState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is MatchSuccessState) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * .4,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * .4,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .12,
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 8,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(state.data.estadio.nome),
                                  Text(
                                    state.data.rodada,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    width: 64,
                                    height: 64,
                                    child: ScalableImageWidget.fromSISource(
                                      fit: BoxFit.cover,
                                      reload: false,
                                      cache: ScalableImageCache(size: 64),
                                      si: ScalableImageSource.fromSvgHttpUrl(
                                        Uri.parse(
                                            state.data.timeMandante.escudo),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${state.data.placarMandante}",
                                        style: const TextStyle(fontSize: 32),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: const Text(
                                          ":",
                                          style: TextStyle(fontSize: 32),
                                        ),
                                      ),
                                      Text(
                                        "${state.data.placarVisitante}",
                                        style: const TextStyle(fontSize: 32),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    width: 64,
                                    height: 64,
                                    child: ScalableImageWidget.fromSISource(
                                      fit: BoxFit.cover,
                                      reload: false,
                                      cache: ScalableImageCache(size: 56),
                                      si: ScalableImageSource.fromSvgHttpUrl(
                                        Uri.parse(
                                            state.data.timeVisitante.escudo),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(state.data.timeMandante.nomePopular),
                                      const Text(
                                        "Casa",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(state.data.timeMandante.nomePopular),
                                      const Text(
                                        "Visitante",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Resumo"),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Estatística"),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Escalações"),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    child: ListView.separated(
                                      padding: const EdgeInsets.all(16),
                                      separatorBuilder: (_, index) =>
                                          const SizedBox(height: 16),
                                      itemCount: state.data.escalacoes.mandante
                                          .titulares.length,
                                      itemBuilder: (_, index) {
                                        final player = state.data.escalacoes
                                            .mandante.titulares[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(player.camisa),
                                            Expanded(
                                              child: Text(
                                                player.atleta.nomePopular,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text(player.posicao.isEmpty
                                                ? "SEM"
                                                : player.posicao.first.sigla)
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
