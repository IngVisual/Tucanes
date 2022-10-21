<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProVerResSal.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web132" %>

<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div>
        <h3 class="text-center textocolorinfo font-weight-bold ">Respuesta&nbsp;&nbsp;<span class="badge badge-primary mt-1"><asp:Label ID="lblestado" runat="server" Text=""></asp:Label></span></h3>
        <br />
        <form id="form1" runat="server">
            <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                Tu Mudanza esta AUTORIZADA, por favor no olvides seguir las recomendaciones de Administración, Gracias.
            </div>
            <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-danger">IMPORTANTE</span>
               Tiene una novedad con su Mudanza, Por favor preséntese a la Administración, Gracias.
            </div>
            <section>
                <div class="col-md-6">
                    <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Fecha Solicitud--<asp:Label ID="lblfecini" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></strong>
                            <p></p>
                            <p>Observacion o Articulos:&nbsp;&nbsp;<asp:Label Font-Size="Small" ID="lblobse" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Tipo de Solicitud:&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltipo" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Mudanza desde:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfeini" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Hasta:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblfefin" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>
                            <p>Persona Encargada:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblpeenca" Font-Size="Small" CssClass="font-weight-bold textocolorinfo" runat="server" Text=""></asp:Label></p>                           
                            
                            <div class="col-sm3">
                                <asp:Button ID="bttnpdf" CssClass=" btncolorinfo font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite" runat="server" Text="Ver PDF" Font-Bold="True" OnClick="bttnpdf_Click" />
                            </div>
                        </div>
                    </div>
                    <br />
                     <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Respuesta--<asp:Label ID="lblfechres" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                <asp:Label ID="lblresp" CssClass="textocolorinfo" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div> 
                    
                    <br />
                    <div class="card bordercolorinfo" style="border-radius:7px">
                        <div class="card-header">
                            <strong class="card-title">Novedad del Vigilante en la Mudanza</strong>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                <asp:Label ID="lblnove" CssClass="textocolorinfo"  runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                   <div>
                </div>
            </div>
          </section>
            <section>
                <asp:Repeater ID="r1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                             <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="../Mudanzas/Cedula/<%#Eval("Cedula") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">CEDULA</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                              <div class="card bordercolorinfo" style="border-radius:7px">
                                <img class="card-img-top" src="<%#Eval("Firma") %>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">Firma del Propietario</h4>
                                    <p>Propietario:&nbsp;&nbsp;&nbsp;<asp:Label ID="lblpro" CssClass="font-weight-bold text-success" runat="server" Text='<%#Eval("Autorizado") %>'></asp:Label></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
            <section >
               <div class="card bordercolorinfo" style="border-radius:7px">
                    <div class="card-header">
                        <strong class="card-title">Yo &nbsp;&nbsp;<asp:Label ID="lblusuario" runat="server" Text=""></asp:Label>&nbsp;&nbsp; ACEPTO la siguiente politica de Mudanzas y Articulos:</strong>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            <asp:Label ID="lblmsm" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                </div> 
            </section>
        </form>
        <br />
    </div>
</asp:Content>
