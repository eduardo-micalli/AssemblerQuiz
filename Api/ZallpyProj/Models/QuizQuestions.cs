using System.Collections.Generic;

namespace ZallpyProj.Models
{
    public static class QuizQuestions
    {
        public static List<Questions> GetQuizQuestions()
        {

            List<Questions> questions = new List<Questions>();

            List<string> answers = new List<string>();
            answers.Add("Inglaterra");
            answers.Add("USA");
            answers.Add("Alemanha");
            answers.Add("Japão");

            questions.Add(new Questions()
            {
                AssemblerName = "BMW",
                CorrectAnswer = 3,
                Answers = answers
            });

            questions.Add(new Questions()
            {
                AssemblerName = "Toyota",
                CorrectAnswer = 4,
                Answers = answers
            });

            questions.Add(new Questions()
            {
                AssemblerName = "Mini",
                CorrectAnswer = 1,
                Answers = answers
            });

            questions.Add(new Questions()
            {
                AssemblerName = "General Motors",
                CorrectAnswer = 2,
                Answers = answers
            });

            questions.Add(new Questions()
            {
                AssemblerName = "Rolls-Royce",
                CorrectAnswer = 1,
                Answers = answers
            });

            return questions;
        }
    }
}
