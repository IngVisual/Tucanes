<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerChip.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web119" %>
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
    <form id="fo2" runat="server">
        <asp:Label ID="lblemail1" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblemail2" runat="server" Visible="false"></asp:Label>
        <div class="container" id="conta">
            <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                <strong>Debes llenar todas las cajas de texto</strong>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card border-danger" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Editar Solicitud de Chip</strong>
                    </div>
                    <div class="card-body card-block">
                        <div class="row">
                            <div class="form-group col-xs-6 col-lg-2">
                                <label class=" form-control-label">CODIGO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-barcode"></i></div>
                                    <asp:TextBox ID="txtcodigo" CssClass="form-control" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">FECHA DE SOLICITUD</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <asp:TextBox ID="txtfecha1" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">TIPO CHIP</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                                    <asp:TextBox ID="txttipo" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                          <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">SALDO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtsaldo" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">DESTINADO A:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtdest" CssClass="form-control" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-5">
                                <label class=" form-control-label">NOMBRE</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtnomb" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">CEDULA</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                    <asp:TextBox ID="txtcedu" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">ESTADO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                                    <asp:DropDownList ID="ddestado" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                        <asp:ListItem>Solicitud</asp:ListItem>
                                        <asp:ListItem>Autorizado</asp:ListItem>
                                        <asp:ListItem>No Autorizado</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">PERDIDA DE CHIP A:__</label><asp:Label ID="lblnuevo" runat="server"></asp:Label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-align-justify"></i></div>
                                    <asp:TextBox ID="txtobs" CssClass="form-control" runat="server" TextMode="MultiLine"  Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">RESPUESTA</label>-Fecha Respuesta:_<asp:Label ID="lblfecha" runat="server"></asp:Label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-mail-reply"></i></div>
                                    <asp:TextBox ID="txtres" ForeColor="Red" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-6">
                            </div>
                            <div class="col-xs-6 col-lg-3">
                                <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" OnClientClick="return confirm('¿Esta seguro(a) de enviar esta respuesta?');"  Text="Guardar Solicitud" OnClick="btnactualizar_Click" />
                            </div>
                            <div class="col-xs-6 col-lg-3">
                                <asp:Button ID="btneliminar" Style="border-radius: 5px" Visible="false" runat="server" Font-Bold="true" class="btn btn-lg btn-danger btn-block" Text="Eliminar Solicitud" OnClientClick="return confirm('¿Esta seguro(a) de eliminar la solicitud?');" OnClick="btneliminar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="row">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../Chip/Documento/<%#Eval("DocIdent") %>" alt="Card image cap">
                                </div>
                            </div>
<%--                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../Chip/Recibo/<%#Eval("Recibo") %>" alt="Card image cap">
                                </div>
                            </div>--%>
                        </ItemTemplate>
                    </asp:Repeater>
 
                    <!-- .animated -->
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</asp:Content>
