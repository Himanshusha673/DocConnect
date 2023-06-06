import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/Mediline/widgets/single_mediline_card.dart';

import '../bloc/search_bloc/mediline_search_bloc.dart';

class MedilineSearchScreen extends StatefulWidget {
  const MedilineSearchScreen({super.key});

  @override
  State<MedilineSearchScreen> createState() => _MedilineSearchScreenState();
}

class _MedilineSearchScreenState extends State<MedilineSearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: Column(
          children: [
            _searchField(),
            Expanded(child: _list()),
          ],
        ));
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    onChanged: (value) => context
                        .read<MedilineSearchBloc>()
                        .add(MedilineGetSearchEvent(searchQuery: value)),
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Enter text here',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: const Icon(Icons.cancel))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _list() {
    return BlocBuilder<MedilineSearchBloc, MedilineSearchState>(
      builder: (context, state) {
        if (state is MedilineSearchloadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MedilineSearchResultState) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.appointmentList.length,
                itemBuilder: (context, index) {
                  // return _patientCard(patient: patients[index]);
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleMedilineCard(
                        appointmentDetail: state.appointmentList[index],
                      ));
                }),
          );
        }
        return Container(
            // child: Text(state.appointmentList.toString()),
            );
      },
    );
  }
}
