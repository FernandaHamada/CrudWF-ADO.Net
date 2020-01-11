using CrudWEF2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace CrudWEF2.Controllers
{
    public class HomeController : Controller
    {
        public IConfiguration Configuration { get; }
        public NEG.Teacher _teacherNeg { get; set; }
        public HomeController(IConfiguration configuration)
        {
            Configuration = configuration;
            _teacherNeg = new NEG.Teacher(configuration);
        }
        public IActionResult Index()
        {
            Entidades.Teacher _objFiltro = new Entidades.Teacher();
            List<Entidades.Teacher> lista = new List<Entidades.Teacher>();
            // NEG.Teacher teacherNeg = new NEG.Teacher(Configuration);

            lista = _teacherNeg.GetTeachers(_objFiltro).ToList();

            List<Models.Teacher> listaModels = new List<Teacher>();

            foreach (var item in lista)
            {
                Models.Teacher objDaLista = new Teacher();
                objDaLista.Id = item.Id;
                objDaLista.Name = item.Name;
                objDaLista.Salary = item.Salary;
                objDaLista.Skills = item.Skills;
                objDaLista.TotalStudents = item.TotalStudents;
                objDaLista.AddeOn = item.AddeOn;
                listaModels.Add(objDaLista);
            }

            return View(listaModels);
        }

        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Teacher teacher)
        {
            if (ModelState.IsValid)
            {
                //NEG.Teacher teacherNeg = new NEG.Teacher(Configuration);

                Entidades.Teacher objTeacher = new Entidades.Teacher();
                objTeacher.Name = teacher.Name;
                objTeacher.Skills = teacher.Skills;
                objTeacher.TotalStudents = teacher.TotalStudents;
                objTeacher.Salary = teacher.Salary;
                objTeacher.AddeOn = DateTime.Now;

                try
                {
                    _teacherNeg.InsertTeacher(objTeacher);
                    return RedirectToAction("Index");

                }
                catch (Exception)
                {

                    throw;
                }


            }
            else
                return View();
        }
        public IActionResult Update(int id)
        {
            try
            {
                Entidades.Teacher teacher = new Entidades.Teacher() { Id = id };
                teacher = _teacherNeg.GetTeachers(teacher).FirstOrDefault();

                Models.Teacher teacherModels = new Teacher()
                {
                    Id = teacher.Id,
                    Name = teacher.Name,
                    Skills = teacher.Skills,
                    TotalStudents = teacher.TotalStudents,
                    Salary = teacher.Salary,
                    AddeOn = teacher.AddeOn,
                };
                return View(teacherModels);
            }
            catch
            {
                throw;
            }
        }

        [HttpPost]
        [ActionName("Update")]
        public IActionResult Update(Entidades.Teacher teacher)
        {
            try
            {
                _teacherNeg.UpdateTeacher(teacher);
                return RedirectToAction("Index");
            }
            catch
            {
                throw;
            }

        }

        [HttpPost]
        public IActionResult Delete(Entidades.Teacher teacher)
        {
            //NEG.Teacher teacherNeg = new NEG.Teacher(Configuration);
            // Entidades.Teacher objTeacher = new Entidades.Teacher();       

            try
            {
                _teacherNeg.DeleteTeacher(teacher);
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
