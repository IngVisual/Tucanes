<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="NovedadPagoPyZ.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web118" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />

    <form id="fo1" runat="server">
        <div class="container">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center textocolorinfo font-weight-bold ">Solicitud de Documentos</h3>
                </div>
            </div>
            <br />
            <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                <strong>Su solicitud se envió correctamente, por favor tenga presente que estas solicitudes se responden en horario de atención. ¿Desea ver su solicitud Enviada..? 
                                   &nbsp;&nbsp;<a href="ProTabResPag.aspx">
                        <button id="btnsi" type="button"  class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">Si</button></a>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Home.aspx">
                     <button id="btnno" type="button"  class="btn-block btn-secondary font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">No</button></a>
                </strong>
            </div>
            <div>
                <asp:Label ID="lblmensaje" runat="server" CssClass="form-control alert alert-danger"  Font-Bold="true" Visible="False"></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblcodigo" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="lblestado" runat="server" Text="Abierta" Visible="False"></asp:Label>
                <asp:Label ID="lblresp" runat="server" Text="Pendiente" Visible="False"></asp:Label>
                <asp:Label ID="lblfecha" runat="server" Text="Pendiente" Visible="False"></asp:Label>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">Describa su solicitud Ej: Paz y Salvo, Certificado de Vivienda etc..</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-edit"></i></div>
                    <asp:TextBox ID="txtobservacion" runat="server" Text="" CssClass="form-control" Enabled="True" TextMode="MultiLine" MaxLength="100"></asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Button ID="btnsave" runat="server" Text="Enviar Solicitud" CssClass="btn-block btn-lg form-control btncolorinfo font-weight-bold btn-block border border-light" OnClick="btnsave_Click" />
            <br />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</asp:Content>
