<% @ Page Language="C#" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">

 public void Page_Load(Object src,EventArgs e)
  {

    Master_Valicate YZ=new Master_Valicate();
    YZ.Master_Check();
    Conn conn=new Conn();
    ViewState["constr"]=conn.Constr();
    if(!Page.IsPostBack)
      {
       Get_Content();
      } 
  }

public void  Get_Content()
 {

   string  TheTable=Request.QueryString["table"];
   string  TheField=Request.QueryString["field"];
   string  TheId=Request.QueryString["id"];
   int Id;
   if(IsNum(TheId))
    {
     Id=int.Parse(TheId);
    }
   else
    {
      Id=0;
      Response.Write("<script>alert('无效的ID')</"+"script>");
      Response.End();
    }
   string  sql="select  * from "+TheTable+" where id="+Id;
   OleDbConnection conn=new OleDbConnection((string)ViewState["constr"]);
   conn.Open();
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read())
    {
      Lb_Id.Text=dr["id"].ToString();
      Content.Text=dr[TheField].ToString();
    }
   conn.Close();

 }

public void Content_Update(Object src,EventArgs e)
 {
   string  TheTable=Request.QueryString["table"];
   string  TheField=Request.QueryString["field"];
   string  TheId=Request.QueryString["id"];
   string  TheContent=Content.Text;
   string  Therefresh=Request.QueryString["refresh"];
   int Id;
   if(IsNum(TheId))
    {
     Id=int.Parse(TheId);
    }
   else
    {
      Id=0;
      Response.Write("<script>alert('无效的ID')</"+"script>");
      Response.End();
    }


   string sql="select * from  "+TheTable+" where id="+Id;
   OleDbConnection conn=new OleDbConnection((string)ViewState["constr"]);
   conn.Open();
   DataSet ds=new DataSet();
   OleDbDataAdapter myAdapter=new OleDbDataAdapter(sql,conn);
   OleDbCommandBuilder mycb=new  OleDbCommandBuilder(myAdapter);
   myAdapter.Fill(ds,"table1");
   DataRow dr;
   if(TheId=="0")
    {
     dr=ds.Tables["table1"].NewRow();
    }
   else
    {
     dr=ds.Tables["table1"].Rows[0];
    }
   dr[TheField]=TheContent;
   if(TheId=="0")
    {
     dr["planguage"]=System.Web.HttpContext.Current.Request.Cookies["master"].Values["Language"].ToString();
     ds.Tables["table1"].Rows.Add(dr);
    }
   myAdapter.Update(ds,"table1");
   conn.Close();
   Response.Write("<script>alert('提交成功')</"+"script>");
   if(Therefresh=="1")
    {
     Response.Write("<script>opener.location.href=opener.location.href</"+"script>");
    }

 }


public bool IsNum(string str)
 {
  if(str=="" || str==null)
   {
    return false;
   }
  string str1="0123456789";
  string str2=str.ToLower();
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }

</script>
<html>
<head>
<title>在线编辑器-PageAdmin网站管理系统</title>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<link rel="stylesheet" href="master.css" type="text/css">
</head>  
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>可视化编辑</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top>

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><asp:Label id="lbl" runat="server" /></td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<tr>
  <td><asp:TextBox  id="Content"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Basic" runat="server"/>
  </td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
<td height=25 align=center >
<asp:Button  Cssclass=button   text="提交"   runat="server" onclick="Content_Update"/>
<input type="button" class=button  value="关闭"  onclick="window.close()">
</td>
 </tr>
</table>
<asp:Label id="LblErr" runat="server" />
<asp:Label  id="Lb_Id"    runat="server" visible="false"/>
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



