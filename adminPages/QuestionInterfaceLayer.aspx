<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="QuestionInterfaceLayer.aspx.cs" Inherits="Question" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <div>

                <br />
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:Button ID="btn_newQuestion" runat="server" Text="Insert New Question" Width="173px" OnClick="btn_newQuestion_Click" UseSubmitBehavior="False" />
                   
                    </asp:View>
                    <asp:View ID="View2" runat="server">

                        <div id="div_ques" runat="server">

                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Description"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_desc" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_desc" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_desc" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="c">*</asp:RequiredFieldValidator>
                                        <asp:Label ID="lb_msg" runat="server" Text="Question insert Sucessfully" Visible="False"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style6">
                                        <asp:Label ID="Label11" runat="server" Text="Type"></asp:Label>
                                    </td>
                                    <td class="auto-style6">
                                        <asp:DropDownList ID="DDL_Type" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_Type_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select Type</asp:ListItem>
                                            <asp:ListItem Value="2">True/False</asp:ListItem>
                                            <asp:ListItem Value="1">Choice</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDL_Type" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DDL_Type" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="c">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style6"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="Course"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDL_Crs" runat="server" DataSourceID="SqlDataSvource1" DataTextField="Crs_Name" DataValueField="Crs_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSvource1" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [Crs_Id], [Crs_Name] FROM [Course]"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDL_Crs" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DDL_Crs" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="c">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </div>

                        <div id="div_true" runat="server" visible="false">

                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Label ID="Label12" runat="server" Text="Model Answer"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:RadioButtonList ID="trueFalseRadio" runat="server" RepeatDirection="Horizontal" Style="direction: ltr" Width="414px">
                                            <asp:ListItem Value="A">True</asp:ListItem>
                                            <asp:ListItem Value="F">False</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="trueFalseRadio" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="c">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style1"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">&nbsp;</td>
                                    <td class="auto-style1">
                                        <asp:Button ID="btn_saveTF" runat="server" Text="Save" OnClick="btn_saveTF_Click" ValidationGroup="c" />
                                        <asp:Button ID="btn_canTF" runat="server" Text="Cancel" OnClick="btn_canTF_Click" />
                                    </td>
                                    <td class="auto-style1">&nbsp;</td>
                                </tr>
                            </table>

                        </div>

                        <div id="div_choice" runat="server" visible="false">

                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label13" runat="server" Text="Choice A"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_a" runat="server" Style="margin-left: 0px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_a" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label14" runat="server" Text="Choice B"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_b" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_b" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label15" runat="server" Text="Choice C"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_c" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_c" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label16" runat="server" Text="Choice D"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_d" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_d" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label17" runat="server" Text="Model Answer"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDl_Ans" runat="server">
                                            <asp:ListItem>A</asp:ListItem>
                                            <asp:ListItem>B</asp:ListItem>
                                            <asp:ListItem>C</asp:ListItem>
                                            <asp:ListItem>D</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DDl_Ans" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="t">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btn_saveCH" runat="server" Text="Save" OnClick="btn_saveCH_Click" ValidationGroup="t" />
                                        <asp:Button ID="btn_canCH" runat="server" Text="Cancel" OnClick="btn_canCH_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </div>


                    </asp:View>
                </asp:MultiView>
                <br />


                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btn_edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="delete" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="btn_delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>' Visible="<%# false %>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                            <EditItemTemplate>
                                <asp:Label ID="lb_d" runat="server" Text='<%# bind("ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lb_id" runat="server" Text='<%# bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_desc" runat="server" Text='<%# Bind("Describtion") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Describtion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choice A">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_A" runat="server" Enabled='<%# (Eval("Type").ToString())=="1"?true:false %>' Text='<%# Bind("A") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("A") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choice B">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_B" runat="server" Enabled='<%# (Eval("Type").ToString())=="1"?true:false %>' Text='<%# Bind("B") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("B") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choice C">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_C" runat="server" Text='<%# Bind("C") %>' Visible='<%# (Eval("Type").ToString())=="1"?true:false %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("C") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Choice D">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_D" runat="server" Text='<%# Bind("D") %>' Visible='<%# (Eval("Type").ToString())=="1"?true:false %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("D") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_type" runat="server" Enabled="<%# false %>" Text='<%# (Eval("Type").ToString())=="2"?"T/F":"Choice" %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# (Eval("Type").ToString())=="2"?"T/F":"Choice" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Answer">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDL_Choice" runat="server" SelectedValue='<%# (Eval("Type").ToString())=="1"?Eval("Answer"):"z" %>' Visible='<%# (Eval("Type").ToString())=="1"?true:false %>' CssClass="small_inpt">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem Enabled="False">z</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="DDL_TF" runat="server" SelectedValue='<%# (Eval("Type").ToString())=="2"?Eval("Answer"):"z" %>' Visible='<%# (Eval("Type").ToString())=="2"?true:false %>' CssClass="small_inpt">
                                    <asp:ListItem Value="A">True</asp:ListItem>
                                    <asp:ListItem Value="B">False</asp:ListItem>
                                    <asp:ListItem Enabled="False">z</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Answer") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDL_Crs" runat="server" DataSourceID="SqlDataSdource1" DataTextField="Crs_Name" DataValueField="Crs_Id" SelectedValue='<%# Bind("Crs_Id") %>' CssClass="small_inpt">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSdource1" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [Crs_Id], [Crs_Name] FROM [Course]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Crs_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        Sorry,No Question found
                    </EmptyDataTemplate>
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



            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
