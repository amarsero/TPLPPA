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

        public string ReporteTarjetasPorEmpleado()
        {
            //    Highcharts chart = new DotNet.Highcharts.Highcharts("Cantidad de patos en Australia")
            //.SetXAxis(new XAxis
            //{
            //    Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
            //})
            //.SetSeries(new Series
            //{
            //    Data = new Data(new object[] { 29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 }),
            //    Name = "Judios muertos"
            //});
            //    chart.SetYAxis(new YAxis()
            //        {
            //            Title = new YAxisTitle()
            //            {
            //                Text = "En millones"
            //            }
            //        });
            //    chart.SetTitle(new Title() { Text = "Judios muertos en Alemania en 1939" });

            BLL.BLLHistoricoSolicitudTarjeta bll = new BLL.BLLHistoricoSolicitudTarjeta();

            var hist = bll.ObtenerHistoricoSolicitudTarjetasPorEmpleado();

            Highcharts chart = new DotNet.Highcharts.Highcharts("Cantidad de patos en Australia");
            
            chart.InitChart(new DotNet.Highcharts.Options.Chart 
            { DefaultSeriesType = DotNet.Highcharts.Enums.ChartTypes.Column });

            chart.SetTitle(new Title()
                {
                    Text = "Cantidad de ventas por empleado"
                });

            object[] datos = new object[hist.Length];
            for (int i = 0; i < hist.Length; i++)
            {
                datos[i] = hist[i].Item2;
            }
            chart.SetSeries(new Series()
                {
                    Data = new Data(datos),
                    Name = "Empleados"
                });
            string[] cat = new string[hist.Length];
            for (int i = 0; i < hist.Length; i++)
            {
                cat[i] = hist[i].Item1;
            }
            chart.SetXAxis(new XAxis()
                {
                    Categories = cat,
                    
                });
            chart.SetYAxis(new YAxis()
                    {
                        Title = new YAxisTitle()
                        {
                            Text = "Tarjetas"
                        }
                    });

            string cadena = chart.ToHtmlString();

            cadena = cadena.Substring(193);
            cadena = cadena.Substring(0, cadena.Length - 17);
            cadena = cadena.Replace("Cantidad de patos en Australia_container", "Chart");

            return cadena;
        }
	}
}