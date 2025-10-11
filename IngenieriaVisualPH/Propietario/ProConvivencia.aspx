<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProConvivencia.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web151" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
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
          var data = new google.visualization.arrayToDataTable(<%=obtenerDatos()%>); 

        // Set chart options
        var options = {'title':'Estadisticas de Convivencia',
                       'width':300,
            'height': 300,
         is3D: true};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <section class="content">
        <div class="row">
            <div class="col-xs-6 col-sm-12">
                  <div class="card bordercolorinfo" style="border-radius:7px">
                    <div class="card-header">
                        <strong>Graficas de Convivencia</strong><small></small>
                    </div>
                    <div class="card-body card-block">
                        <div id="chart_div"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <section class="content">
                    <div class="col-lg-3 col-md-6">
                        <div class="card bordercolorinfo" style="border-radius:7px">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-user textocolorinfo bordercolorinfo"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-digit text-success"><asp:Label ID="lblcodigo" runat="server" CssClass="text-secondary font-weight-bold"></asp:Label></div>
                                        <div class="stat-digit"><asp:Label ID="lblsuma" runat="server" CssClass="text-secondary font-weight-bold"></asp:Label>&nbsp LLamados de Atencion</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

       </section>
    <section>
        <asp:Repeater ID="r1" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="border-radius: 5px">
                        <div class="card-body">
                            <div class="stat-widget-one">
                                <div class="stat-icon dib"><i class="ti-face-sad text-success border-success"></i></div>
                                <div class="stat-content dib">
                                    <h5 class="stat-text text-success">Vivienda: &nbsp
                                                    <asp:Label ID="label2" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Codigo1") %></asp:Label></h5>
                                    <p></p>
                                    <h5 class="stat-text text-success">Fecha: &nbsp
                                                    <asp:Label ID="label1" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("FechaInicio","{0:d}") %></asp:Label></h5>
                                    <p></p>
                                    <h5 class="stat-text text-success">Descripción de la queja:&nbsp
                                                    <asp:Label ID="label4" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("DescripcionPQR") %></asp:Label></h5>
                                    <h5 class="stat-text text-success">Observacion de Administracion:&nbsp
                                                    <asp:Label ID="label6" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Respuesta") %></asp:Label></h5>
                                    <p></p>
                                    <h5 class="stat-text text-success">Tipo de Queja: &nbsp;&nbsp
                                                    <asp:Label ID="label5" runat="server" Font-Size="Large" CssClass="text-secondary font-weight-bold"><%#Eval("Tipo") %></asp:Label></h5>
                                    <p></p>
                                    <div class="row">
                                        <div>
                                            <i class="fa fa-bullhorn"></i>
                                        </div>
                                        &nbsp;&nbsp<div class="text-light">
                                            <asp:Label ID="label3" runat="server" BackColor="#3366cc" Font-Size="Smaller" CssClass="text-light font-weight-bold form-control"><%#Eval("Estado") %></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <img class="card-img-top" src="../NovedadPQR/<%#Eval("ImagenQueja") %>" alt="Card image cap">
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>

</asp:Content>
