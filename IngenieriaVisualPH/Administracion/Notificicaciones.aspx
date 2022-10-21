<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="Notificicaciones.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web116" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <link href="../Diseño/Video.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;

        function ShowVideo() {
           document.getElementById("conta").style.display = "none"
           document.getElementById("procesando").style.display = "none"
        }
        function CloseVideo() {
            document.getElementById("conta").style.display = "block"
        }
    </script>
       <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
               <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />     
        </div>
    <%-- ------------------------------------------------------------------- --%>
      <input type="checkbox" onclick="ShowVideo()" id="btn-modale" />
        <label for="btn-modale" class="lbl-modale">Video Ayuda</label>
        <div class="modale">
            <div class="contenedor" id="mostrarvideo">
                  <header><strong>Video Instructivo (Puedes ajustar la velocidad de reproduccion en 1,5)</strong></header>
                <a href="Notificicaciones.aspx">&#10006;</a>
                <div class="contenido">
                   <iframe width="1000" height="550" src="https://www.youtube.com/embed/nKT2CpyFmi4" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="container" id="conta">
        <h3 class="text-center font-weight-bold text-light">Notificaciones</h3>
        <br />
        <form id="form1" runat="server">
            <div class="card align-content-center" style="border-radius:7px">
                <div class="card-body">
                    <a href="NotificaPush.aspx">
                        <div class="col-lg-6 col-lg-12">
                            <div class="card alert alert-success border border-success" style="border-radius: 13px">
                                <div >
                                    <div class="stat-widget-four">
                                        <div class="stat-icon dib">
                                            <i class="fa fa-bullhorn text-muted text-light"></i>
                                        </div>&nbsp;
                                        <div class="stat-content">
                                            <div class="text-left">
                                                <div class="stat-heading">
                                                    <asp:Label ID="label2" Font-Size="Medium" Text="Esta opcion es para enviar un MENSAJE MASIVO a la barra de notificaciones de los celulares, el mensaje no quedara registrado en la app " CssClass="font-weight-bold" runat="server"></asp:Label></div>
                                                <div class="stat-text">                                                  
                                            </div>
                                            <p><span class="badge badge-success pull-right">>> Ver Ventana</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </div>  
                    </a>
                      <a href="NotificaPushApp.aspx">
                        <div class="col-lg-6 col-lg-12">
                            <div class="card alert alert-info border-info" style="border-radius: 13px">
                                <div >
                                    <div class="stat-widget-four">
                                        <div class="stat-icon dib">
                                            <i class="fa fa-bell-o text-muted text-light"></i>
                                        </div>&nbsp;
                                        <div class="stat-content">
                                            <div class="text-left">
                                                <div class="stat-heading">
                                                    <asp:Label ID="label1" Font-Size="Medium" Text="Esta opcion es para enviar un MENSAJE MASIVO a la barra de notificaciones de los celulares y ese mismo mensaje quedara registrado en la app. Con esto los residentes cuando ingresen a la app pueden visualizar el mensaje, tambien puedes adjuntar documentos(.pdf) con el mensaje" CssClass="font-weight-bold" runat="server"></asp:Label></div>
                                                <div class="stat-text">                                                  
                                            </div>
                                            <p><span class="badge badge-info pull-right">>> Ver Ventana</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </div>
                    </a>
                    <a href="NotificaPushAppID.aspx">
                        <div class="col-lg-6 col-lg-12">
                            <div class="card alert alert-secondary border-secondary" style="border-radius: 13px">
                                <div >
                                    <div class="stat-widget-four">
                                        <div class="stat-icon dib">
                                            <i class="fa fa-user text-muted text-light"></i>
                                        </div>&nbsp;
                                        <div class="stat-content">
                                            <div class="text-left">
                                                <div class="stat-heading">
                                                    <asp:Label ID="label3" Font-Size="Medium" Text="Esta opcion es para enviar un mensaje a UNA SOLA VIVIENDA en la barra de notificaciones del celular y tambien quedara registrado en la app" CssClass="font-weight-bold" runat="server"></asp:Label></div>
                                                <div class="stat-text">                                                  
                                            </div>
                                            <p><span class="badge badge-secondary pull-right">>> Ver Ventana</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </a>
                    <a href="NotificaPushAppGroup.aspx">
                        <div class="col-lg-6 col-lg-12">
                            <div class="card alert alert-warning border-warning" style="border-radius: 13px">
                                <div >
                                    <div class="stat-widget-four">
                                        <div class="stat-icon dib">
                                            <i class="fa fa-users text-muted text-secondary"></i>
                                        </div>&nbsp;
                                        <div class="stat-content">
                                            <div class="text-left">
                                                <div class="stat-heading">
                                                    <asp:Label ID="label4" Font-Size="Medium" Text="Esta opcion es para enviar un mensaje a un GRUPO ESPECIFICO en la barra de notificaciones del celular y tambien quedara registrado en la app" CssClass="font-weight-bold" runat="server"></asp:Label></div>
                                                <div class="stat-text">                                                  
                                            </div>
                                            <p><span class="badge badge-warning pull-right">>> Ver Ventana</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </a>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
