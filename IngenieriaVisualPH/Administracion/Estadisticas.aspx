<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="Estadisticas.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web135" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
        <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
            <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
          var data = new google.visualization.arrayToDataTable(<%=Torta()%>); 

        // Set chart options
        var options = {'title':'Tipos de PQRS',
                       'width':650,
            'height': 650,
         is3D: true};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center text-light font-weight-bold">Estadisticas del Conjunto</h3>
                </div>
            </div>
            <div class="content col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Estadisticas Generales</strong><small></small>
                    </div>
                    <div class="col-sm-12 mb-4">
                        <div class="card-group">
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblpqr" runat="server"></asp:Label></span>
                                    </div>

                                    <small class="text-muted text-uppercase font-weight-bold">PQRS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblllama" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">LLAMADOS DE ATENCION</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblsaldo2" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">NOVEDADES DE SALDO</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmuda2" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">SOLICITUDES DE MUDANZAS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <asp:Label ID="lblsc2" runat="server"></asp:Label>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">SOLICITUDES DE SALON COMUNAL</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblparqu2" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">SOLICITUDES DE PARQUEADERO</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Estadisticas de PQRS</strong>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-lg-6">
                            <div class="card-group">
                                <div class="card col-md-12 no-padding bg-flat-color-4">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblpqrab" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">ABIERTOS</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                                <div class="card col-md-12 no-padding bg-flat-color-3">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblpqrproc" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">EN PROCESO</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                                </div>
                             <div class="card-group">
                                <div class="card col-md-12 no-padding bg-flat-color-5">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4 ">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0 ">
                                            <span class="count">
                                                <asp:Label ID="lblpqrcer" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">CERRADOS</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                                <div class="card col-md-12 no-padding bg-flat-color-1">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4 ">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblpqrllam" runat="server"></asp:Label></span>
                                        </div>
                                        <small class="text-uppercase text-light font-weight-bold">LLAMADOS DE ATENCION</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-6">
                            <div class="card-body card-block">
                                <div id="chart_div"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
            
            <div class="content col-xs-6 col-lg-6">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Novedades de Saldo</strong>
                    </div>
                            <div class="card-group">
                                <div class="card col-md-4 no-padding bg-flat-color-4">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblnovabi" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">ABIERTAS</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                                <div class="card col-md-4 no-padding bg-flat-color-3">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblnovpro" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">EN PROCESO</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                                <div class="card col-md-4 no-padding bg-flat-color-5">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4 ">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0 ">
                                            <span class="count">
                                                <asp:Label ID="lblnovcerr" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">CERRADAS</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                            </div>
                     </div>
            </div>      
            
            <div class="content col-xs-6 col-lg-6">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>LLamados de Atencion</strong>
                    </div>
                            <div class="card-group">
                                <div class="card col-md-6 no-padding bg-flat-color-4">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblllaapli" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">APLICADOS</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                                <div class="card col-md-6 no-padding bg-flat-color-5">
                                    <div class="card-body">
                                        <div class="h1 text-muted text-right mb-4">
                                            <i class="fa fa-bar-chart-o text-light"></i>
                                        </div>
                                        <div class="h4 mb-0">
                                            <span class="count">
                                                <asp:Label ID="lblllacerr" runat="server"></asp:Label></span>
                                        </div>
                                        <small class=" text-uppercase text-light font-weight-bold">CERRADOS</small>
                                        <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                    </div>
                                </div>
                            </div>
                     </div>
            </div>      

            <div class="content col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Estadisticas de Mudanzas</strong><small></small>
                    </div>
                    <div class="col-sm-12 mb-4">
                        <div class="card-group">
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-truck"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmudsol" runat="server"></asp:Label></span>
                                    </div>

                                    <small class="text-muted text-uppercase font-weight-bold">SOLICITUDES ABIERTAS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-truck"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmudaut" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">AUTORIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-truck"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmudnoaut" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">NO AUTORIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-truck"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmudnov" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">CON NOVEDAD</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-truck"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmudfin" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">FINALIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Estadisticas de Salon Comunal</strong><small></small>
                    </div>
                    <div class="col-sm-12 mb-4">
                        <div class="card-group">
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblscsol" runat="server"></asp:Label></span>
                                    </div>

                                    <small class="text-muted text-uppercase font-weight-bold">SOLICITUDES ABIERTAS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblscres" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">RESERVAS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblscaut" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">AUTORIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblscnoaut" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">NO AUTORIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblscnov" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">CON NOVEDAD</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblscfin" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">FINALIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
            <div class="content col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Solicitudes de Parqueadero</strong><small></small>
                    </div>
                    <div class="col-sm-12 mb-4">
                        <div class="card-group">
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblparsol" runat="server"></asp:Label></span>
                                    </div>

                                    <small class="text-muted text-uppercase font-weight-bold">SOLICITUDES ABIERTAS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblparaut" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">AUTORIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblparnoaut" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">NO AUTORIZADOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblparlis" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">En Lista, Esperando Cupo</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-4 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblparsorte" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">Aprobado para Sorteo</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
