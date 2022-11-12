import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/match_page.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/match_page_params.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/cubit/matches_cubit.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/cubit/matches_state.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/matches_list.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/section_header.dart';

const brasileirao = 10;

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final MatchesCubit _matchesCubit = getIt();

  @override
  void initState() {
    super.initState();
    _matchesCubit.getMatches(championshipId: brasileirao);
  }

  @override
  void dispose() {
    _matchesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Brasileirão",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF7F7F7),
      ),
      body: BlocBuilder(
        bloc: _matchesCubit,
        builder: (_, state) {
          if (state is MatchesLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is MatchesSuccessState) {
            final data = state.data.matches;
            final rounds = data.entries;
            final lastRound = rounds.last;
            final stages = lastRound.value.stage.entries;
            final selectedStageIndex = stages.length - 3;
            final matches = stages.elementAt(selectedStageIndex).value;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SectionHeader(
                  titleText: "Partidas",
                  labelText: "Ver mais",
                ),
                Expanded(
                  child: MatchesList(
                    matches: matches,
                    onRefresh: _onRefresh,
                    onTap: _navToMatchPage,
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

  Future<void> _onRefresh() async {

  }

  void _navToMatchPage(MatchModel match) {
    final navigator = Navigator.of(context);
    final params = MatchPageParams(id: match.partidaId);
    final route = MaterialPageRoute(
      builder: (_) => MatchPage(params: params),
    );
    navigator.push(route);
  }
}
