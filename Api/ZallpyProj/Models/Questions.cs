using System.Collections.Generic;

namespace ZallpyProj.Models
{
    public class Questions
    {
        public string AssemblerName { get; set; }
        public int CorrectAnswer { get; set; }
        public List<string> Answers { get; set; }
    }
}
