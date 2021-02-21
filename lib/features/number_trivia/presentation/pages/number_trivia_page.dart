import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widgets/trivia_controls.dart';
import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<NumberTriviaBloc>(),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
              if (state is Empty) {
                return MessageDisplay(message: 'Start Searching!');
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return TriviaDisplay(numberTrivia: state.trivia);
              } else if (state is Error) {
                return MessageDisplay(message: state.message);
              } else {
                return Container();
              }
            }),
            SizedBox(height: 20.0),
            TriviaControls()
          ],
        ));
  }
}
