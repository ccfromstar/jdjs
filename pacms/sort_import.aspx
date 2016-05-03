<% @ Page language="c#"%>
<% @ Import  NameSpace="PageAdmin"%>
<% @ Import  NameSpace="System.Data"%>
<% @ Import  NameSpace="System.Data.OleDb"%>
<script language="C#" Runat="server">
OleDbConnection conn;
string Planguage,sql;
int NewSort1id,NewSort2id; 
public void Page_Load(Object Src,EventArgs e)
 {
    Conn myconn=new Conn();
    string constr=myconn.Constr();//获取连接字符串
    conn=new OleDbConnection(constr);
 }

public void ZH(Object Src,EventArgs e)
 {
    conn.Open();
    sql="select * from sort where thetable='product' or thetable='information'";
    OleDbCommand comm=new OleDbCommand(sql,conn);
    OleDbDataReader dr=comm.ExecuteReader();
    if(dr.Read())
     {

       BT.Text="已经转换完毕";
       BT.Enabled=false;
       return;
     }

    //产品大类
    sql="select * from prod1 order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    string SortName,Allow_Memtype,sql1,Sort1,Sort2;
    int Xuhao,Parent_Id,Sort_Level,Sort1Id,Sort2Id;
    OleDbCommand comm1;
    OleDbDataReader dr1;
    while(dr.Read())
     {
       Planguage=dr["planguage"].ToString();
       SortName=dr["prod1"].ToString();
       Xuhao=int.Parse(dr["xuhao"].ToString());
       Allow_Memtype=dr["allow_memtype"].ToString();
       Parent_Id=0;
       Sort_Level=1;
       sql1="insert into sort(planguage,fid,thetable,parent_id,sort_level,sort_name,allow_memtype,xuhao) values('"+Planguage+"',0,'product',"+Parent_Id+","+Sort_Level+",'"+SortName+"','"+Allow_Memtype+"',"+Xuhao+")";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

       Sort1Id=Get_Id("sort",SortName,1);
       sql1="update product set sort1id="+Sort1Id+" where sort1='"+SortName+"'";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

     }
  
    //产品小类
    sql="select * from prod2 order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    while(dr.Read())
     {
       SortName=dr["prod2"].ToString();
       Xuhao=int.Parse(dr["xuhao"].ToString());
       Allow_Memtype=dr["allow_memtype"].ToString();
       Sort_Level=2;
       Sort1=dr["prod1"].ToString();
       Parent_Id=Get_Id("sort",Sort1,1);

       sql1="insert into sort(planguage,fid,thetable,parent_id,sort_level,sort_name,allow_memtype,xuhao) values('"+Planguage+"',0,'product',"+Parent_Id+","+Sort_Level+",'"+SortName+"','"+Allow_Memtype+"',"+Xuhao+")";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

       Sort2Id=Get_Id("sort",SortName,2);
       sql1="update product set sort2id="+Sort2Id+" where sort2='"+SortName+"'";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

     }


    //文章大类
    sql="select * from infor1 order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    while(dr.Read())
     {
       Planguage=dr["planguage"].ToString();
       SortName=dr["infor1"].ToString();
       Xuhao=int.Parse(dr["xuhao"].ToString());
       Allow_Memtype=dr["allow_memtype"].ToString();
       Parent_Id=0;
       Sort_Level=1;
       sql1="insert into sort(planguage,fid,thetable,parent_id,sort_level,sort_name,allow_memtype,xuhao) values('"+Planguage+"',0,'information',"+Parent_Id+","+Sort_Level+",'"+SortName+"','"+Allow_Memtype+"',"+Xuhao+")";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

       Sort1Id=Get_Id("sort",SortName,1);
       sql1="update information set sort1id="+Sort1Id+" where sort1='"+SortName+"'";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

     }
  
    //文章小类
    sql="select * from infor2 order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    while(dr.Read())
     {
       SortName=dr["infor2"].ToString();
       Xuhao=int.Parse(dr["xuhao"].ToString());
       Allow_Memtype=dr["allow_memtype"].ToString();
       Sort_Level=2;
       Sort1=dr["infor1"].ToString();
       Parent_Id=Get_Id("sort",Sort1,1);

       sql1="insert into sort(planguage,fid,thetable,parent_id,sort_level,sort_name,allow_memtype,xuhao) values('"+Planguage+"',0,'information',"+Parent_Id+","+Sort_Level+",'"+SortName+"','"+Allow_Memtype+"',"+Xuhao+")";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

       Sort2Id=Get_Id("sort",SortName,2);
       sql1="update information set sort2id="+Sort2Id+" where sort2='"+SortName+"'";
       comm1=new OleDbCommand(sql1,conn);
       comm1.ExecuteNonQuery();

     }

    //转换调用 lanmu2 
    sql="select * from lanmu2 where  thetype='product' or thetype='article'  order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    int Id;  
    OleDbCommand CommUpdate;
    while(dr.Read())
     {
        if(dr["thetype"].ToString()=="product")
         {
          get_NewProductId(int.Parse(dr["sort1id"].ToString()),int.Parse(dr["sort2id"].ToString()));
         }
        else
         {
          get_NewArticleId(int.Parse(dr["sort1id"].ToString()),int.Parse(dr["sort2id"].ToString()));
         }
        Id=int.Parse(dr["id"].ToString());
        sql="update lanmu2 set sort1id="+NewSort1id+",sort2id="+NewSort2id+" where id="+Id;
        CommUpdate=new OleDbCommand(sql,conn);
        CommUpdate.ExecuteNonQuery();
     }

    //转换调用 lanmu3 
    sql="select * from lanmu3 where  thetype='product' or thetype='article'  order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    while(dr.Read())
     {
        if(dr["thetype"].ToString()=="product")
         {
          get_NewProductId(int.Parse(dr["sort1id"].ToString()),int.Parse(dr["sort2id"].ToString()));
         }
        else
         {
          get_NewArticleId(int.Parse(dr["sort1id"].ToString()),int.Parse(dr["sort2id"].ToString()));
         }
        Id=int.Parse(dr["id"].ToString());
        sql="update lanmu3 set sort1id="+NewSort1id+",sort2id="+NewSort2id+" where id="+Id;
        CommUpdate=new OleDbCommand(sql,conn);
        CommUpdate.ExecuteNonQuery();
     }

    //转换调用template
    sql="select * from template where  thetype='product' or thetype='article'  order by xuhao,id";
    comm=new OleDbCommand(sql,conn);
    dr=comm.ExecuteReader();
    while(dr.Read())
     {
        if(dr["thetype"].ToString()=="product")
         {
          get_NewProductId(int.Parse(dr["sort1id"].ToString()),int.Parse(dr["sort2id"].ToString()));
         }
        else
         {
          get_NewArticleId(int.Parse(dr["sort1id"].ToString()),int.Parse(dr["sort2id"].ToString()));
         }
        Id=int.Parse(dr["id"].ToString());
        sql="update template set sort1id="+NewSort1id+",sort2id="+NewSort2id+" where id="+Id;
        CommUpdate=new OleDbCommand(sql,conn);
        CommUpdate.ExecuteNonQuery();
     }

   conn.Close();

   conn.Open();

       sql="delete  from sort where sort_level=2 and parent_id=0";
       comm=new OleDbCommand(sql,conn);
       comm.ExecuteNonQuery();

       sql="delete  from sort where sort_level=1 and parent_id<>0";
       comm=new OleDbCommand(sql,conn);
       comm.ExecuteNonQuery();

       sql="drop table prod1";
       comm=new OleDbCommand(sql,conn);
       comm.ExecuteNonQuery();

       sql="drop table prod2";
       comm=new OleDbCommand(sql,conn);
       comm.ExecuteNonQuery();

       sql="drop table infor1";
       comm=new OleDbCommand(sql,conn);
       comm.ExecuteNonQuery();

       sql="drop table infor2";
       comm=new OleDbCommand(sql,conn);
       comm.ExecuteNonQuery();

   conn.Close();
   BT.Text="转换完毕";
   BT.Enabled=false;
 }

public void get_NewProductId(int sort1id,int sort2id)
 {
   NewSort1id=0;
   NewSort2id=0;
   string sql,sort1="",sort2="";
   OleDbCommand comm;
   OleDbDataReader dr;
   if(sort2id!=0)
    {
     sql="select * from prod2 where id="+sort2id;
     comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read())
      {
       sort1=dr["prod1"].ToString();
       sort2=dr["prod2"].ToString();
      }
    }
   else
    {
     sql="select * from prod1 where id="+sort1id;
     comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read())
      {
       sort1=dr["prod1"].ToString();
      }
    }
 
    if(sort2!="")
     {
      sql="select * from sort where sort_name='"+sort2+"' and sort_level=2 and thetable='product'";
      comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read())
      {
        NewSort1id=int.Parse(dr["parent_id"].ToString());
        NewSort2id=int.Parse(dr["id"].ToString());
      }
     }
    else
     {
      sql="select * from sort where sort_name='"+sort1+"' and sort_level=1 and thetable='product'";
      comm=new OleDbCommand(sql,conn);
       dr=comm.ExecuteReader();
      if(dr.Read())
      {
       comm=new OleDbCommand(sql,conn);
       NewSort1id=int.Parse(dr["id"].ToString());
      }
     }

 }

public void get_NewArticleId(int sort1id,int sort2id)
 {
   NewSort1id=0;
   NewSort2id=0;
   string sql,sort1="",sort2="";
   OleDbCommand comm;
   OleDbDataReader dr;
   if(sort2id!=0)
    {
     sql="select * from infor2 where id="+sort2id;
     comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read())
      {
       sort1=dr["infor1"].ToString();
       sort2=dr["infor2"].ToString();
      }
    }
   else
    {
     sql="select * from infor1 where id="+sort1id;
     comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read())
      {
       sort1=dr["infor1"].ToString();
      }
    }
 
    if(sort2!="")
     {
      sql="select * from sort where sort_name='"+sort2+"' and sort_level=2 and thetable='information'";
      comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read())
      {
      NewSort1id=int.Parse(dr["parent_id"].ToString());
      NewSort2id=int.Parse(dr["id"].ToString());
      }
     }
    else
     {
      sql="select * from sort where sort_name='"+sort1+"' and sort_level=1 and thetable='information'";
      comm=new OleDbCommand(sql,conn);
      dr=comm.ExecuteReader();
      if(dr.Read())
      {
       NewSort1id=int.Parse(dr["id"].ToString());
      }
     }
 }


public int Get_Id(string Table,string Sort1,int Sort_Level)
 {
   string sql="select * from "+Table+" where sort_name='"+Sort1+"' and sort_level="+Sort_Level;
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read())
     {
       Planguage=dr["planguage"].ToString();
       return int.Parse(dr["id"].ToString());
     }
   else
     {
      Planguage="cn";
      return 0;
     }
 }

</script>
<form runat="server">
请务必先在后台运行SQL后再进去此转换操作，转换直接点下面按钮<br>
<asp:button type="button" id="BT" text="开始转换" runat="server" onclick="ZH"/>
</form>

