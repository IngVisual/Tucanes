<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="EditarParqueadero.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web142" %>
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
                        <div class="col-xs-2 col-lg-2">
                            <label class=" form-control-label text-light"># Parqueadero</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtpar" CssClass="form-control" ReadOnly="true" runat="server" Enabled="False"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-lg-2">
                            <label class=" form-control-label text-light">Codigo</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtcod" TextMode="Number" CssClass="form-control " runat="server" Enabled="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-lg-2">
                            <label class=" form-control-label text-light">PlaVeh1</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtp1" CssClass="form-control " runat="server" Enabled="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-lg-2">
                            <label class=" form-control-label text-light">PlaVeh2</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtp2" CssClass="form-control " runat="server" Enabled="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-lg-2">
                            <label class=" form-control-label text-light">PlaVeh3</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtp3" CssClass="form-control " runat="server" Enabled="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-2 col-lg-2">
                            <label class=" form-control-label text-light">PlaVeh4</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-car"></i></div>
                                <asp:TextBox ID="txtp4" CssClass="form-control " runat="server" Enabled="True"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                 <div class="card-body">
                <div class="col-xs-6 col-lg-10">
                    <label class=" form-control-label text-light">Observaciones</label>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-mail-reply"></i></div>
                        <asp:TextBox ID="txtobs"  CssClass="form-control" runat="server" MaxLength="150" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                    </div>
                </div>
                    <div class="col-xs-6 col-lg-2">
                        <br />
                        <br />
                        <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Actualizar" OnClick="btnactualizar_Click" />
                    </div>
                     </div>
            </div>
            </form>
        </div>
</asp:Content>
