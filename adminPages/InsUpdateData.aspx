<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="InsUpdateData.aspx.cs" Inherits="InsUpdateData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <table>
        <tr>
            <td>
                &nbsp;</td>
            </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField HeaderText="Ins_Id">
                            <EditItemTemplate>
                                <asp:Label ID="Ins_Id" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_edit_InsName" runat="server" Text='<%# Bind("Ins_Name") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_edit_InsAddress" runat="server" Text='<%# Bind("Ins_Address") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ins_Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_edit_InsEmail" runat="server" Text='<%# Bind("Ins_Email") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ins_Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                            <EditItemTemplate>
                                <asp:Label ID="Ins_Salary" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_edit_InsPhone" runat="server" Text='<%# Bind("Ins_Phone") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Ins_Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dept_Id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="edit_drp_IdNam" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Dept_Name" DataValueField="Dept_Id" SelectedValue='<%# Bind("Dept_id") %>' CssClass="small_inpt">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="select_dept" TypeName="B_Instractor"></asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Dept_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </td>
            </tr>
        <tr>
            <td>
                <asp:Button ID="btn_ins_change_pass" runat="server" OnClick="btn_ins_change_pass_Click" Text="Change_Password" CssClass="four1" />
            </td>
        </tr>
    </table>
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>

