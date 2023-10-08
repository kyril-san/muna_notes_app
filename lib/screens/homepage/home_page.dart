// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muna_notes_app/const/general_colors.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/screens/homepage/widgets/home_page_widgets.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';
import 'package:muna_notes_app/service/cloud/bloc/noteservice_bloc.dart';
import 'package:muna_notes_app/service/cloud/cloud_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late TextEditingController _title;
late TextEditingController _content;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteserviceBloc>().add(NoteEventInitialize());

    _title = TextEditingController();
    _content = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _content = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteserviceBloc, NoteserviceState>(
      listener: (context, state) {
        if (state is NoteStateserviceInitial) {
          context.read<NoteserviceBloc>().add(NoteEventInitialize());
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showcontentdialog(context,
                  controller1: _title,
                  controller2: _content, okfunction: () async {
                final title = _title.text;
                final content = _content.text;
                context.read<NoteserviceBloc>().add(
                      NoteEventCreateNewNote(title: title, content: content),
                    );
                _title.clear();
                _content.clear();
                Navigator.of(context).pop();
              });
            },
            shape: CircleBorder(),
            backgroundColor: AppColors.blackcolor,
            child: Icon(Icons.add, size: 36, color: Colors.white),
          ),
          appBar: AppBar(
            title: Text('Notes', style: AppTextstyle.nunitoSemiBoldwhite),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthEventLoggedOut());
                },
                icon: Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: BlocBuilder<NoteserviceBloc, NoteserviceState>(
            builder: (context, state) {
              if (state is NoteStateserviceSuccess) {
                final note = state.notes;

                return note.isEmpty
                    ? emptynotes(context)
                    : notesList(context, notes: note, onedit: (note) async {},
                        ondelete: (CloudNote note) async {
                        context.read<NoteserviceBloc>().add(
                            NoteEventDeleteNotes(documentId: note.documentID));
                      });
              } else if (state is NoteStateserviceLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NoteStateserviceError) {
                return Text('Error');
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}







// SizedBox(
//                 width: MediaQuery.sizeOf(context).width,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/empty_background.png',
//                       fit: BoxFit.contain,
//                     ),
//                     Text(
//                       'Create your First Note!',
//                       style: AppTextstyle.nunitoLightwhite,
//                     )
//                   ],
//                 ),
//               );