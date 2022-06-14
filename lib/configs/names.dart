//--DBName:
final dbName = 'dbName.db';

//--Application names:
const String APP_NAME = 'KAMSYA';
const String APP_DESC = 'POS Kambingnya Abu Rasya'; //'MHzPOS for Abu Rasya';
const String TAG_LINE = 'InshaAllah Barokah'; //'Simple but usefull for anyone';
const String WA_ADMIN = '971562681844';

//--Services names:
// const String BASE_URL = "http://10.0.2.2/tron-siode/"; // Emulator
// const String BASE_URL = "http://kamsya.com/"; // Real Web
const String BASE_URL =
    'http://192.168.0.181/trg-kamsya/'; // Emulator with Real Device or Website

const int TIME_OUT_DURATION = 30; //--Seconds

//--Column name form DB for SQLIte DB:
//Test again:
//--Table Category:
final tableCategoryName = 'Category';
final colMainCategoryId = 'ID';
final colMainCategoryName = 'Name';
final colMainCategoryImage = 'Image';

//--Table Question:
final tableQuestionName = 'Question';
final colQuestionId = 'ID';
final colQuestionText = 'QuestionText';
final colQuestionIsImage = 'IsImageQuestion';
final colQuestionImage = 'QuestionImage';
final colQuestionAnswerA = 'AnswerA';
final colQuestionAnswerB = 'AnswerB';
final colQuestionAnswerC = 'AnswerC';
final colQuestionAnswerD = 'AnswerD';
final colQuestionCorrectAnswer = 'CorrectAnswer';
final colQuestionCategoryId = 'CategoryID';
