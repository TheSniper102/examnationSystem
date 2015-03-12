<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="DeptCourse.aspx.cs" Inherits="DeptCourse" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView_InsCrs" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView_InsCrs_RowDeleting">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="crs_id">
                <ItemTemplate>
                    <asp:Label ID="lbl_des_crs_id" runat="server" Text='<%# Bind("Crs_Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="crs_name">
                <ItemTemplate>
                    <asp:Label ID="lbl_des_crs_name" runat="server" Text='<%# Bind("Crs_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dept_id">
                <ItemTemplate>
                    <asp:Label ID="lbl_des_ins_id" runat="server" Text='<%# Bind("dept_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dept_name">
                <ItemTemplate>
                    <asp:Label ID="lbl_des_ins_name" runat="server" Text='<%# Bind("dept_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            sory,no data found
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
     <br />
    <br />
     <table>
        <tr>
            <td>Choose Department</td>
            <td>
                <asp:DropDownList ID="ddl_inst" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="vertical-align:top">assign courses<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please select course" ControlToValidate="lbx_crs" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td style="vertical-align:top">
                <asp:ListBox ID="lbx_crs" runat="server" Height="89px" SelectionMode="Multiple" Width="113px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td >
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Italic="True" Font-Size="Medium" ForeColor="#990000" />
            </td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" Height="29px"  Width="108px" OnClick="btn_save_Click" CssClass="four1" />
                <br />
                <br />
                <asp:Image ID="img_result" runat="server" Height="20" ImageUrl="~/images/ok_16x16.gif" Visible="false" Width="20" />
                <asp:Label ID="lbl_res" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#009933"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

