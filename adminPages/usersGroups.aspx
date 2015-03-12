<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="usersGroups.aspx.cs" Inherits="adminPages_usersGroups" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
           
            <div class="col-md-6">
                <!-- Primary box -->
                <div class="box box-solid box-primary">
                    <div class="box-header">
                        <h3 class="box-title">groups</h3>
                        
                    </div>
                    <div class="box-body table-responsive">

                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" PageIndex="2" PageSize="5">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:TemplateField HeaderText="UserID">
                                    <EditItemTemplate>
                                        <asp:Label ID="lb_userId" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lb_userId_edit" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UserGroup">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DDL_group" runat="server" DataSourceID="SqlDataSource200" DataTextField="name" DataValueField="id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource200" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [name], [id] FROM [groups]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lb_userG_edit" runat="server" Text='<%# Bind("group_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerSettings PageButtonCount="5" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        </asp:GridView>
                        <br />
                     
                          </div>
             
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

