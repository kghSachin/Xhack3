class GeminiResponse {
  List<Candidate> candidates;
  UsageMetadata usageMetadata;
  String modelVersion;

  GeminiResponse({
    required this.candidates,
    required this.usageMetadata,
    required this.modelVersion,
  });

  factory GeminiResponse.fromJson(Map<String, dynamic> json) {
    return GeminiResponse(
      candidates: (json['candidates'] as List)
          .map((candidate) => Candidate.fromJson(candidate))
          .toList(),
      usageMetadata: UsageMetadata.fromJson(json['usageMetadata']),
      modelVersion: json['modelVersion'],
    );
  }
}

class Candidate {
  Content content;
  String finishReason;
  double avgLogprobs;

  Candidate({
    required this.content,
    required this.finishReason,
    required this.avgLogprobs,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      content: Content.fromJson(json['content']),
      finishReason: json['finishReason'],
      avgLogprobs: json['avgLogprobs'],
    );
  }
}

class Content {
  List<Part> parts;
  String role;

  Content({
    required this.parts,
    required this.role,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      parts:
          (json['parts'] as List).map((part) => Part.fromJson(part)).toList(),
      role: json['role'],
    );
  }
}

class Part {
  String text;

  Part({required this.text});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      text: json['text'],
    );
  }
}

class UsageMetadata {
  int promptTokenCount;
  int candidatesTokenCount;
  int totalTokenCount;

  UsageMetadata({
    required this.promptTokenCount,
    required this.candidatesTokenCount,
    required this.totalTokenCount,
  });

  factory UsageMetadata.fromJson(Map<String, dynamic> json) {
    return UsageMetadata(
      promptTokenCount: json['promptTokenCount'],
      candidatesTokenCount: json['candidatesTokenCount'],
      totalTokenCount: json['totalTokenCount'],
    );
  }
}
