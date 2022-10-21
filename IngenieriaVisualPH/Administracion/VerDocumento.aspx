<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerDocumento.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web18" %>
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
    <form id="fo2" runat="server">
        <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
            <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />
        </div>
        <asp:Label ID="lblemail1" runat="server" Visible="false"></asp:Label>
        <div class="container" id="conta">
            <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                <strong>Debes llenar todas las cajas de texto</strong>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card border-danger" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>EDITAR SOLICITUD DE PARQUEADERO</strong>
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
                                <label class=" form-control-label">DESTINADO A:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtdest" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">SALDO ADMINISTRACION</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtnom" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                           <div class="row">
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">PLACA MOTO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                    <asp:TextBox ID="txtmoto" CssClass="form-control" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">PLACA CARRO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                    <asp:TextBox ID="txtcarro" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">CARRO-MOTO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                    <asp:TextBox ID="txtcarmot" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                         <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">ESTADO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                                    <asp:DropDownList ID="ddestado" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                                <asp:ListItem>Solicitud</asp:ListItem>
                                                <asp:ListItem>Autorizado</asp:ListItem>
                                                <asp:ListItem>No Autorizado</asp:ListItem>
                                                <asp:ListItem>En Lista, Esperando Cupo</asp:ListItem>
                                                <asp:ListItem>Aprobado para Sorteo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                              <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">NUM TARJETA</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-barcode"></i></div>
                                    <asp:TextBox ID="txttp" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                              <div class="form-group col-xs-6 col-lg-6">
                                <label class=" form-control-label">DESCRIPCION DEL VEHICULO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-align-justify"></i></div>
                                    <asp:TextBox ID="txtobs" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                              <div class="form-group col-xs-6 col-lg-12">
                                <label class=" form-control-label">RESPUESTA</label>-Fecha Respuesta:_<asp:Label ID="lblfecha" runat="server"></asp:Label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-mail-reply"></i></div>
                                    <asp:TextBox ID="txtres" ForeColor="Red" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-3">
                                <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Guardar Solicitud" OnClick="btnactualizar_Click"  OnClientClick="return confirm('¿Esta seguro(a) de enviar esta respuesta?');" />
                            </div>
                            <div class="col-xs-6 col-lg-3">
                                <asp:Button ID="btneliminar" Style="border-radius: 5px" Visible="false" runat="server" Font-Bold="true" class="btn btn-lg btn-danger btn-block" Text="Eliminar Solicitud" OnClientClick="return confirm('¿Esta seguro(a) de eliminar la solicitud?');" OnClick="btneliminar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section id="politica" runat="server">
                <div class="col-xs-6 col-lg-12">
                <div class="card border border-danger">
                    <div class="card-header">
                        <strong class="card-title">Yo &nbsp;&nbsp;<asp:Label ID="lblnombre2" runat="server" Text=""></asp:Label>&nbsp;&nbsp; ACEPTO la siguiente politica de Parqueaderos:</strong>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            <asp:Label ID="lblmsm" Font-Size="Small" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                </div>
               </div>
            </section>
            <div class="col-xs-6 col-lg-12">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                        <div class="row">
                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../Parqueadero/Cedula/<%#Eval("Cedula") %>" alt="Card image cap">
                                    <div class="card-body">
                                    <h4 class="card-title mb-3">CEDULA</h4>
                                </div>
                                </div>
                            </div>
                              <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../Parqueadero/Soat/<%#Eval("Soat") %>" alt="Card image cap">
                                 <div class="card-body">
                                    <h4 class="card-title mb-3">SOAT</h4>
                                </div>
                                </div>
                            </div>
                      </div>
                            <div class="row">
                                <div class="col-xs-6 col-lg-6">
                                    <div class="card border-danger" style="border-radius: 7px">
                                        <img class="card-img-top" src="../Parqueadero/TarjetaP/<%#Eval("TarjetaP") %>" alt="Card image cap">
                                    <div class="card-body">
                                    <h4 class="card-title mb-3">TARJETA DE PROPIEDAD</h4>
                                </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-6">
                                    <div class="card border-danger" style="border-radius: 7px">
                                        <img class="card-img-top" src="../Parqueadero/Tecnomecanica/<%#Eval("TecnoM") %>" alt="Card image cap">
                                     <div class="card-body">
                                    <h4 class="card-title mb-3">TECNOMECANICA</h4>
                                </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-lg-6">
                                    <div class="card border-danger" style="border-radius: 7px">
                                        <img class="card-img-top" src="../Parqueadero/Vehiculo/<%#Eval("Vehiculo") %>" alt="Card image cap">
                                  <div class="card-body">
                                    <h4 class="card-title mb-3">VEHICULO</h4>
                                </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- .animated -->
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
