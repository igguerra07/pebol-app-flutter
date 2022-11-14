import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/cubit/match_cubit.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/cubit/match_state.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/match_page_params.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/line_up/line_up_tab.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/match_page_view.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/match_tabs.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/overview/overview_tab.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/status/status_tab.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/widgets/match_decoration_backgroud.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/widgets/match_score_card.dart';

const overviewTab = 0;
const statusTab = 1;
const lineUpTab = 2;

class MatchPage extends StatefulWidget {
  final MatchPageParams params;

  const MatchPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> with TickerProviderStateMixin {
  final MatchCubit _matchCubit = getIt();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
    _matchCubit.getMatchById(widget.params.id);
  }

  @override
  void dispose() {
    _matchCubit.close();
    _tabController.dispose();
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
            final match = state.data;
            return Column(
              children: [
                Stack(
                  children: [
                    const MatchDecorationBackground(),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .12,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MatchScoreCard(
                            round: match.rodada,
                            stadium: match.estadio.nome,
                            awayTeam: match.timeMandante,
                            homeTeam: match.timeVisitante,
                            awayTeamScore: match.placarVisitante,
                            homeTeamScore: match.placarMandante,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MatchPageViewTabs(
                          tabController: _tabController,
                        ),
                        Expanded(
                          child: MatchTabView(
                            tabController: _tabController,
                            children: [
                              OverviewTab(match: match),
                              StatusTab(matchStatus: match.estatisticas),
                              LineUpTab(
                                homeTeam: match.timeMandante,
                                awayTeam: match.timeVisitante,
                                homeTeamLineUp: match.escalacoes.visitante,
                                awayTeamLineUp: match.escalacoes.mandante,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
