<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerSaldos.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web121" %>
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
            <h5 class="text-light text-center font-weight-bold">Administrador Trabajando....</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />
        </div>
    <div class="container" id="conta">
        <form id="fo2" runat="server">
            <div class="card" style="border-radius: 7px">
                <div class="card-title">
                    <h3 class="font-weight-bold">Editar Saldo
                        <asp:Label ID="lblcodigo" runat="server"></asp:Label></h3>
                </div>
                <div class="card-body">
                    <div class="col-xs-6 col-lg-12">
                        <div class="row">
                            <div class="col-xs-2 col-lg-2">
                                <label class=" form-control-label">Valor1</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtadm" CssClass="form-control font-weight-bold text-info" runat="server" Enabled="True"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtadm" Text="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-xs-2 col-lg-2">
                                <label class=" form-control-label">Valor2</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtinte" CssClass="form-control font-weight-bold text-info" runat="server" Enabled="True"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtinte" Text="*">
                                    </asp:RequiredFieldValidator>
                                    </div>
                            </div>
                            <div class="col-xs-2 col-lg-2">
                                <label class=" form-control-label">Valor3</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtsanc" CssClass="form-control font-weight-bold text-info" runat="server" Enabled="True"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtsanc" Text="*">
                                    </asp:RequiredFieldValidator>
                                    </div>
                            </div>
                            <div class="col-xs-2 col-lg-2">
                                <label class=" form-control-label">Valor4</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtpar" CssClass="form-control font-weight-bold text-info" runat="server" Enabled="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtpar" Text="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                               <div class="col-xs-2 col-lg-2">
                                <label class=" form-control-label">Valor5</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtotro" CssClass="form-control font-weight-bold text-info" runat="server" Enabled="True"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtotro" Text="*">
                                    </asp:RequiredFieldValidator>
                                    </div>
                            </div>
                            <div class="col-xs-2 col-lg-2">
                                <label class=" form-control-label">Valor6</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtretro" CssClass="form-control font-weight-bold text-info" runat="server" Enabled="True"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtretro" Text="*">
                                    </asp:RequiredFieldValidator>
                                    </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-lg-12">
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3 col-lg-6">

                            </div>
                            <div class="col-xs-3 col-lg-3">
                                <h3 class=" form-control-label">Total_<asp:CheckBox ID="checkSuma" runat="server" Checked="true" OnCheckedChanged="checkSuma_CheckedChanged"/></h3>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txttotal" CssClass="form-control font-weight-bold text-danger" Font-Size="X-Large" runat="server" Enabled="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txttotal" Text="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-xs-3 col-lg-3">
                                <h3 class=" form-control-label">A Favor</h3>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-money"></i></div>
                                    <asp:TextBox ID="txtfav" CssClass="form-control font-weight-bold text-success" Font-Size="X-Large" runat="server" Enabled="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic"
                                        ErrorMessage="" ForeColor="Red" ControlToValidate="txtfav" Text="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                                                     <br />
                                                        <br />
                        <div class="row">
                            <div class="col-xs-6 col-lg-8">
                                <div class="alert alert-danger" id="error2" runat="server" style="margin-top: 10px; display: none">
                                    <span class="badge badge-pill badge-danger">Error</span>
                                    <strong>La suma del total a pagar no es correcta</strong>
                                    &nbsp;&nbsp;
                                </div>
                                <div class="alert alert-success" id="error1" runat="server" style="margin-top: 10px; display: none">
                                    <span class="badge badge-pill badge-success">Listo</span>
                                    <strong>Saldo correcto, ya puede actualizar.</strong>
                                    &nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-2">
                                <asp:Button ID="Button1" Style="border-radius: 5px" runat="server" Font-Bold="true" class="btn btn-lg btn-primary btn-block" Text="Calcular" OnClick="Button1_Click"  />
                            </div>
                              <div class="col-xs-6 col-lg-2">
                                <asp:Button ID="btnactualizar" Style="border-radius: 5px" Visible="false" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Actualizar" OnClick="btnactualizar_Click" />
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
        </form>
    </div>
</asp:Content>
