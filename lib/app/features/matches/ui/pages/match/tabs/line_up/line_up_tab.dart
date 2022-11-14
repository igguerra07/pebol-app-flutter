import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/matches/models/line_up_model.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/line_up/line_up_list.dart';

class LineUpTab extends StatefulWidget {
  final TeamModel awayTeam;
  final TeamModel homeTeam;
  final TeamLineUpModel awayTeamLineUp;
  final TeamLineUpModel homeTeamLineUp;

  const LineUpTab({
    Key? key,
    required this.awayTeam,
    required this.homeTeam,
    required this.awayTeamLineUp,
    required this.homeTeamLineUp,
  }) : super(key: key);

  @override
  State<LineUpTab> createState() => _LineUpTabState();
}

class _LineUpTabState extends State<LineUpTab> {
  late String _selectedLineUp;
  late List<PlayerDataModel> _lineUp;

  List<PlayerDataModel> get _awayLineUp => widget.awayTeamLineUp.titulares;
  List<PlayerDataModel> get _homeLineUp => widget.homeTeamLineUp.titulares;

  @override
  void initState() {
    _selectedLineUp = widget.homeTeam.sigla;
    _lineUp = _homeLineUp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        value: widget.homeTeam.sigla,
        child: Text(widget.homeTeam.nomePopular),
      ),
      DropdownMenuItem(
        value: widget.awayTeam.sigla,
        child: Text(widget.awayTeam.nomePopular),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: DropdownButtonFormField<String>(
            items: items,
            isExpanded: true,
            value: _selectedLineUp,
            onChanged: _onSelectLineUp,
          ),
        ),
        Expanded(
          child: LineUpList(lineUp: _lineUp),
        ),
      ],
    );
  }

  void _onSelectLineUp(String? value) {
    setState(() {
      _selectedLineUp = value ?? widget.homeTeam.sigla;
      _lineUp = value == widget.homeTeam.sigla ? _homeLineUp : _awayLineUp;
    });
  }
}
