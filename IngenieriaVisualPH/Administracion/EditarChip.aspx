<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="EditarChip.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web132" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <link href="../Diseño/switch.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
     <div id="procesando" class="ventana" style="border-radius: 7px;">
        <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center text-light font-weight-bold">Editar </h3>
                </div>
           <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div id="tablero6">
                        <div class="card-body">
                            <div class="row">
                                 <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:TextBox ID="txtvalorchip" CssClass="form-control" TextMode="Number" Placeholder="Ingrese Valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-7">
                                    <div>
                                        <asp:TextBox ID="txtchip" CssClass="form-control" Placeholder="Ingrese Tipo de Chip" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btnchip" runat="server" OnClick="btnchip_Click" Text="Agregar" CssClass=" btn-primary font-weight-bold form-control border-light" />
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </form>
    </div>
</asp:Content>
