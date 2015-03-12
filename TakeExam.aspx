<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.master" AutoEventWireup="true" CodeFile="TakeExam.aspx.cs" Inherits="TakeExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MV_Exam" runat="server" ActiveViewIndex="0">
                <asp:View ID="V_ShowExam" runat="server">
                    <asp:Button ID="Btn_start" runat="server" Text="Start Exam" Height="31px" OnClick="Btn_start_Click" Width="188px" CssClass="four1" />
                </asp:View>
                <asp:View ID="V_ExamStarted" runat="server">
                    <table>
                        <tr>
                            <td>

                                <asp:Timer ID="Timer_Exam" runat="server" Interval="1000" Enabled="False" OnTick="Timer_Exam_Tick"></asp:Timer>
                                <asp:Label ID="lbl_time" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#990000"></asp:Label>
                                <asp:Button ID="Btn_Submit" runat="server" Height="31px" OnClick="Btn_Submit_Click" Text="Submit" Width="194px" CssClass="four1" />


                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <asp:DataList ID="DataList_Exam" runat="server"  Height="596px" Width="635px" CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderTemplate>
                            Exam
                        </HeaderTemplate>
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_qid" runat="server" Text='<%# Bind("qid") %>' Visible="False" style="margin:0;padding:0;"></asp:Label>
                            <asp:Label ID="lbl_eid" runat="server" Text='<%# Bind("exid") %>' Visible="False" style="margin:0;padding:0;"></asp:Label>
                            <br />
                            Q<asp:Label ID="Label6" runat="server" Text='<%# Bind("seq") %>' style="margin:0;padding:0;"></asp:Label>
                            :
                    <asp:Label ID="lbl_desc" runat="server" Text='<%# Bind("Describtion") %>' Font-Bold="True" ForeColor="#990000" style="margin:0;padding:0;" />
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="A:" style="margin:0;padding:0;"></asp:Label>
                            <asp:RadioButton ID="rbtn_A" runat="server" GroupName="Choices" Text='<%# Bind("A") %>' style="margin:0;padding:0;"/>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="B:" style="margin:0;padding:0;"></asp:Label>
                            <asp:RadioButton ID="rbtn_B" runat="server" GroupName="Choices" Text='<%# Bind("B") %>' style="margin:0;padding:0;" />
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="C:" Visible='<%# (Eval("C").ToString())==""?  false : true %>' style="margin:0;padding:0;"></asp:Label>
                            <asp:RadioButton ID="rbtn_C" runat="server" GroupName="Choices" Text='<%# Bind("C") %>' Visible='<%# (Eval("C").ToString())==""?  false : true %>' style="margin:0;padding:0;" />
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="D:" Visible='<%# (Eval("D").ToString())==""?  false : true %>' style="margin:0;padding:0;"></asp:Label>
                            <asp:RadioButton ID="rbtn_D"  runat="server" GroupName="Choices" Text='<%# Bind("D") %>' Visible='<%# (Eval("D").ToString())==""?  false : true %>' style="margin:0;padding:0;" />
                            <br />
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                  
                </asp:View>
                <asp:View ID="V_ExamEnded" runat="server">
                    <asp:Label ID="lbl_ExamResult" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="lbl_ExamStatus" runat="server"></asp:Label>
                </asp:View>
            </asp:MultiView>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


