package com.wear.kapampangan.project.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wear.kapampangan.project.library.Color;
import com.wear.kapampangan.project.library.InventoryDetail;
import com.wear.kapampangan.project.library.InventoryProduct;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.Size;
import com.wear.kapampangan.project.library.User;

public class DBManager{
	
	private ServerConnection server = null;
	private Connection conn = null;
	
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
						rs.getString("status"),
						rs.getString("description"));
				
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
	
	//GET ITEM BY PRODUCT CODE AND RETURN ITEM
	public Item getItemByProductCode(String productCode){
		for(Item item : this.getItemList()){
			if(item.getProductCode().equals(productCode))
				return item;
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
	
	//add new item
	public void addItem(Item item){
		
		String sql = "INSERT INTO tblitem(item_id , name ,price , image  , status , description) VALUES (? , ? , ?, ? , ? , ?)";
	
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , item.getProductCode());
			pst.setString(2, item.getName());
			pst.setDouble(3, item.getPrice());
			pst.setString(4 , item.getImage());
			pst.setString(5, item.getStatus());
			pst.setString(6, item.getDescription());
			pst.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}			
	}
	
	//remove item
	public void removeItem(String productCode){
		String sql = "DELETE FROM tblitem WHERE item_id = ?";
		try{
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, productCode);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//update item
	public void updateItem(Item item){
		String sql = "UPDATE tblitem SET name = ? , price = ? , image = ? , description = ? , status = ? WHERE item_id = ?";
		try{
			
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, item.getName());
			pst.setDouble(2, item.getPrice());
			pst.setString(3 , item.getImage());
			pst.setString(4, item.getDescription());
			pst.setString(5, item.getStatus());
			pst.setString(6 , item.getProductCode());
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//add new color
	public void addColor(String color , String hex){
		String sql = "INSERT INTO tblcolor(color , hex) VALUES(? , ?)";
		try{
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, color);
			pst.setString(2, hex);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//remove color
	public void removeColor(String color){
		String sql = "DELETE FROM tblcolor WHERE color = ?";
		try{
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, color);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//add available color to existing item
	public void addColorToItem(String productCode , int colorId){
		String sql = "INSERT INTO tblcolor_list(item_id , color_id) VALUES(? , ?)";
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, productCode);
			pst.setInt(2, colorId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//remove available color from existing item
	public void removeColorToItem(String productCode ,String colorId){
		String sql = "DELETE FROM tblcolor_list WHERE item_id = ? AND color_id = ?";
		try{
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, productCode);
			pst.setString(2, colorId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//add size
	public void addSize(String size){
		String sql = "INSERT INTO tblsize(size) VALUES(?)";
		
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, size);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//remove size
		public void removeSize(String size){
			String sql = "DELETE FROM tblcolor WHERE size = ?";
			try{
				
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, size);
				pst.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	//add available size to existing item
	public void addSizeToItem(String productCode , int sizeId){
		String sql = "INSERT INTO tblsize_list(item_id , size_id) VALUES(? , ?)";
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, productCode);
			pst.setInt(2, sizeId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//remove available size from existing item
		public void removeSizeToItem(String productCode ,String sizeId){
			String sql = "DELETE FROM tblsize_list WHERE item_id = ? AND size_id = ?";
			try{
				
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, productCode);
				pst.setString(2, sizeId);
				pst.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	//select wishlist item
	public List<Item> getWishlistItemByUserEmail(String email){
		List<Item> itemList = new ArrayList<Item>();
		try{
			String sql = "SELECT wi.item_id FROM tbluser as u JOIN tblwishlist as w ON u.id = w.user_id JOIN tblwishlist_item as wi ON w.id = wi.wishlist_id WHERE u.email = ?;";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , email);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				itemList.add((Item) getItemByProductCode(rs.getString("item_id")));
			}
			
			return itemList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void addWishlistItemToUser(int wishlistId , String productCode){
		try{
			String sql = "INSERT INTO tblwishlist_item (id, wishlist_id, item_id) VALUES (NULL, ? , ?);";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, wishlistId);
			pst.setString(2, productCode);
			pst.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void removeWishlistItemToUser(int wishlistId , String productCode){
		try{
			String sql = "DELETE FROM tblwishlist_item WHERE wishlist_id = ? AND item_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, wishlistId);
			pst.setString(2, productCode);
			pst.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public int getUserIdByEmail(String email){
		try{
			int userId = 0;
			String sql = "SELECT id FROM tbluser WHERE email = ? LIMIT 1";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				userId = rs.getInt("id");
			}
			return userId;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	//get wishlist id by user id
	public int getWishlistIdByUserId(int id){
		try{
			int wishlistId = 0;
			String sql = "SELECT id FROM tblwishlist WHERE user_id = ? LIMIT 1";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				wishlistId = rs.getInt("id");
			}
			return wishlistId;
			
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	//list of inventory detail
	public List<InventoryDetail> getInvetoryDetailList(){
		List<InventoryDetail> listOfInventoryDetail = new ArrayList<InventoryDetail>();
		String sql = "SELECT * FROM tblinventory";
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				int id= rs.getInt("id");
				String productCode = rs.getString("item_id");
				int quantity = rs.getInt("quantity");
				byte status = rs.getByte("status");
				listOfInventoryDetail.add(new InventoryDetail(id , productCode , quantity , status));
			}
			return listOfInventoryDetail;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	//inventory detail
	public InventoryDetail getInventoryDetailByProductCode(String productCode){
		InventoryDetail detail = null;
		try{
			for(InventoryDetail i : getInvetoryDetailList()){
				if(i.getProductCode().equalsIgnoreCase(productCode))
					detail = i;
			}
			return detail;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	//search query
	public List<Item> getItemByNameQuery(String name){
		List<Item> itemList = new ArrayList<Item>();
		
		String sql = "SELECT * FROM tblitem WHERE name LIKE ?";
		
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, name + "%");
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				itemList.add(new Item(rs.getString("item_id") ,
						rs.getString("name") ,
						rs.getDouble("price") ,
						rs.getString("image"),
						rs.getString("status"),
						rs.getString("description")));
			}
			return itemList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
