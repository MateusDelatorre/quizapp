import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizapp/data/cache_repository/questionnaire_repo_cache.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/use_case/questionnaire_use_case.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({
    required this.id,
  }) : super(const QuizState()) {
    on<GetQuizEvent>(onGetQuizEvent);
  }

  final String id;
  final QuestionnaireUseCase _questionnaireUseCase = QuestionnaireUseCase(QuestionnaireRepoCache());

  onGetQuizEvent(GetQuizEvent event, Emitter<QuizState> emit) async {
    try{
      print("teste");
      var response = await _questionnaireUseCase.getQuestionnaire(id);
      if(response.isLeft()){
        //emit(state.copyWith(status: QuizStatus.error, message: response.leftMap((l) => l.toString()).toString()));
        return;
      }else if(response.isRight()){
        print(response);
        Questionnaire q = const Questionnaire();
        final dartMatch = switch (response) {
          Left(value: final l) => 'Left($l)',
          Right(value: final r) => r,
        };
        emit(state.copyWith(questionnaire: dartMatch as Questionnaire));
      }
    }catch (e){
      //emit(state.copyWith(status: QuizStatus.error, message: e.toString()));
    }
  }


}
