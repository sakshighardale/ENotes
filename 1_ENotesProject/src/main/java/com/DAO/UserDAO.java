package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class UserDAO {
	private Connection con;

	public UserDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sakshi22");
			
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("error");
	}
	}
	
	public boolean addUser(UserDetails user) {
		boolean f=false;
		
		try {
			String query="insert into ENotesUser values(seqEnote.nextval,?,?,?)";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, user.getName());
			st.setString(2,user.getEmail());
			st.setString(3,user.getPassword());
			int i=st.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public UserDetails loginUser(UserDetails user)
	{
	
		UserDetails user1=null;
		try {
			String query="select * from ENotesUser where email=? and password=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1,user.getEmail());
			pst.setString(2, user.getPassword());
			
			ResultSet rs=pst.executeQuery();
			
			if(rs.next())
			{
				user1=new UserDetails();
				user1.setId(rs.getInt("id"));
				user1.setName(rs.getString("FullName"));
				user1.setEmail(rs.getString("email"));
				user1.setPassword(rs.getString("password"));
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user1;
	}
}
