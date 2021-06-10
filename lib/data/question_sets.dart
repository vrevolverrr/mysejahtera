import 'package:mysj/data/helpers.dart';

List<Question> healthAssessmentQuestionSet() {
  return <Question>[
    Question("Are you exhibiting or more symptoms as listed below:",
        "Fever, Chills, Shivering, Body Ache, Headache, Sore Throat, Nausea or Vomitting, Diarrhea, Fatigue, Runny Nose"),
    Question("Are you exhibiting other symptoms as listed below:",
        "Cough, Difficulty Breathing, Loss of Smell, Loss of Taste"),
    Question(
        "Have you attended any event associated with known COVID-19 cluster?",
        ""),
    Question(
        "Have you travelled to any country outside Malaysia within 14 days before onset of symptoms?",
        ""),
    Question(
        "Have you had\nclose contact to confirmed or suspected case of COVID-19 within 14 days before onset of symptoms?",
        ""),
    Question("Are you a MOH COVID-19 volunteer in the last 14 days?", ""),
  ];
}
