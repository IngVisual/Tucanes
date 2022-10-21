<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="EditarValor.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web129" %>
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
               <div class="alert alert-warning" id="div1" runat="server" style="margin-top: 10px;">
                   <span class="badge badge-pill badge-danger">IMPORTANTE</span>
                   Administrador(a) no olvide que si actualiza el SALDO tambien debe actualizar los valores de descuentos.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
               </div>
                <div class="card" style="border-radius: 7px">
                    <div id="tablero6">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xs-6 col-lg-3">
                                    <div>
                                        <asp:TextBox ID="txtvalor" CssClass="form-control" TextMode="Number" Placeholder="Ingrese Valor" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-7">
                                    <div>
                                        <asp:TextBox ID="txtadmn" CssClass="form-control" Placeholder="Ingrese Tipo de Administracion" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <div>
                                        <asp:Button ID="btnguavalAdm" runat="server" OnClick="btnguavalAdm_Click" Text="Actualizar" CssClass=" btn-primary font-weight-bold form-control border-light" />
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
