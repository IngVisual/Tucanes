<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
 
   <form id="form1" runat="server">
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="Citofonia.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/cit.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label1" Font-Bold="true" Font-Size="Small" runat="server" Text="Citofonia"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpQuejas.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/officer.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label3" Font-Bold="true" Font-Size="Small" runat="server" Text="PQR"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>             
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpBitacora.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/recibo.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label5" Font-Bold="true" Font-Size="Small" runat="server" Text="Recibos"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
         <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="VigSC.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/evento (1).png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label7" Font-Bold="true" Font-Size="Small" runat="server" Text="SalonCo"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
                <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="VigSalidas.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/camion-de-reparto.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label8" Font-Bold="true" Font-Size="Small" runat="server" Text="Mudanza"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
         <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpMascota.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/dog1.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label14" Font-Bold="true" Font-Size="Small" runat="server" Text="Mascotas"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpCicla.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/bici.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label13" Font-Bold="true" Font-Size="Small" runat="server" Text="Bicicleta"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="VigParquea.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/estacionamiento.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label4" Font-Bold="true" Font-Size="Small" runat="server" Text="Vehiculo"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="Arriendo.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/alquilar.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label6" Font-Bold="true" Font-Size="Small" runat="server" Text="Arriendo"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
         <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpRegistroVisitantes.aspx">
                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/regi.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label2" Font-Bold="true" Font-Size="Small" runat="server" Text="Visitas"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
       <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="Empalquilerparq.aspx">
                        <button type="button" class="bg-primary text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/ingalquiler.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label9" Font-Bold="true" Font-Size="Small" runat="server" Text="InicioAlq"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
          <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="Vertablaalquiler.aspx">
                        <button type="button" class="bg-primary text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/finalquiler.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label10" Font-Bold="true" Font-Size="Small" runat="server" Text="FinalAlq"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
         <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="AlquilerResultadosPorTiempo.aspx">
                        <button type="button" class="bg-primary text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/tablapagos.png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label11" Font-Bold="true" Font-Size="Small" runat="server" Text="PagosAlq"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>
        <div class="col-xs-2">
            <section class="card card border border-success" style="border-radius: 10px">
                <div class="card-body text-secondary">
                    <a href="EmpAlquilerParqueaderoCM.aspx">
                        <button type="button" class="bg-danger text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                            <img class="mx-auto d-block" src="../Diseño/Imagenes/calculator (1).png" alt="Card image cap" width="45" height="45">
                            <asp:Label ID="Label12" Font-Bold="true" Font-Size="Small" runat="server" Text="CajaParq"></asp:Label>
                        </button>
                    </a>
                </div>
            </section>
        </div>

    </form>
    <br />

</asp:Content>
