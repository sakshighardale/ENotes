package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.post;



public class PostDAO1 {

	private Connection con;
public PostDAO1() {

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

public boolean addNotes(String tit,String cont,int useri) {
	boolean f=false;
	try {
		
		String q="insert into ENotes_post values(noteSeq.nextval,?,?,sysdate,?)";
		PreparedStatement ps=con.prepareStatement(q);
		ps.setString(1, tit);
		ps.setString(2, cont);
		ps.setInt(3, useri);
		int i=ps.executeUpdate();
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

public List<post> getData(int id)
{
	List<post> list=new ArrayList<post>(); 
	post p=null;
	try{
		String q="select * from ENotes_post where userid=? order by id desc";
		PreparedStatement ps=con.prepareStatement(q);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{p=new post();
			p.setId(rs.getInt(1));
			p.setTitle(rs.getString(2));
			p.setContent(rs.getString(3));
			p.setPdate(rs.getTimestamp(4));
			list.add(p);
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return list;
}

public post getDataById(int noteId)
{
	post p=null;
	try {
		String query="select * from ENotes_post where id=?";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, noteId);
		
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			p=new post();
			p.setId(rs.getInt(1));
			p.setTitle(rs.getString(2));
			p.setContent(rs.getString(3));
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return p;
}


public boolean postUpdat(int noteid, String notetitle, String notecontent)
{
	boolean f=false;
	try {
		String query="update ENotes_post set title=?, content=? where id=?";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(3,noteid);
		ps.setString(1,notetitle);
		ps.setString(2,notecontent);
		int i=ps.executeUpdate();
		
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

public boolean deletePost(int noteid)
{
	boolean f=false;
	
	try {
		String q="delete from ENotes_post where id=?";
		PreparedStatement ps=con.prepareStatement(q);
		ps.setInt(1, noteid);
		int i=ps.executeUpdate();
		
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
}
