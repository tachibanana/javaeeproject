package com.wear.kapampangan.project.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wear.kapampangan.project.library.Color;
import com.wear.kapampangan.project.library.InventoryProduct;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.Size;
import com.wear.kapampangan.project.library.User;

public class DBManager{
	
	private ServerConnection server = null;
	private Connection conn = null;
	
//	private String productCode;
//	private String productName;
//	private double price;
//	private String image;
//	private String description;
//	private String status;
	
	//hindi kasama tong nsa baba
//	private List<Color> colorList;
//	private List<Size> sizeList;
	
//	List<Item> itemList;
	
	public DBManager(ServerConnection server){
		this.server = server;
	}
	
	public void openConnection(){
		conn = server.getConnection();
	}
	
	
	
	
	//GET INVETORY PRODUCT
	public List<InventoryProduct> getInventoryProduct(){
		List<InventoryProduct> inventoryProductList = new ArrayList<InventoryProduct>();
		
		try{
			for(Item item : getItemList()){
				List<Color> tempColorList = new ArrayList<Color>();
				List<Size> tempSizeList = new ArrayList<Size>();
				
				//Color list
				try{
					String sql = "SELECT DISTINCT color_id FROM tblcolor_list WHERE item_id = ?";
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setString(1 , item.getProductCode());
					ResultSet rs = pst.executeQuery();
					
					while(rs.next()){
						for(Color color : getColorList()){
							if(color.getId() == rs.getInt("color_id")){
								tempColorList.add(color);
								break;
							}
						}
						
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				
				//Size list
				try{
					String sql = "SELECT DISTINCT size_id FROM tblsize_list WHERE item_id = ?";
					PreparedStatement pst = conn.prepareStatement(sql);
					pst.setString(1, item.getProductCode());
					ResultSet rs = pst.executeQuery();
					
					while(rs.next()){
						for(Size size : getSizeList()){
							if(size.getId() == rs.getInt("size_id")){
								tempSizeList.add(size);
								break;
							}
						}
					}
				}catch(Exception e){
					
				}
				inventoryProductList.add(new InventoryProduct(item.getProductCode() , item , tempColorList , tempSizeList , 5));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return inventoryProductList;
	}
	
	//GET LIST OF ITEM
	public List<Item> getItemList(){
		List<Item> itemList = new ArrayList<Item>();
		String sql = "SELECT * FROM tblitem";
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				Item item = new Item(
						rs.getString("item_id"),
						rs.getString("name"),
						rs.getDouble("price"),
						rs.getString("image"),
						rs.getString("description"),
						rs.getString("status"));
				
				itemList.add(item);
			}
			
			return itemList;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	//GET COLOR LIST
	public List<Color> getColorList(){
		List<Color> colorList = new ArrayList<Color>();
		String sql = "SELECT * FROM tblcolor";
		
		try{
			//SET THE QUERY
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			
			//FETCH THE DATA
			while(rs.next()){
				Color color = new Color(rs.getInt("id") , rs.getString("color") , rs.getString("hex"));
				colorList.add(color);
			}
			return colorList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	//GET SIZE LIST
	public List<Size> getSizeList(){
		List<Size> sizeList = new ArrayList<Size>();
		String sql = "SELECT * FROM tblsize";
		
		try{
			//SET THE QUERY
			PreparedStatement pst = conn.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			
			//FETCH THE DATA
			while(rs.next()){
				Size size = new Size(rs.getInt("id") , rs.getString("size"));
				sizeList.add(size);
			}
			return sizeList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
		
	//GET ITEM BY PRODUCT CODE
	public InventoryProduct getProductByProductCode(String productCode){
		for(InventoryProduct product : getInventoryProduct()){
			if(product.getItem().getProductCode().equals(productCode))
				return product;
		}
		return null;
	}
	
	//GET ALL USER
	public List<User> getAllUser(){
		List<User> listOfUser = new ArrayList<User>();
		try{
			String sql = "SELECT * FROM tbluser";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfUser.add(new User(rs.getInt("id") , 
						rs.getString("email") , 
						rs.getString("password"),
						rs.getString("first_name"),
						rs.getString("last_name")));
			}
			
			return listOfUser;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}

	public void registerUser(String email , String password , String firstName , String lastName){
		try{
			String sql = "INSERT INTO tbluser(id , email , password , first_name , last_name) values(4 , ? , ? , ? , ?);";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, firstName);
			pst.setString(4, lastName);
			pst.executeUpdate();
			
			System.out.println("Register 1 person.");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void addItem(String productCode ,
			String name, 
			double price, 
			String image,
			String description,
			String status,
			List<Color> color,
			List<Size> size){
		
		String sql = "INSERT INTO tblitem(product_code , name ,price , image  , status , description) VALUES (? , ? , ?, ? , ? , ?)";
	
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , productCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
