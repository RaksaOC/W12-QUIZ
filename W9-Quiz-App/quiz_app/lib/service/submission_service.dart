import 'package:quiz_app/data/repository/submission_repository.dart';
import 'package:quiz_app/model/quiz.dart';

class SubmissionService {
  final SubmissionRepository _submissionRepository = SubmissionRepository();
  SubmissionService();

  void saveSubmission(Submission submission) {
    _submissionRepository.create(submission);
  }

  List<Submission> getSubmissions() {
    return _submissionRepository.loadAll();
  }
}
