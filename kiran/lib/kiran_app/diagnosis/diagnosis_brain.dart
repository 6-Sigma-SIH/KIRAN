class DiagnosisBrain {
  DiagnosisBrain({required this.totalScore});

  final int totalScore;

  String getAnxietyResult() {
    if (totalScore >= 0 && totalScore <= 4) {
      return "Minimal to None Anxiety";
    } else if (totalScore > 4 && totalScore <= 9) {
      return "Mild Anxiety";
    } else if (totalScore > 9 && totalScore <= 12) {
      return "Moderate Anxiety";
    } else if (totalScore > 12 && totalScore <= 16) {
      return "Severe Anxiety";
    } else if (totalScore > 16 && totalScore <= 21) {
      return "Extreme Anxiety";
    } else {
      return "Error";
    }
  }

  String getAnxietyInterpretation() {
    if (totalScore >= 0 && totalScore <= 4) {
      return "Interpretation of None to Minimal Anxiety";
    } else if (totalScore > 4 && totalScore <= 9) {
      return "Interpretation of Mild Anxiety";
    } else if (totalScore > 9 && totalScore <= 12) {
      return "Interpretation of Moderate Anxiety";
    } else if (totalScore > 12 && totalScore <= 16) {
      return "Interpretation of Severe Anxiety";
    } else if (totalScore > 16 && totalScore <= 21) {
      return "Interpretation of Extreme Anxiety";
    } else {
      return "Error";
    }
  }

  String getADHDResult() {
    if (totalScore >= 0 && totalScore <= 15) {
      return "ADHD not diagnosed";
    } else if (totalScore > 15 && totalScore <= 2) {
      return "ADHD Diagnosed";
    } else {
      return "Error";
    }
  }

  String getADHDInterpretation() {
    if (totalScore >= 0 && totalScore <= 15) {
      return "You are not having any symptoms of ADHD";
    } else if (totalScore > 15 && totalScore <= 72) {
      return "You are displaying symptoms that are highly consistent with ADHD in adults, you should seek medical attention.";
    } else {
      return "Error";
    }
  }

  String getDepressionResult() {
    if (totalScore >= 0 && totalScore <= 4) {
      return "Minimal to None Depression";
    } else if (totalScore > 4 && totalScore <= 9) {
      return "Mild Depression";
    } else if (totalScore > 9 && totalScore <= 14) {
      return "Moderate Depression";
    } else if (totalScore > 14 && totalScore <= 19) {
      return "Moderately Severe Depression";
    } else if (totalScore > 19 && totalScore <= 27) {
      return "Extreme Depression";
    } else {
      return "Error";
    }
  }

  String getDepressionInterpretation() {
    if (totalScore >= 0 && totalScore <= 4) {
      return "Interpretation of Minimal to None Depression - Stay Healthy!";
    } else if (totalScore > 4 && totalScore <= 9) {
      return "Interpretation of Mild Depression: 	Watchful waiting; repeat PHQ-9 at follow-up";
    } else if (totalScore > 9 && totalScore <= 14) {
      return "Interpretation of Moderate Depression: Treatment plan, considering counseling, follow-up and/or pharmacotherapy";
    } else if (totalScore > 14 && totalScore <= 19) {
      return "Interpretation of Moderately Severe Depression: Active treatment with pharmacotherapy and/or psychotherapy";
    } else if (totalScore > 19 && totalScore <= 27) {
      return "Interpretation of Extreme Depression: 	Immediate initiation of pharmacotherapy and, if severe impairment or poor response to therapy, expedited referral to a mental health specialist for psychotherapy and/or collaborative management";
    } else {
      return "Error";
    }
  }
}
