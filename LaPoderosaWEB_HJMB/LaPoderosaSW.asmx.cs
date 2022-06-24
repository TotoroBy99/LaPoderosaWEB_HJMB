using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using LaPoderosaWEB_HJMB.Models;

namespace LaPoderosaWEB_HJMB
{
    /// <summary>
    /// Descripción breve de LaPoderosaSW
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class LaPoderosaSW : System.Web.Services.WebService
    {
        //Llamamos al contenedor de la base de datos
        LaPoderosa_ModelContainer db = new LaPoderosa_ModelContainer();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        [WebMethod]
        public List<SWLaPoderosa> Listar_Categorias()
        {
            return db.Categorias.Select(x => new SWLaPoderosa()
            {
                Id = x.Id,
                Nombre = x.Nombre
            }).ToList();
        }

        [WebMethod]
        public List<SWLaPoderosa> Listar_Proveedores()
        {
            return db.Proveedores.Select(x => new SWLaPoderosa()
            {
                Id = x.Id,
                Nombre = x.Nombre
            }).ToList();
        }

        [WebMethod]
        public List<SWLaPoderosa> Listar_Productos()
        {
            return db.Productos.Select(x => new SWLaPoderosa()
            {
                Id = x.Id,
                Nombre = x.Nombre,
                ProvId = x.ProveedorId,
                CatId = x.CategoriaId,
                CantUnid = x.CantidadUnidad,
                PrecioUnid = x.PrecioUnidad,
                UnidExist = x.UnidadExistencia
        }).ToList();
        }

        [WebMethod]
        public List<SWLaPoderosa> List_ProdxCateg(int catid)
        {
            return db.Productos.Where(x => x.CategoriaId == catid).Select(x => new SWLaPoderosa()
            {
                Id = x.Id,
                Nombre = x.Nombre,
                ProvId = x.ProveedorId,
                CatId = x.CategoriaId,
                CantUnid = x.CantidadUnidad,
                PrecioUnid = x.PrecioUnidad,
                UnidExist = x.UnidadExistencia
            }).ToList();
        }

        [WebMethod]
        public List<SWLaPoderosa> List_ProdxProv(int provid)
        {
            return db.Productos.Where(x => x.ProveedorId == provid).Select(x => new SWLaPoderosa()
            {
                Id = x.Id,
                Nombre = x.Nombre,
                ProvId = x.ProveedorId,
                CatId = x.CategoriaId,
                CantUnid = x.CantidadUnidad,
                PrecioUnid = x.PrecioUnidad,
                UnidExist = x.UnidadExistencia
            }).ToList();
        }

        [WebMethod]
        public List<SWLaPoderosa> List_ProdxName(string nom)
        {
            return db.Productos.Where(x => x.Nombre == nom).Select(x => new SWLaPoderosa()
            {
                Id = x.Id,
                Nombre = x.Nombre,
                ProvId = x.ProveedorId,
                CatId = x.CategoriaId,
                CantUnid = x.CantidadUnidad,
                PrecioUnid = x.PrecioUnidad,
                UnidExist = x.UnidadExistencia
            }).ToList();
        }

        public partial class SWLaPoderosa
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
            public int ProvId { get; set; }
            public int CatId { get; set; }
            public int CantUnid { get; set; }
            public int PrecioUnid { get; set; }
            public int UnidExist { get; set; }
        }
    }    
}
