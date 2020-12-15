using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using ZallpyProj.Models;

namespace ZallpyProj.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class QuestionsController : ControllerBase
    {

        [HttpGet]
        public List<Questions> Get()
        {
            return QuizQuestions.GetQuizQuestions();
        }
    }
}
