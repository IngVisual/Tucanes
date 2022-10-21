<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="EmpBitacora.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <div class="container">
              <style>
        body {
            background: #134E5E; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #71B280, #134E5E); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #71B280, #134E5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
             <script>
                 function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
        <link href="../Diseño/Banner.css" rel="stylesheet" />
         <div id="procesando" class="ventana">
             <img src="../Diseño/Imagenes/coheteLoading.gif" />
             <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Enviando Mensajes.....</h5>
         </div>
    <div class="container" id="conta">
     <h3 class="text-center text-light font-weight-bold">Recibos</h3>
        <form id="form1" runat="server">
            <aside class="profile-nav alt">
                    <section class="card">
                        <div class="card-header user-header alt bg-dark">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/rechargeable.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Enviar Mensaje de Energia(LUZ)</h3>
                                      <p>
                                      <asp:Button ID="btnluz" Font-Bold="true" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar mensaje sobre el recibo de la Energia(LUZ) a todo el conjunto?');" style="border-radius:5px" class="btn btn-lg btn-danger" Text="Enviar" OnClick="btnluz_Click"/>
                                     </p>
                                </div>
                            </div>
                        </div>
                    </section>
            </aside>
            <aside class="profile-nav alt">
                    <section class="card">
                        <div class="card-header user-header alt bg-dark">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/drop.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Enviar Mensaje de Agua</h3>
                                    <p>
                                      <asp:Button ID="btnagua" Font-Bold="true" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar mensaje sobre el recibo del AGUA a todo el conjunto?');" style="border-radius:5px" class="btn btn-lg btn-danger" Text="Enviar" OnClick="btnagua_Click"/>
                                     </p>
                                </div>
                            </div>
                        </div>
                    </section>
            </aside>
             <aside class="profile-nav alt">
                    <section class="card">
                        <div class="card-header user-header alt bg-dark">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/gas.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Enviar mensaje del Gas</h3>
                                    <p>
                                      <asp:Button ID="btngas" Font-Bold="true" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar mensaje sobre el recibo del GAS a todo el conjunto?');" style="border-radius:5px" class="btn btn-lg btn-danger" Text="Enviar" OnClick="btngas_Click"/>
                                     </p>
                                </div>
                            </div>
                        </div>
                    </section>
            </aside>
             <aside class="profile-nav alt">
                    <section class="card">
                        <div class="card-header user-header alt bg-dark">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/regi.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Enviar mensaje del Predial</h3>
                                                                        <p>
                                      <asp:Button ID="Button1" Font-Bold="true" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar mensaje sobre el recibo del PREDIAL a todo el conjunto?');" style="border-radius:5px" class="btn btn-lg btn-danger" Text="Enviar" OnClick="Button1_Click"/>
                                     </p>
                                </div>
                            </div>
                        </div>
                    </section>
            </aside>
        </form>
    </div>

</asp:Content>
