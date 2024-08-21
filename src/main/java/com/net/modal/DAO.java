package com.net.modal;

import java.io.InputStream;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class DAO {
	private Connection c;
	public DAO() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		c=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitmart","root","happylife@17");
	}
	public void closeConnection() throws SQLException{
		c.close();
	}
	public String adminLogin(String id, String pass) throws SQLException{
		String que="select * from admin_login where id=? and pass=?";
		PreparedStatement p=c.prepareStatement(que);

		p.setString(1, id);
		p.setString(2, pass);
		ResultSet rs=p.executeQuery();
		
		
		if(rs.next()) {
			return rs.getString("name");
		}else {
		return null;
		}
	}
	public void addEnquiry(String name, String phone, String msg) throws SQLException{
		String que="insert into enquiries (name, phone,e_date,status, msg) values(?,?,CURRENT_DATE,'Pending',?)";
		PreparedStatement p=c.prepareStatement(que);

		p.setString(1, name);
		p.setString(2, phone);
		p.setString(3, msg);
		p.executeUpdate();
		
	}
	
	public ArrayList<HashMap<String, Object>> getAllEnquiries() throws SQLException{
		String que="select * from enquiries order by id DESC";
		PreparedStatement p=c.prepareStatement(que);

		ResultSet rs=p.executeQuery();
		
		ArrayList<HashMap<String, Object>> enquiries=new ArrayList<HashMap<String, Object>>();
		while(rs.next()) {
			HashMap<String, Object> enquiry=new HashMap<String, Object>();
			enquiry.put("id", rs.getInt("id"));
			enquiry.put("name", rs.getString("name"));
			enquiry.put("phone", rs.getString("phone"));
			enquiry.put("e_date", rs.getString("e_date"));
			enquiry.put("status", rs.getString("status"));
			enquiry.put("msg", rs.getString("msg"));
			enquiries.add(enquiry);
		}
		return enquiries;
	}
	public void changeEnquiryStatus(int id) throws SQLException{
		String que="update enquiries set status=? where id=?";
		PreparedStatement p=c.prepareStatement(que);
		p.setString(1, "done");
		p.setInt(2, id);
		p.executeUpdate();
	}

	public String addCategory(String name) throws SQLException{
		String que="insert into category values(?)";
		PreparedStatement p=c.prepareStatement(que);

		p.setString(1, name);
		
		
		try {
			p.executeUpdate();
			return "Success";
		} catch (Exception e) {
			return "Already Exist";
		}
		
	}
	public ArrayList getAllCategory() throws SQLException{
		String que="select * from category ";
		PreparedStatement p=c.prepareStatement(que);

		ResultSet rs=p.executeQuery();
		
		ArrayList<String> category=new ArrayList<String>();
		while(rs.next()) {
			
			category.add(rs.getString(1));
		}
		return category;
	}
	public void deleteCategory(String name) throws SQLException{
		String que="delete from category where name=?";
		PreparedStatement p=c.prepareStatement(que);
		p.setString(1, name);
		p.executeUpdate();
	}

	public String addProduct(HashMap<String, Object> product) throws SQLException{
		String sql="insert into products (name, price,cname,category, info, qty, image) values(?,?,?,?,?,?,?)";
		PreparedStatement p=c.prepareStatement(sql);
		p.setString(1, (String)product.get("name"));
		p.setInt(2, (int)product.get("price"));
		p.setString(3, (String)product.get("cname"));
		p.setString(4, (String)product.get("category"));
		p.setString(5, (String)product.get("info"));
		p.setInt(6, (int)product.get("qty"));
		p.setBinaryStream(7, (InputStream)product.get("image"));
		
		try {
			p.executeUpdate();
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed (Already Exist!)";
			
		}
	}
	public ArrayList<HashMap<String, Object>> getAllProducts() throws SQLException{
		String que="select * from  products order by category ";
		PreparedStatement p=c.prepareStatement(que);

		ResultSet rs=p.executeQuery();
		
		ArrayList<HashMap<String, Object>> products=new ArrayList<HashMap<String, Object>>();
		while(rs.next()) {
			HashMap<String, Object> product=new HashMap<String, Object>();
			product.put("price", rs.getInt("price"));
			product.put("qty", rs.getInt("qty"));
			product.put("name", rs.getString("name"));
			product.put("category", rs.getString("category"));
			product.put("cname", rs.getString("cname"));
			product.put("info", rs.getString("info"));
			products.add(product);
		}
		return products;
	}
	public byte[] getProductImage(String name) throws SQLException{
		String que="select image from products where name=? ";
		
		PreparedStatement p=c.prepareStatement(que);
		p.setString(1, name.trim());
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getBytes("image");
		}else {
			return null;
		}
	}
	public void deleteProduct(String name) throws SQLException{
		String que="delete from products where name=?";
		PreparedStatement p=c.prepareStatement(que);
		p.setString(1, name);
		p.executeUpdate();
	}
	
	public void updateProduct(String name, int qty, int price) throws SQLException{
		String que1="UPDATE products SET qty = ?, price=? WHERE name = ?";
		
		PreparedStatement p=c.prepareStatement(que1);
		p.setInt(1, qty);
		p.setInt(2, price);
		p.setString(3, name);
		p.executeUpdate();
	}

	public String userLogin(String email, String pass) throws SQLException{
		String que="select * from user where pass=? and email=?";
		PreparedStatement p=c.prepareStatement(que);

		p.setString(1, pass);
		p.setString(2, email);
		ResultSet rs=p.executeQuery();
		
		
		if(rs.next()) {
			return rs.getString("Name");
		}else {
		return null;
		}
	}
	public String userSignUp(String name, String phone, String email, String pass, String address) throws SQLException{
		String que="insert into user(Name,pass,email,Phone,Address) values(?,?,?,?,?)";
		PreparedStatement p=c.prepareStatement(que);

		p.setString(1, name);
		p.setString(2, pass);
		p.setString(3, email);
		p.setString(4, phone);
		p.setString(5, address);
		
		try {
			p.executeUpdate();
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "Already Exist";
		}
		
	}
	public ArrayList<HashMap<String, Object>> getProductsLikeName(String name) throws SQLException{
		
		String que="select * from  products where name like ? and qty>0 order by category DESC ";
		PreparedStatement p=c.prepareStatement(que);
		p.setString(1, "%"+name+"%");
		try {
			ResultSet rs=p.executeQuery();
			ArrayList<HashMap<String, Object>> products=new ArrayList<HashMap<String, Object>>();
			while(rs.next()) {
				HashMap<String, Object> product=new HashMap<String, Object>();
				product.put("price", rs.getInt("price"));
				product.put("qty", rs.getInt("qty"));
				product.put("name", rs.getString("name"));
				product.put("category", rs.getString("category"));
				product.put("cname", rs.getString("cname"));
				product.put("info", rs.getString("info"));
				products.add(product);
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void addToCart(String email,String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String i=rs.getString("items");
			p=c.prepareStatement("update cart set items=? where email=?");
			p.setString(1, i+","+name);
			p.setString(2, email);
			p.executeUpdate();
		}else {
			p=c.prepareStatement("insert into cart (email,items) values (?,?)");
			p.setString(1, email);
			p.setString(2, name);
			p.executeUpdate();
		}
	}
	public int countCart(String email) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String items=rs.getString("items");
			String i[]=items.split(",");
			return i.length;
		}else {
			return 0;
		}
	}
	
	public String[] getAllCartItemsByEmail(String email) {
		try {
			PreparedStatement p=c.prepareStatement("select * from cart where email=?");
			p.setString(1, email);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				String all_items=rs.getString("items");
				String i[] =all_items.split(",");
				return i;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
	}
	
	public int getItemPrice(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select price from products where name=?");
		p.setString(1, name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getInt("price");
		}else {
			return 0;
		}
	}
	public void removeFromCart(String email, String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String items=rs.getString("items");
			String i[] =items.split(",");
			ArrayList<String> newItems=new ArrayList<String>();
			for(int x=0;x<i.length;x++) {
				newItems.add(i[x]);
			}
			newItems.remove(name);
			items="";
			for(String string:newItems) {
				items+="," +string;
			}
			items=items.substring(1,items.length());
			p=c.prepareStatement("update cart set items=? where email=?");
			p.setString(1, items);
			p.setString(2, email);
			p.executeUpdate();
		}
	}
		
		public ArrayList<String> getProductByCategory(String category){
			try {
				PreparedStatement p=c.prepareStatement("select * from products where category=? and qty>0");
				p.setString(1, category);
				ResultSet rs=p.executeQuery();
				ArrayList<String> categories=new ArrayList<String>();
				while(rs.next()) {
					categories.add(rs.getString("name"));
				}
				return categories;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		public ArrayList<String> getAddressByEmail(String email){
			try {
				PreparedStatement p=c.prepareStatement("select * from addresses where email=? ");
				p.setString(1, email);
				ResultSet rs=p.executeQuery();
				ArrayList<String> addresses=new ArrayList<String>();
				while(rs.next()) {
					addresses.add(rs.getString("address"));
				}
				return addresses;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		public void addAddress(String email, String address) throws SQLException{
			String que="insert into addresses(email, address) values(?,?)";
			PreparedStatement p=c.prepareStatement(que);

			p.setString(1, email);
			p.setString(2, address);
			
			
			try {
				p.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		public void orderPlaced(String email, String address) throws SQLException{
			String[] items=getAllCartItemsByEmail(email);
			String orderItems="";
			int total=0;
			for(String item:items) {
				int price =getItemPrice(item);
				total+=price;
				orderItems+=","+item+"-"+price;
			}
			orderItems =orderItems.substring(1,orderItems.length());
			PreparedStatement p=c.prepareStatement("insert into orders(email,address,total,items,order_date,status) values(?,?,?,?,CURRENT_DATE,'PENDING')");
			p.setString(1, email);
			p.setString(2, address);
			p.setInt(3, total);
			p.setString(4, orderItems);
			p.executeUpdate();
			p=c.prepareStatement("delete from cart where email=?");
			p.setString(1, email);
			p.executeUpdate();
			
			p=c.prepareStatement("update products set qty=qty-1 where name=?");
			for(String item:items){
				p.setString(1, item);
				p.executeUpdate();
			}
		}
		
		public ArrayList<HashMap> getOrdersByEmail(String email) throws SQLException{
			PreparedStatement p=c.prepareStatement("select * from orders where email=? order by order_date DESC");
			p.setString(1, email);
			ResultSet rs=p.executeQuery();
			ArrayList<HashMap> orders=new ArrayList<>();
			while(rs.next()) {
				HashMap order=new HashMap();
				order.put("id", rs.getInt("id"));
				order.put("address", rs.getString("address"));
				order.put("items", rs.getString("items"));
				order.put("total", rs.getInt("total"));
				order.put("status", rs.getString("status"));
				order.put("order_date", rs.getString("order_date"));
				orders.add(order);
			}
			return orders;
		}
		
		public void changeOrderStatus(int id,String status) throws SQLException{
			PreparedStatement p=c.prepareStatement("update  orders set status=? where id=?");
			p.setString(1, status);
			p.setInt(2, id);
			p.executeUpdate();
			
			if(status.equalsIgnoreCase("Canceled") || status.equalsIgnoreCase("Rejected")) {
				p=c.prepareStatement("select items from orders where id=?");
				p.setInt(1, id);
				ResultSet rs=p.executeQuery();
				if(rs.next()) {
					String items=rs.getString("items");
					String i[]=items.split(",");
					for(String s:i) {
						String a[]=s.split("-");
						p=c.prepareStatement("update products set qty=qty+1 where name=?");
						p.setString(1, a[0]);
						p.executeUpdate();
					}
				}
			
			}
		}
		
		public ArrayList<HashMap> getOrders() throws SQLException{
			PreparedStatement p=c.prepareStatement("select * from orders order by order_date DESC");
			ResultSet rs=p.executeQuery();
			ArrayList<HashMap> orders=new ArrayList<>();
			while(rs.next()) {
				HashMap order=new HashMap();
				order.put("id", rs.getInt("id"));
				order.put("email", rs.getString("email"));
				order.put("address", rs.getString("address"));
				order.put("items", rs.getString("items"));
				order.put("total", rs.getInt("total"));
				order.put("status", rs.getString("status"));
				order.put("order_date", rs.getString("order_date"));
				orders.add(order);
			}
			return orders;
		}
}
