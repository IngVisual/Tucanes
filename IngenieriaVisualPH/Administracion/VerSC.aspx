<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerSC.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web112" %>
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
                <strong>Debes llenar todas los datos requeridos</strong>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card border-danger" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>EDITAR SOLICITUD DE SALON COMUNAL</strong>
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
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">FECHA DE SOLICITUD</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <asp:TextBox ID="txtfecha1" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">FECHA DEL EVENTO:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <asp:TextBox ID="txtfeceven" CssClass="form-control text-primary font-weight-bold " runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">SALDO ADMINISTRACION</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtnom" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                           <div class="row">
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">FECHA LIMITE DE PAGO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <asp:TextBox ID="txtfecpago" CssClass="form-control" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                                <div class="form-group col-xs-6 col-lg-7">
                                <label class=" form-control-label">SALON COMUNAL:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-building"></i></div>
                                    <asp:TextBox ID="txtsc" CssClass="form-control font-weight-bold" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                               <div class="form-group col-xs-6 col-lg-2">
                                <label class=" form-control-label">VALOR</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtval" CssClass="form-control font-weight-bold" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>  
                        <div class="row">
                              <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">NOMBRE</label>&nbsp;<asp:Label ID="lblpropi" runat="server" Text=""></asp:Label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtnombre" CssClass="form-control" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                            ErrorMessage="Debe ingresar nombre del solicitante" ControlToValidate="txtnombre" Text="Requerido *">
                                        </asp:RequiredFieldValidator>
                                </div>
                            </div>
                              <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">CEDULA</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                    <asp:TextBox ID="txtced" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                            ErrorMessage="Debe ingresar cedula" ControlToValidate="txtced" Text="Requerido *">
                                        </asp:RequiredFieldValidator>
                                </div>
                            </div>
                           <div class="form-group col-xs-6 col-lg-5">
                                <label class=" form-control-label">NOVEDAD ADM</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-align-justify"></i></div>
                                    <asp:TextBox ID="txtnov" CssClass="form-control" MaxLength="300" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                             <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">ESTADO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                                    <asp:DropDownList ID="ddestado" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>Solicitud</asp:ListItem>
                                                <asp:ListItem>Autorizado</asp:ListItem>
                                                <asp:ListItem>No Autorizado</asp:ListItem>
                                                <asp:ListItem>Novedad</asp:ListItem>
                                                <asp:ListItem>Finalizado</asp:ListItem>
                                                <asp:ListItem>Reserva Eliminada</asp:ListItem>
                                    </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorcon" runat="server" Display="Dynamic"
                                            ErrorMessage="Debe ingresar el estado de la solicitud" ControlToValidate="ddestado" Text="Requerido *">
                                        </asp:RequiredFieldValidator>
                                </div>
                            </div>
                              <div class="form-group col-xs-6 col-lg-8">
                                <label class=" form-control-label">RESPUESTA</label>-Fecha Respuesta:_<asp:Label ID="lblfecha" runat="server"></asp:Label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-mail-reply"></i></div>
                                    <asp:TextBox ID="txtres" ForeColor="Red" CssClass="form-control" runat="server" MaxLength="300"  TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                            ErrorMessage="Debe ingresar una respuesta" ControlToValidate="txtres" Text="Requerido *">
                                        </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-3">
                                <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar esta respuesta?');"  Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Guardar Solicitud" OnClick="btnactualizar_Click" />
                            </div>
                            <div class="col-xs-6 col-lg-3">
                                <asp:Button ID="btneliminar" Style="border-radius: 5px" Visible="false" runat="server" Font-Bold="true" class="btn btn-lg btn-danger btn-block" Text="Eliminar Solicitud" OnClientClick="return confirm('¿Esta seguro(a) de eliminar la solicitud?');" OnClick="btneliminar_Click"  />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section id="politica" runat="server">
                <div class="col-xs-6 col-lg-12">
                <div class="card border border-danger">
                    <div class="card-header">
                        <strong class="card-title">Yo &nbsp;&nbsp;<asp:Label ID="lblnombre2" runat="server" Text=""></asp:Label>&nbsp;&nbsp; ACEPTO la siguiente politica de Salon Comunal:</strong>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            <asp:Label ID="lblmsm" Font-Size="Small" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                    <div class="col-xs-6 col-lg-12">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                        <div class="row">
                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../SC/Recibo/<%#Eval("ReciboSC") %>" alt="Card image cap">
                                     <div class="card-body">
                                    <h4 class="card-title mb-3">RECIBO</h4>
                                </div>
                                </div>
                            </div>
                      </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- .animated -->
            </div>
                </div>
               </div>
            </section>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</asp:Content>
