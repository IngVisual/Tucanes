<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="NovedadPagoSel.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web117" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
         <div class="alert alert-warning" id="error1" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Sugerencia</span>
                Hola Residente. Los recibos no son necesarios de enviar, por favor guarda tus recibos para que los puedas enviar cuando tengas una novedad o problema con tu saldo.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
            </div>
                <h3 class="text-center textocolorinfo font-weight-bold">Saldos de Administración actualizados hasta la fecha:&nbsp;&nbsp;</h3>
        <br />
        <h3 class="text-center textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right animate__animated animate__fadeInLeft animate__infinite animate__delay-2s"></i><asp:Label ID="lblfecha" Font-Size="XX-Large" runat="server" Text='<%#Eval("Fecha") %>'></asp:Label></h3>
        <br />
     <div class="container">
                <h3 class="text-center textocolorinfo font-weight-bold">Novedades de Pago</h3>
         <br />
         <form id="fo1" runat="server">
             <div class=" col-sm-12">
                 <div class="card bordercolorinfo">
                     <div class="card-body">
                         <div class="card-title">
                             <h3 class="text-center">Seleccione una opción</h3>
                         </div>
                         <div class="card">
                             <div class="card-body">
                                 <br />
                                 <a><asp:RadioButton ID="RadioButton1" OnCheckedChanged="Page_Load" runat="server" Text=" ¿Desea enviar su recibo de pago?" class="font-weight-bold" GroupName="SolPago" /></a>
                                 <br />
                                 <br />
                                 <asp:RadioButton ID="RadioButton2" OnCheckedChanged="Page_Load" runat="server" Text=" ¿Tiene un problema con su saldo y desea realizar una novedad a la administración?" CssClass="font-weight-bold" GroupName="SolPago" />
                                 <br />
                                 <br />
                                 <asp:RadioButton ID="RadioButton3" runat="server" Text=" ¿Desea solicitar un Paz y Salvo u otro certificado?" CssClass="font-weight-bold" GroupName="SolPago" />
                                 <br />
                                 <br />
                                 <div class="col-sm-3">
                                     <asp:Button ID="btnactualizar" runat="server" Font-Bold="true" class="btn-block btncolorinfo form-control border border-light" Text="Siguiente" OnClick="btnactualizar_Click" />
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </form>
    </div>
</asp:Content>
