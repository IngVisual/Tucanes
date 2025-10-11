<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="EditarAlquiler.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web156" %>
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
                <div class="col-xs-6 col-lg-12">
                    <div class="row">
                        <div class="col-xs-6 col-lg-3">
                            <label class=" form-control-label text-light">Ajustar Valor Total</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txttotal" CssClass="form-control " runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" Display="Dynamic"
                                    ErrorMessage="El email es requerido" ControlToValidate="txttotal" Text="No puede estar vacio">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-3">
                            <label class=" form-control-label text-light">Estado</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:DropDownList ID="ddestado" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                    <asp:ListItem>PAGO_FACTURADO</asp:ListItem>
                                    <asp:ListItem>PAGO_NOVEDAD</asp:ListItem>
                                    <asp:ListItem>ALQUILER_SIN_PAGO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-6">
                            <label class=" form-control-label text-light">Observaciones</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtobserv" TextMode="MultiLine" CssClass="form-control " runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-lg-4">
                    <label class=" form-control-label text-light"></label>
                    <div class="input-group">
                        <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Actualizar" OnClick="btnactualizar_Click" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
