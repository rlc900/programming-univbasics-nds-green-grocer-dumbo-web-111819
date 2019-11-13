require 'pry'

def find_item_by_name_in_collection(name, collection)
    i = 0 
    while i < collection.length 
      if collection[i][:item] == name 
       return collection[i]
    end 
   i += 1 
  end 
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  new_cart = []
  i = 0 
  while i < cart.length 
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item != nil 
      new_cart_item[:count] += 1 
    else 
      new_cart_item = {
        item: cart[i][:item],
        price: cart[i][:price],
        clearance: cart[i][:clearance],
        count: 1 
      }
      new_cart << new_cart_item
    end 
    i += 1 
  end 
  new_cart 
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0 
  while i < coupons.length 
  cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
  item_couponed_name = "#{coupons[i][:item]} W/COUPON"
  cat_item_with_coupon = find_item_by_name_in_collection(item_couponed_name)
  i += 1 
 end 
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
