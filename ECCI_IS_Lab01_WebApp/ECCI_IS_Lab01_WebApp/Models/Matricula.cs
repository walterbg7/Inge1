//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ECCI_IS_Lab01_WebApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Matricula
    {
        public int MatriculaID { get; set; }
        public Nullable<decimal> Nota { get; set; }
        public int CursoID { get; set; }
        public int EstudianteID { get; set; }
    
        public virtual Curso Curso { get; set; }
        public virtual Estudiante Estudiante { get; set; }
    }
}
