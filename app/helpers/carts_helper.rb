module CartsHelper
  
  def current_order
    session[:cart] ||= []
  end

  def handling_data order, order_item
  	order.each_with_index{
  		|order_item_in_arr, index|
  		if order_item_in_arr["book_id"] == order_item["book_id"]
  			order_item_in_arr["number_borrow"] += order_item["number_borrow"]
  			return
  		end
  	}
  	if order.size < 10
      order[order.size] = order_item
      return
  	else
  		
  	end
  end
end
