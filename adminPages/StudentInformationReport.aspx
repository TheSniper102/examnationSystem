<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="StudentInformationReport.aspx.cs" Inherits="StudentInformationReport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>Select student ID</td>
            <td>
                <asp:DropDownList ID="ddl_stId" runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddl_stId_SelectedIndexChanged">
                    <asp:ListItem Value="0">--select student id--</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
    </table>
    <asp:GridView ID="St_GridView" runat="server" CellPadding="4" GridLines="None" ForeColor="#333333" Width="660px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

