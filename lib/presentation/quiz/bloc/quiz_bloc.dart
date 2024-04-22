import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizapp/data/cache_repository/questionnaire_repo_cache.dart';
import 'package:quizapp/domain/entities/questionnaire.dart';
import 'package:quizapp/domain/use_case/questionnaire_use_case.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({
    required this.id,
  }) : super(QuizState()) {
    on<GetQuizEvent>(onGetQuizEvent);
  }

  final String id;
  final QuestionnaireUseCase _questionnaireUseCase = QuestionnaireUseCase(QuestionnaireRepoCache());

  onGetQuizEvent(GetQuizEvent event, Emitter<QuizState> emit){
    try{
      var response = _questionnaireUseCase.getQuestionnaire(id);
    }catch (e){
      //emit(state.copyWith(status: QuizStatus.error, message: e.toString()));
    }
  }


}
