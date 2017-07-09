using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DotNet.Highcharts;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Helpers;

namespace Presentacion.Controllers
{
    public class ReportesController : Controller
    {
        //
        // GET: /Reportes/
        public ActionResult Index()
        {
            return View();
        }

        public string ReporteCantidadDePatosEnAustraliaPorMes()
        {
            Highcharts chart = new DotNet.Highcharts.Highcharts("Cantidad de patos en Australia")
        .SetXAxis(new XAxis
        {
            Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
        })
        .SetSeries(new Series
        {
            Data = new Data(new object[] { 29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 }),
            Name = "Judios muertos"
        });
            chart.SetYAxis(new YAxis()
                {
                    Title = new YAxisTitle()
                    {
                        Text = "En millones"
                    }
                });
            chart.SetTitle(new Title() { Text = "Judios muertos en Alemania en 1939" });
            string cadena = chart.ToHtmlString();


            cadena = cadena.Substring(193);
            cadena = cadena.Substring(0, cadena.Length - 17);
            cadena = cadena.Replace("Cantidad de patos en Australia_container", "Chart");

            return cadena;
        }
	}
}