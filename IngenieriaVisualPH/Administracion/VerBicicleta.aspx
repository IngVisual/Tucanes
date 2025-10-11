<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerBicicleta.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web153" %>
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
                        <strong>EDITAR SOLICITUD DE BICICLETERO</strong>
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
                                <label class=" form-control-label">NOMBRE:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtnombre" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">SALDO ADMINISTRACION</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtsaldo" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                           <div class="row">
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">MARCA</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                                    <asp:TextBox ID="txtmarca" CssClass="form-control" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">COLOR</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                                    <asp:TextBox ID="txtcolor" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">PARA RESIDENTE</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtpersona" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group col-xs-6 col-lg-3">
                                <label class=" form-control-label">TIPO DE SOLCITANTE</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txttiposolicitante" CssClass="form-control font-weight-bold text-success" runat="server" Enabled="False"></asp:TextBox>
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
                                                <asp:ListItem>En Lista, Esperando Cupo</asp:ListItem>
                                                <asp:ListItem>Desocupado, Libera el Cupo</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                              <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">SERIE</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-barcode"></i></div>
                                    <asp:TextBox ID="txtserie" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                              <div class="form-group col-xs-6 col-lg-4">
                                <label class=" form-control-label">TIPO DE CICLA</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                                    <asp:TextBox ID="txttipocicla" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
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
                            <div class="form-group col-xs-6 col-lg-6">
                            <label class=" form-control-label">ASIGNAR NUMERO BICICLETERO SI ES AUTORIZADO</Label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                                <asp:TextBox ID="txtnumeroparq" ForeColor="Red" CssClass="form-control" runat="server" Enabled="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-6">
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
                        <strong class="card-title">Yo &nbsp;&nbsp;<asp:Label ID="lblnombre2" runat="server" Text=""></asp:Label>&nbsp;&nbsp; ACEPTO la siguiente politica de Bicicletero:</strong>
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
                            <div class="col-xs-6 col-lg-6 bg-white">
                                <asp:Label ID="Label4" runat="server" CssClass="textocolorinfo" Font-Size="Small" Text="Con esta firma como PROPIETARIO me hago responsable de cumplir las politicas antes mencionadas y así mismo hacerlas cumplir de mi arrendatario en caso de que la solicitud sea para él." Font-Bold="True"></asp:Label>
                                <div class="card bordercolorinfo" style="border-radius: 7px">
                                    <img class="card-img-top" src="<%#Eval("firmaBici") %>" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title mb-3">FIRMA PROPIETARIO</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../SC/Bicicleta/cc/<%#Eval("cc") %>" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title mb-3">DOCUMENTO</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../SC/Bicicleta/tp/<%#Eval("tp") %>" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title mb-3">TARJETA DE PROPIEDAD O FACTURA</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-6">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../SC/Bicicleta/bicifoto/<%#Eval("bicifoto") %>" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title mb-3">FOTO BICICLETA</h4>
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
