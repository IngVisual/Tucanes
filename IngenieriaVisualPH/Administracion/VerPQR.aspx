<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerPQR.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web14" %>
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
        <asp:Label ID="lblemail2" runat="server" Visible="false"></asp:Label>
        <div class="container" id="conta">
            <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                <strong>Debes llenar todas las cajas de texto</strong>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card border-danger" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Editar PQR</strong>
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
                            <div class="form-group col-xs-6 col-lg-6">
                                <label class=" form-control-label">NOMBRE</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                    <asp:TextBox ID="txtnom" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-6 col-lg-6 ">
                                <label class=" form-control-label">TIPO DE QUEJA</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                    <asp:TextBox ID="txtced" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-2">
                                <label class=" form-control-label">QUEJA POR:</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-gavel"></i></div>
                                    <asp:TextBox ID="txtcodigo1"  CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-4 ">
                                <label class=" form-control-label">ESTADO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                                    <asp:DropDownList ID="ddestado" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                        <asp:ListItem>Abierta</asp:ListItem>
                                        <asp:ListItem>En Proceso</asp:ListItem>
                                        <asp:ListItem>Cerrada</asp:ListItem>
                                        <asp:ListItem>Queja Cerrada</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-xs-6 col-lg-6">
                                <label class=" form-control-label">DESCRIPCION DE PQR</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-align-justify"></i></div>
                                    <asp:TextBox ID="txtobs" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-lg-6">
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
                                <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" Font-Bold="true" OnClientClick="return confirm('¿Esta seguro(a) de enviar esta respuesta?');"  class="btn btn-lg btn-success btn-block" Text="Guardar Solicitud" OnClick="btnactualizar_Click" />
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
                            <div class="col-xs-6 col-lg-8">
                                <div class="card border-danger" style="border-radius: 7px">
                                    <img class="card-img-top" src="../NovedadPQR/<%#Eval("ImagenQueja") %>" alt="Card image cap">
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="col-xs-6 col-lg-12">
                        <div class="content" id="tabLla" runat="server">
                            <div class="animated fadeIn">
                                <div class="card" style="border-radius: 7px">
                                    <div class="card-header">
                                        <strong class="card-title">LLAMADOS DE ATENCION--<asp:Label ID="lblllaate" runat="server"></asp:Label></strong>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <asp:Repeater ID="r2" runat="server">
                                                <HeaderTemplate>
                                                    <thead class="thead-dark" style="border-radius: 5px">
                                                        <tr>
                                                            <th>Estado</th>
                                                            <th>Tipo de Queja</th>
                                                            <th>Impuesta por:</th>
                                                            <th>Descripcion</th>
                                                            <th>Msg Adm</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="alert alert-danger">
                                                            <%#Eval("Estado") %></td>
                                                        <td>
                                                            <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small></td>
                                                        <td>
                                                            <small class="text-danger"><i class="fa fa-legal">&nbsp;<%#Eval("Codigo") %></i></small></td>
                                                        <td>
                                                            <small><%#Eval("DescripcionPQR") %></small></td>
                                                        <td>
                                                            <small><%#Eval("Respuesta") %></small></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </tbody>
                                              </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
