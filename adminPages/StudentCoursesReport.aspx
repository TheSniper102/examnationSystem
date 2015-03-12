<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="StudentCoursesReport.aspx.cs" Inherits="StudentCoursesReport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>Choose Search type
            </td>
            <td>
                <asp:DropDownList ID="ddl_searchtype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_searchtype_SelectedIndexChanged">

                    <asp:ListItem Value="0">student</asp:ListItem>
                    <asp:ListItem Value="1">course</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_search" runat="server" Text="choose "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_seachword" runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddl_seachword_SelectedIndexChanged">
                    <asp:ListItem Value="0">--select one--</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:GridView ID="st_crs_GridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>

