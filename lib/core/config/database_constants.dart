// lib/core/constants/database_constants.dart

class Constants {
  static const String databaseName = 'the_english_spiders_database.db';
  static const String userDatabaseName = 'users_manager.db';

  // Nouns Table
  static const String nounsTable = 'nouns';
  static const String nounIdColumn = 'id';
  static const String nounNameColumn = 'name';
  static const String nounImageColumn = 'image';
  static const String nounAudioColumn = 'audio';
  static const String nounCategoryColumn = 'category';

  // Noun Categories
  static const String categoryAnimal = 'animal';
  static const String categoryBird = 'bird';
  static const String categoryFruit = 'fruit';
  static const String categoryVegetable = 'vegetable';
  static const String categoryHomeStuff = 'home_stuff';
  static const String categorySchoolSupplies = 'school_supplies';
  static const String categoryStationery = 'Stationery';
  static const String categoryTools = 'Tools';
  static const String categoryElectronics = 'Electronics';
  static const String categoryColor = 'color';
  static const String categoryJobs = 'jobs';

  // Adjectives Table
  static const String adjectivesTable = 'adjectives';
  static const String adjectiveIdColumn = 'id';
  static const String mainAdjectiveColumn = 'main_adjective';
  static const String mainExampleColumn = 'main_example';
  static const String reverseAdjectiveColumn = 'reverse_adjective';
  static const String reverseExampleColumn = 'reverse_example';
  static const String mainAdjectiveAudioColumn = 'main_adjective_audio';
  static const String reverseAdjectiveAudioColumn = 'reverse_adjective_audio';
  static const String mainExampleAudioColumn = 'main_example_audio';
  static const String reverseExampleAudioColumn = 'reverse_example_audio';

  // Compound Words Table
  static const String compoundWordsTable = 'compound_words';
  static const String compoundWordIdColumn = 'id';
  static const String compoundWordMainColumn = 'main';
  static const String compoundWordPart1Column = 'part1';
  static const String compoundWordPart2Column = 'part2';
  static const String compoundWordExampleColumn = 'example';
  static const String compoundWordMainAudioColumn = 'main_audio';
  static const String compoundWordExampleAudioColumn = 'example_audio';

  // Default Assets Table
  static const String defaultAssetsTable = 'default_assets';
  static const String defaultAssetIdColumn = 'id';
  static const String defaultAssetCategoryColumn = 'category';
  static const String defaultAssetImageColumn = 'image';
  static const String defaultAssetAudioColumn = 'audio';

// Images Table
  static const String imagesTable = 'images';
  static const String imageIdColumn = 'id';
  static const String sentenceImageColumn = 'image';
  static const String sentenceAudioColumn = 'audio';
  static const String sentenceFullTextColumn = 'full_text';

  // Image Segments Table
  static const String sentencesTable = 'image_segments';
  static const String sentenceIdColumn = 'id';
  static const String segmentTextColumn = 'text';
  static const String segmentImageIdColumn = 'image_id';
  static const String segmentOrderColumn = 'segment_order';

  // Users Table
  static const String usersTable = 'users';
  static const String userIdColumn = 'id';
  static const String userNameColumn = 'name';
  static const String userPasswordColumn = 'password';
  static const String userGenderColumn = 'gender';
  static const String userCreationDateColumn = 'creation_date';

  // QuizResults Table
  static const String quizResultsTable = 'quiz_results';
  static const String quizResultIdColumn = 'id';
  static const String quizResultUserIdColumn = 'user_id';
  static const String quizTypeColumn = 'quiz_type';
  static const String quizResultScoreColumn = 'score';
  static const String quizResultDateColumn = 'date';
  static const String quizResultCorrectAnswersColumn = 'correct_answers';
  static const String quizResultTotalQuestionsColumn = 'total_questions';
  static const String quizTypeNouns = 'nouns';
  static const String quizTypeAdjectives = 'adjectives';
  static const String quizTypeSentences = 'sentences';
  static const String quizTypeVerbs = 'verbs';

  // Verbs Table
  static const String verbsTable = 'verbs';
  static const String verbIdColumn = 'id';
  static const String verbBaseFormColumn = 'base_form';
  static const String verbTranslationColumn = 'translation';
  static const String verbTypeColumn = 'verb_type';
  static const String verbBaseAudioColumn = 'base_audio';
  static const String irregularVerbCategory = 'irregular';
  static const String regularVerbCategory = 'regular';

  // Conjugations Table
  static const String conjugationsTable = 'conjugations';
  static const String conjugationIdColumn = 'id';
  static const String conjugationVerbIdColumn = 'verb_id';
  static const String conjugationPastFormColumn = 'past_form';
  static const String conjugationPastAudioColumn = 'past_audio';
  static const String conjugationPPFormColumn = 'p_p_form';
  static const String conjugationPPAudioColumn = 'pp_audio';
  
  // Lexemes Table
  static const String lexemesTable = 'lexemes';
  static const String lexemeIdColumn = 'id';
  static const String lexemeMainColumn = 'main';
  static const String lexemeTypeColumn = 'type';
  static const String lexemeTranslateColumn = 'translate';
  static const String lexemeExampleColumn = 'example';
  static const String lexemeMainAudioColumn = 'main_audio';

  // Derivations Table
  static const String derivationsTable = 'derivations';
  static const String derivationIdColumn = 'id';
  static const String derivationDerivedColumn = 'derived';
  static const String derivationExampleColumn = 'example';
  static const String derivationTranslateColumn = 'translate';
  static const String derivationPrefixColumn = 'prefix';
  static const String derivationSuffixColumn = 'suffix';
  static const String derivationTypeColumn = 'type';
  static const String derivationLexemeIdColumn = 'lexeme_id';
  static const String derivationDerivedAudioColumn = 'derived_audio';
}