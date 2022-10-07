
import 'package:dhge_abc_liste/cubits/ListCubit.dart';
import 'package:dhge_abc_liste/models/ListEntry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOverviewPageWidget extends StatelessWidget {
  const ListOverviewPageWidget({Key? key}) : super(key: key);

  void _routeToAddPage() {

  }

  void _routeToDetailsPage() {

  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListCubit(),
      child: const ListOverviewWidget(),
    );

    return BlocProvider(
      create: (_) => ListCubit(),
      child: BlocBuilder(
        builder: (context, state) {
          return ListView.builder(
              itemCount: ListCubit.ALPHABET.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45,
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            ListCubit.ALPHABET.characters.elementAt(index).toUpperCase(),
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.black12,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(4))
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: const Text("Noch keine Wörter hinzugefügt"),
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: _routeToDetailsPage,
                                    child: const Text("Mehr anzeigen"),
                                  ),
                                  TextButton(
                                    onPressed: _routeToAddPage,
                                    child: const Text("Hinzufügen"),
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }

}

class ListOverviewWidget extends StatelessWidget {
  const ListOverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, List<List<ListEntry>>>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: ListCubit.ALPHABET.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                          ListCubit.ALPHABET.characters.elementAt(index).toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(4))
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: const Text("Noch keine Wörter hinzugefügt"),
                                  ),
                                ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => {},
                                  child: const Text("Mehr anzeigen"),
                                ),
                                TextButton(
                                  onPressed: () => {},
                                  child: const Text("Hinzufügen"),
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }

}