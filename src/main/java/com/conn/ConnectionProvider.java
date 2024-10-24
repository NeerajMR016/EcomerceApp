package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

		public static Connection getCon()
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/e_commerce";
				Connection con=DriverManager.getConnection(url,"root","admin");
				return con;
			
			}
			catch(Exception e)
			{
				System.out.println(e);
				return null;
			}
		}
}
