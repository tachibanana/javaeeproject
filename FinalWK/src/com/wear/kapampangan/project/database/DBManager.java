package com.wear.kapampangan.project.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wear.kapampangan.project.library.Admin;
import com.wear.kapampangan.project.library.Category;
import com.wear.kapampangan.project.library.Color;
import com.wear.kapampangan.project.library.DesignBack;
import com.wear.kapampangan.project.library.DesignFront;
import com.wear.kapampangan.project.library.InventoryDetail;
import com.wear.kapampangan.project.library.InventoryProduct;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.OrderInfo;
import com.wear.kapampangan.project.library.OrderView;
import com.wear.kapampangan.project.library.Post;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.Review;
import com.wear.kapampangan.project.library.Shirt;
import com.wear.kapampangan.project.library.Size;
import com.wear.kapampangan.project.library.Topic;
import com.wear.kapampangan.project.library.User;
import com.wear.kapampangan.project.library.UserAuth;
import com.wear.kapampangan.project.library.UserInfo;

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
	
	//GET all admin
	public List<Admin> getAllAdmin(){
		List<Admin> listOfAdmin = new ArrayList<Admin>();
		try{
			String sql = "SELECT * FROM tbladmin";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfAdmin.add(new Admin(rs.getString("username") , 
						rs.getString("email") , 
						rs.getString("password"),
						rs.getInt("isActivated")));
			}
			
			return listOfAdmin;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public void registerUser(String email , String password , String firstName , String lastName){
		try{
			String sql = "INSERT INTO tbluser( email , password , first_name , last_name) values(  ? , ? , ? , ?);";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, firstName);
			pst.setString(4, lastName);
			pst.executeUpdate();
			
			//End
			int userId = this.getUserIdByEmail(email);
			sql = "INSERT INTO tblwishlist(user_id) VALUES(?)";
			PreparedStatement pst1 = conn.prepareStatement(sql);
			
			pst1.setInt(1, userId);
			pst1.executeUpdate();
			
			
			sql = "INSERT INTO tbluser_info3(user_id , address , address_line , city , zip_code , additional_info , mobile_number) VALUES(? , ? , ? , ? , ? , ? , ?)";
			PreparedStatement pst2 = conn.prepareStatement(sql);
			pst2.setInt(1, userId);
			pst2.setString(2, "");
			pst2.setString(3, "");
			pst2.setString(4, "");
			pst2.setString(5, "");
			pst2.setString(6, "");
			pst2.setString(7, "");
			
			pst2.executeUpdate();
			
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
	
	//get color
	public Color getColorByName(String name){
		Color color = null;
		try{
			for(Color c : getColorList()){
				if(c.getColor().equalsIgnoreCase(name)){
					color = c;
				}
			}
			
			return color;
		}catch(Exception e){
			e.printStackTrace();
			return null;
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
			String sql = "DELETE FROM tblsize WHERE size = ?";
			try{
				
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, size);
				pst.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	//get size
	public Size getSizeByName(String name){
		//System.out.println(name);
		Size size = null;
		try{
			for(Size s : getSizeList()){
				if(s.getSize().equalsIgnoreCase(name)){
					size = s;
				}
			}
			
			return size;
		}catch(Exception e){
			e.printStackTrace();
			return null;
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
	
	//add inventory detail
	public void addInventoryDetail(String productCode , int quantity , byte status){
		if(quantity == 0){
			status = 0;
		}
		
		String sql = "INSERT INTO tblinventory(item_id , quantity , status) VALUES(? , ? , ?)";
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , productCode);
			pst.setInt(2, quantity);
			pst.setByte(3, status);
			pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//update inventory detail is quantity
	public void updateQuantity(String productCode , int quantity){
		byte status = 0;
		
		if(quantity == 0){status = 0;}else{status = 1;}
		
		try{
			String sql = "Update tblinventory SET quantity = ? , status = ? WHERE item_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , quantity);
			pst.setByte(2, status);
			pst.setString(3, productCode);
			pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
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
	
//	public void addUserInfo(int userId){
//		try{
//			
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
//	}
	
	public UserInfo getUserInfoByUserId(int userId){
		UserInfo info = null;
		//System.out.println("user id = " + userId);
		try{
			String sql = "SELECT * FROM tbluser_info3 WHERE user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				info = new UserInfo(rs.getInt("id") ,
						rs.getInt("user_id"),
						rs.getString("address") , 
						rs.getString("address_line") , 
						rs.getString("city") ,  
						rs.getString("zip_code") , 
						rs.getString("additional_info") , 
						rs.getString("mobile_number"));
				
			}
			return info;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	public void updateUserInfo(String firstName , String lastName , String password , String email){
		try{
			String sql = "UPDATE tbluser SET first_name = ? , last_name = ? , password = ? WHERE email = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, password);
			pst.setString(4, email);
			pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void updateUserInfo3ByUserId(int userId , String add , String add2 , String city , String zip ,String additionalInfo , String mobileNo){
		try{
			String sql = "UPDATE tbluser_info3 SET address = ? , address_line = ? , city = ? , zip_code = ? , additional_info = ? , mobile_number = ? WHERE user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , add);
			pst.setString(2 , add2);
			pst.setString(3 , city);
			pst.setString(4 , zip);
			pst.setString(5 , additionalInfo);
			pst.setString(6 , mobileNo);
			pst.setInt(7 , userId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public Color getColorById(int id){
		try{
			Color color = null;
			String sql  = "SELECT * FROM tblcolor WHERE id = ? LIMIT 1";		
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				color = new Color(id , rs.getString("color") , rs.getString("hex"));
			}
			return color;		
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}	
	
	}
	
	public Size getSizeById(int id){
		try{
			Size size = null;
			String sql  = "SELECT * FROM tblsize WHERE id = ? LIMIT 1";		
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				size = new Size(id , rs.getString("size"));
			}
			return size;		
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}	
	
	}
	

	
	
	public List<Product> listOfItemOrderByOrderId(int id){
		try{
			List<Product> listOfItemOrder = new ArrayList<Product>();
			String sql = "SELECT * FROM tblorder_item WHERE order_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				Item item = this.getItemByProductCode(rs.getString("item_id"));
				Color color = this.getColorById(rs.getInt("color_id"));
				Size size = this.getSizeById(rs.getInt("size_id"));
				int quantity =  rs.getInt("quantity");
				listOfItemOrder.add(new Product(rs.getInt("id") , quantity , (item.getPrice() * (double) quantity) , item , color , size));
			}
			
			
			return listOfItemOrder;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public User getUserById(int id){
		try{
			User user = null;
			String sql = "SELECT * FROM tbluser WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				user = new User(rs.getInt("id") ,
						rs.getString("email") ,
						rs.getString("password") ,
						rs.getString("first_name") ,
						rs.getString("last_name"));
			}
			
			return user;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void removeOrderInfoByOrderNo(int orderNo){
		try{
			String sql = "DELETE FROM tblorder WHERE order_no = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, orderNo);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public OrderInfo getOrderInfoByUserIdAndOrderNo(int userId , int orderNo){
		try{
			OrderInfo orderInfo = null;
			String sql = "SELECT * FROM tblorder WHERE user_id = ? AND order_no = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			pst.setInt(2, orderNo);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				int orderId = rs.getInt("id");
				User user = this.getUserById(userId);
//				System.out.println("User info : " + userInfo);
//				System.out.println("User id : " + userId +" Order");
				
				UserInfo userInfo = getShippingAddress(userId , orderId);
				
				//UserInfo userInfo = null;
				orderInfo = new OrderInfo(orderId , user , userInfo ,
						rs.getString("date") , rs.getString("status") , orderNo , listOfItemOrderByOrderId(orderId));
				
			}
			
			return orderInfo;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<OrderInfo> getOrderInfoByUserId(int userId){
		try{
			List<OrderInfo> listOfOrderInfo = new ArrayList<OrderInfo>();
			String sql = "SELECT * FROM tblorder WHERE user_id = ? ORDER BY date DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				int orderId = rs.getInt("id");
				User user = this.getUserById(userId);
				UserInfo userInfo = getUserInfoByUserId(userId);
				
				listOfOrderInfo.add(new OrderInfo(orderId , user , userInfo ,
						rs.getString("date") , rs.getString("status") , rs.getInt("order_no") , listOfItemOrderByOrderId(orderId)));
				
			}
			
			return listOfOrderInfo;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void createTempUserRegister(String firstname ,String lastname ,String email ,String password){
		try{
			String sql = "INSERT INTO tbltemp_user(firstname , lastname , email , password) VALUES(? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, firstname);
			pst.setString(2, lastname);
			pst.setString(3, email);
			pst.setString(4, password);
			pst.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public User getTempUserRegisterById(int id){
		try{
			User tempuser = null;
			String sql = "SELECT * FROM tbltemp_user WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				tempuser = new User(id , rs.getString("email") , rs.getString("password") , rs.getString("firstname") , rs.getString("lastname"));
				
			}
			return tempuser;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public User getTempUserRegisterByEmail(String email){
		try{
			User tempuser = null;
			String sql = "SELECT * FROM tbltemp_user WHERE email = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				tempuser = new User(0 ,email , rs.getString("password") , rs.getString("firstname") , rs.getString("lastname"));
			}
			return tempuser;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void deleteTempUserRegisterByEmail(String email){
		try{
		
			String sql = "DELETE FROM tbltemp_user WHERE email = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.executeUpdate();
	
		}catch(Exception e){
			e.printStackTrace();

		}
		
	}
	
	public void addOrder(OrderInfo order){
		try{
			String sql = "INSERT INTO tblorder(user_id , user_info_id , date , status , order_no) VALUES(? , ? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, order.getUser().getId());
			pst.setInt(2, order.getuserInfo().getId());
			pst.setString(3, order.getDate());
			pst.setString(4, order.getStatus());
			pst.setInt(5, order.getOrderNo());
			pst.executeUpdate();
			
			sql = "SELECT id FROM tblorder WHERE order_no = ?";
			int id = 1;
			PreparedStatement pst1 = conn.prepareStatement(sql);
			pst1.setInt(1, order.getOrderNo());
			ResultSet rs = pst1.executeQuery();
			
			while(rs.next()){
				id = rs.getInt("id");
			}
			
			addOrderItems(order.getItemList() , id);
			addOrderView(id);
			addShippingAddressWithUserId(order.getuserInfo() , id);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addOrderItems(List<Product> productList , int orderId){
		try{
			String sql = "INSERT INTO tblorder_item(order_id , item_id , color_id , size_id , quantity) VALUES(? , ? , ? , ? , ?)";
			
			for(Product p : productList){
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setInt(1, orderId);
				pst.setString(2, p.getItem().getProductCode());
				pst.setInt(3, p.getColor().getId());
				pst.setInt(4, p.getSize().getId());
				pst.setInt(5, p.getQuantity());
				pst.executeUpdate();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addShippingAddressWithUserId(UserInfo info , int orderId){
		
		try{
			String sql = "INSERT INTO tblshipping_address(user_id , order_id , address , address_line , city , zip_code , additional_info , mobile_number ) VALUES(? , ? , ?  , ? ,? ,? ,? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1  , info.getUserId());
			pst.setInt(2, orderId);
			pst.setString(3, info.getAddress1());
			pst.setString(4, info.getAddress2());
			pst.setString(5, info.getCity());
			pst.setString(6, info.getZip());
			pst.setString(7, info.getAdditionalInfo());
			pst.setString(8, info.getMobileNumber());
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public UserInfo getShippingAddress(int userId , int orderId){
		try{
			UserInfo info = null;
			String sql = "SELECT * FROM tblshipping_address WHERE user_id = ? AND order_id = ? ";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			pst.setInt(2, orderId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				info = new UserInfo(rs.getInt("id") ,
						userId , 
						rs.getString("address") ,
						rs.getString("address_line") ,
						rs.getString("city"),
						rs.getString("zip_code"),
						rs.getString("additional_info"),
						rs.getString("mobile_number"));
			}		
			
			return info;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void createUserAuthByIdOrEmail(int id , String email){
		try{
			String sql = "INSERT INTO tbluser_auth(accountType , user_id , isActivated) VALUES(? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , "user");
			pst.setInt(2 , id);
			pst.setInt(3, 1);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void removeUserByIdOrEmail(int id , String email){
		try{
			
			String sql = "DELETE FROM tbluser WHERE id = ? OR email = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2 , email);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public UserAuth getUserAuthByUserId(int userId){
		try{
			UserAuth auth = null;
			String sql = "SELECT * FROM tbluser_auth where user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			

			while(rs.next()){
				auth = new UserAuth(rs.getInt("id") , userId , rs.getInt("isActivated") , rs.getString("accountType"));
			}
			
			//System.out.println(auth);
			return auth;
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println("funck");
			return null;
		}
	}
	
	public void updateUserAuth(int id , int activated , String accountType){
		try{
			String sql = "UPDATE tbluser_auth SET isActivated = ? , accountType = ? WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, activated);
			pst.setString(2 , accountType);
			pst.setInt(3, id);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public OrderView getOrderViewById(int orderId){
		OrderView view = null;
		try{
			String sql = "SELECT * FROM tblorder_view where order_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				view = new OrderView(rs.getInt("id"), rs.getInt("order_id") , rs.getInt("isRead"));
			}
			return view;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void addOrderView( int orderId){
		try{
			String sql = "INSERT INTO tblorder_view(order_id , isRead) VALUES(? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, orderId);
			pst.setInt(2, 0);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public List<OrderInfo> getAllOrderInfo(){
		try{
			List<OrderInfo> listOfOrderInfo = new ArrayList<OrderInfo>();
			String sql = "SELECT * FROM tblorder as o JOIN tblorder_view as ov ON o.id = ov.order_id ORDER BY ov.isRead , o.date DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()){
				int orderId = rs.getInt("id");
				User user = this.getUserById(rs.getInt("user_id"));
				UserInfo userInfo = getUserInfoByUserId(rs.getInt("user_id"));
				
				listOfOrderInfo.add(new OrderInfo(orderId , user , userInfo ,
						rs.getString("date") , rs.getString("status") , rs.getInt("order_no") , listOfItemOrderByOrderId(orderId)));
				
			}
			
			return listOfOrderInfo;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void updateOrderStatusOrderByOrderNumber(int orderNumber , String status){
		try{
			String sql = "UPDATE tblorder SET status = ? WHERE order_no = ?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, status);
			pst.setInt(2 , orderNumber);
			pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateUserViewToRead(int orderId){
		try{
			String sql = "UPDATE tblorder_view SET isRead = ? WHERE order_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, 1);
			pst.setInt(2 , orderId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addReviewsToItem(int userId , String itemId , Review review){
		try{
			String sql = "INSERT INTO tblreviews(user_id , item_id , subject , rate , comment , date) VALUES(? , ? , ? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , userId);
			pst.setString(2 ,  itemId);
			pst.setString(3 , review.getSubject());
			pst.setInt(4 , review.getRate());
			pst.setString(5, review.getComment());
			pst.setString(6 , review.getDate());
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public List<Review> getAllReviewByItemId(String itemId){
		try{
			List<Review> listOfReview = new ArrayList<Review>();
			String sql = "SELECT * FROM tblreviews WHERE item_id = ?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, itemId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfReview.add(new Review(rs.getInt("id") ,
						rs.getInt("user_id") ,
						rs.getString("item_id") ,
						rs.getString("subject") ,
						rs.getInt("rate") ,
						rs.getString("comment"),
						rs.getString("date")));
			}
			
			return listOfReview;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void addNewReviewToItem(String itemId , int userId , Review review){
		try{
			String sql = "INSERT INTO tblreviews(item_id , user_id , subject , rate , comment , date) VALUES(? , ? , ? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, itemId);
			pst.setInt(2, userId);
			pst.setString(3, review.getSubject());
			pst.setInt(4, review.getRate());
			pst.setString(5, review.getComment());
			pst.setString(6, review.getDate());
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public double getTotalRateOfAnItem(String itemId){
		try{
			double totalRate = 0.0;
			double rateCounter = 0.0;
			String sql = "SELECT *  FROM tblreviews WHERE item_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, itemId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				totalRate += ((double) rs.getInt("rate"));
				rateCounter ++;
			}
			
			return totalRate / rateCounter;
		}catch(Exception e){
			e.printStackTrace();
			return 0.0;
		}
	}
	
	public List<Review> listOfReviewAccordingToItem(String itemId){
		try{
			List<Review> listOfReview = new ArrayList<Review>();
			String sql = "SELECT *  FROM tblreviews WHERE item_id = ? ORDER BY date DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, itemId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfReview.add(new Review(rs.getInt("id") , rs.getInt("user_id") , 
						rs.getString("item_id") , rs.getString("subject") , 
						rs.getInt("rate") , rs.getString("comment") , rs.getString("date")));
			}
			
			
			return listOfReview;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void updateReview(String itemId , int userId , Review review){
		try{
			
			String sql = "UPDATE tblreviews SET subject = ? , comment = ? , rate = ? , date = ? WHERE item_id = ? AND user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, review.getSubject());
			pst.setString(2, review.getComment());
			pst.setInt(3, review.getRate());
			pst.setString(4, review.getDate());
			pst.setString(5, itemId);
			pst.setInt(6, userId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public void removeReview(String itemId , int userId){
		try{
			String sql = "DELETE FROM tblreviews WHERE item_id = ? AND user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, itemId);
			pst.setInt(2, userId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<Category> getAllCategory(){
		try{
			List<Category> listOfCategory = new ArrayList<Category>();
			String sql = "SELECT * FROM tblcategory";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfCategory.add(new Category(rs.getInt("id") , rs.getString("category_name") , rs.getString("desc") , rs.getString("icon")));
			}
			return listOfCategory;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public Category getCategoryById(int id){
		try{
			Category category = null;
			
			String sql = "SELECT * FROM tblcategory WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , id);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				category = new Category(rs.getInt("id") , rs.getString("category_name") , rs.getString("desc") , rs.getString("icon"));
			}
			
			return category;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Topic> getAllTopicByCategoryid(int categoryId){
		try{
			List<Topic> listOfTopic = new ArrayList<Topic>();
			String sql = "SELECT * FROM tbltopic WHERE category_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , categoryId);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfTopic.add(new Topic(rs.getInt("id") , rs.getInt("category_id") ,rs.getInt("user_id") , rs.getString("subject") , rs.getString("tags") , rs.getInt("views") , rs.getString("date")));
			}
			
			return listOfTopic;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Topic> getAllTopic(){
		try{
			List<Topic> listOfTopic = new ArrayList<Topic>();
			String sql = "SELECT * FROM tbltopic";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfTopic.add(new Topic(rs.getInt("id") , rs.getInt("category_id") ,rs.getInt("user_id") , rs.getString("subject") , rs.getString("tags") , rs.getInt("views") , rs.getString("date")));
			}
			
			return listOfTopic;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void addTopicToCategory(int categoryId , Topic topic){
		try{
			String sql = "INSERT INTO tbltopic(category_id , user_id , subject , tags , views , date) VALUES(? , ? , ? , ? ,? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , categoryId);
			pst.setInt(2, topic.getUserId());
			pst.setString(3, topic.getSubject());
			pst.setString(4 , topic.getTags());
			pst.setInt(5, topic.getViews());
			pst.setString(6, topic.getDate());
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public Topic getTopicByCategoryidAndUserIdAndId(int id){
		try{
			Topic topic = null;
			String sql = "SELECT * FROM tbltopic WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , id);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				topic = new Topic(rs.getInt("id") , rs.getInt("category_id") ,rs.getInt("user_id") , rs.getString("subject") , rs.getString("tags") , rs.getInt("views") , rs.getString("date"));
			}
			
			return topic;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Integer> getAllTopicByUserId(int userId){
		try{
			List<Integer> listOfTopicId = new ArrayList<Integer>();
			String sql = "SELECT * FROM tbltopic WHERE user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , userId);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfTopicId.add(rs.getInt("id"));
			}
			
			return listOfTopicId;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public int getNumberOfAllTopicByCategoryId(int categoryId){
		try{
			int totalTopic = 0;
			String sql = "SELECT COUNT(*) as count FROM tbltopic WHERE category_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , categoryId);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				totalTopic = rs.getInt("count");
			}
			
			return totalTopic;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	
	public int getNumberOfAllPostByTopicId(int topicId){
		try{
			int totalPost = 0;
			String sql = "SELECT COUNT(*) as count FROM tblpost WHERE topic_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , topicId);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				totalPost = rs.getInt("count");
			}
			
			return totalPost;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getNumberOfAllPostByCategoryId(int categoryId){
		try{
			int totalPost = 0;
			String sql = "SELECT COUNT(*) as count FROM tblcategory as c JOIN tbltopic as t ON c.id = t.category_id JOIN tblpost as p ON t.id = p.topic_id WHERE c.id = ?;";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, categoryId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				totalPost = rs.getInt("count");
			}
			
			return totalPost;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	
	public void updateTopicViews(int id , int views){
		try{
			String sql = "UPDATE tbltopic SET views = ? WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , views);
			pst.setInt(2 , id);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void removeTopicById(int id){
		try{
			String sql = "DELETE FROM tbltopic WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , id);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<Post> getAllPostByTopicId(int topicId){
		try{
			List<Post> listOfPost = new ArrayList<Post>();
			String sql = "SELECT * FROM tblpost WHERE topic_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , topicId);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfPost.add(new Post(rs.getInt("id") , rs.getInt("topic_id") , rs.getInt("user_id") , rs.getString("content") , rs.getInt("content_no") , rs.getString("date")));
			}
			
			return listOfPost;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	public void addPostToTopic(int topicId , Post post){
		try{
			String sql = "INSERT INTO tblpost(topic_id , user_id , content , content_no , date) VALUES(? , ? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , topicId);
			pst.setInt(2 , post.getUserId());
			pst.setString(3, post.getContent());
			pst.setInt(4 , post.getContentNo());
			pst.setString(5, post.getDate());
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addSaveFileToUser(int id , int userId , String shirtName , String shirtChoose , String date , String designFront , String designBack){
		try{
			String sql = "INSERT INTO tblshirt(id , user_id , shirt_name , shirt_choose , date) VALUES(? , ? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2 , userId);
			pst.setString(3 , shirtName);
			pst.setString(4, shirtChoose);
			pst.setString(5, date);
			pst.executeUpdate();
			
			if(designFront.split("@").length > 0){
				for(String design : designFront.split("@")){
					if(design != null || design != ""){
						addDesignFront(id , design);
					}
				}
				
			}
			
			if(designBack.split("@").length > 0){
				for(String design : designBack.split("@")){
					if(design != null || design != ""){
						addDesignBack(id , design);
					}
				}
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addDesignFront(int shirtId , String design){
		try{
			String sql = "INSERT INTO tbldesign_front(shirt_id , design) VALUES(? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, shirtId);
			pst.setString(2, design);
			pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void addDesignBack(int shirtId , String design){
		try{
			String sql = "INSERT INTO tbldesign_back(shirt_id , design) VALUES(? , ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, shirtId);
			pst.setString(2, design);
			pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	public void updateShirtByShirtId(int id , String shirtName ,String shirtChoose , String date ,String designFront ,String designBack){
		try{
			String sql = "UPDATE tblshirt SET shirt_name = ?, shirt_choose = ? , date = ? WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, shirtName);
			pst.setString(2, shirtChoose);
			pst.setString(3, date);
			pst.setInt(4, id);
			pst.executeUpdate();
			
			updateDesignFront(id , designFront);
			updateDesignBack(id , designBack);
			
		}catch(Exception e){
			e.printStackTrace();
		}	
	}
	
	public void updateDesignFront(int shirt_id , String design){
		try{
			String sql = "UPDATE tbldesign_front SET design = ? WHERE shirt_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, design);
			pst.setInt(2, shirt_id);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateDesignBack(int shirt_id , String design){
		try{
			String sql = "UPDATE tbldesign_back SET design = ? WHERE shirt_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, design);
			pst.setInt(2, shirt_id);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public Shirt getShirtByUserIdAndShirtId(int id , int userId){
		try{
			Shirt shirt = null;
			
			String sql = "SELECT * FROM tblshirt WHERE id = ? AND user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2, userId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				shirt = new Shirt(rs.getInt("id") , rs.getInt("user_id") , rs.getString("shirt_name") ,  rs.getString("shirt_choose") , rs.getString("date") , getDesignFront(id) , getDesignBack(id));
			}
			return shirt;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Shirt> getShirtByUserId(int userId){
		try{
			List<Shirt> listOfShirt = new ArrayList<Shirt>();
			
			String sql = "SELECT * FROM tblshirt WHERE user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfShirt.add(new Shirt(rs.getInt("id") , rs.getInt("user_id") , rs.getString("shirt_name") , rs.getString("shirt_choose") , rs.getString("date") , getDesignFront(rs.getInt("id")) , getDesignBack(rs.getInt("id"))));
			}
			
			return listOfShirt;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<DesignFront> getDesignFront(int shirtid){
		try{
			List<DesignFront> listOfDesignFront = new ArrayList<DesignFront>();
			String sql = "SELECT * FROM tbldesign_front WHERE shirt_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , shirtid);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfDesignFront.add(new DesignFront(rs.getInt("id") , rs.getInt("shirt_id") , rs.getString("design")));
			}
			
			
			return listOfDesignFront;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<DesignBack> getDesignBack(int shirtid){
		try{
			List<DesignBack> listOfDesignBack = new ArrayList<DesignBack>();
			String sql = "SELECT * FROM tbldesign_back WHERE shirt_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1 , shirtid);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				listOfDesignBack.add(new DesignBack(rs.getInt("id") , rs.getInt("shirt_id") , rs.getString("design")));
			}
			
			
			return listOfDesignBack;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	public void deleteShirtById(int id){
		try{
			String sql = "DELETE FROM tblshirt WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	public void updateAccountTypeByUserId(int userId , String type){
		try{
			String sql = "UPDATE tbluser_auth SET accountType = ? WHERE user_id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1 , type);
			pst.setInt(2, userId);
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public String getAccountTypeByUserId(int userId){
		try{
			String accountType = "";
			String sql = "SELECT * FROM tbluser_auth WHERE user_id = ? LIMIT 1";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				accountType = rs.getString("accountType");
			}
			
			return accountType;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
}





