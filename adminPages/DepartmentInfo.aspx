<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="DepartmentInfo.aspx.cs" Inherits="DepartmentInfo" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>

    <table class="tableContorls">
        <tr>
            <td style="width: 219px">
                <asp:Label ID="Label1" runat="server" Text="choose department to display"></asp:Label>
                
            </td>
            <td style="width: 190px"><asp:DropDownList ID="dept_ddl" runat="server" AppendDataBoundItems="True" DataSourceID="departmentSource" DataTextField="Dept_Name" DataValueField="Dept_Id">
                <asp:ListItem Value="0">All</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="departmentSource" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [Dept_Id], [Dept_Name] FROM [Department]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="deptShow_btn" runat="server" Text="Show" OnClick="deptShow_btn_Click" CssClass="two1" Width="150px" />
            </td>
        </tr>
    </table>
     <asp:GridView ID="DeptInfo_grd" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Dept_Id" ForeColor="#333333" GridLines="None" Width="918px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="id">
                        <EditItemTemplate>
                            <asp:Label ID="Dept_Id_edit" runat="server" Text='<%# Bind("Dept_Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Id" runat="server" Text='<%# Bind("Dept_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="Dept_Name_edit" runat="server" Text='<%# Bind("Dept_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Name" runat="server" Text='<%# Bind("Dept_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="description">
                        <EditItemTemplate>
                            <asp:TextBox ID="Dept_Desc_edit" runat="server" Text='<%# Bind("Dept_Desc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Desc" runat="server" Text='<%# Bind("Dept_Desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <EditItemTemplate>
                            <asp:TextBox ID="Dept_Location_edit" runat="server" Text='<%# Bind("Dept_Location") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Location" runat="server" Text='<%# Bind("Dept_Location") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manager">
                        <ItemTemplate>
                            <asp:Label ID="Dept_Manager" runat="server" Text='<%# Bind("Dept_Manager") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
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
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content> 
