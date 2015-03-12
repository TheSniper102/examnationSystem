<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="AllInstractor.aspx.cs" Inherits="AllInstractor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                   <table style="width:100%;" __designer:mapid="79a">
        <tr __designer:mapid="79b">
            <td __designer:mapid="79c">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="847px" CellPadding="4" GridLines="None" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Ins_Id">
                            <EditItemTemplate>
                                <asp:Label ID="edit_ins_id" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_name" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_addrs" runat="server" Text='<%# Bind("Ins_Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Ins_Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_email" runat="server" Text='<%# Bind("Ins_Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ins_Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_phone" runat="server" Text='<%# Bind("Ins_Phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ins_Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_salary" runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dept_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="edit_ins_deptid" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Dept_Name" DataValueField="Dept_Id" AutoPostBack="True" SelectedValue='<%# Bind("Dept_id") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="select_dept" TypeName="B_Instractor"></asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Dept_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
                <br __designer:mapid="7ce" />
                <br __designer:mapid="7cf" />
            </td>
        </tr>
        
    </table>
        <asp:UpdatePanel runat="server">
         
        </asp:UpdatePanel>
    
    </asp:Content>
<%-- Add content controls here --%>
