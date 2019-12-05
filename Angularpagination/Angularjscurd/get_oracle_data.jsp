  <%@ page import = "java.sql.*" %> 
  <%    
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.109:1521:orcl",  
    "hrd","hrd"); 
    String sql=request.getParameter("sqlStr");
 
    try
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        ResultSetMetaData rsMetaData = rs.getMetaData();
        int numberOfColumns = rsMetaData.getColumnCount();
        
        out.print("[");
        rs.next();
        while(true)
        	out.print("{");
				      
            for(int i=1;i<=numberOfColumns;i++)
            	{
                out.print("\"" + rsMetaData.getColumnName(i) + "\":\""  + 
                rs.getString(rsMetaData.getColumnName(i)) + "\""); 
                if(i<numberOfColumns)
		        	out.print(",");
                }
            out.print("}");
            if(rs.next())
                out.print(",\n");
            else
                {
                out.print("]");
                break;
                }
        }
	stmt.close();
        rs.close();
        stmt=null;
        rs=null;
   
    }
    catch(SQLException e)
    {
        out.println("SQL Error encountered "+e.getMessage());
    }
    conn.close();
    conn=null;   
    %>
