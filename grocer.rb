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
  i = 0 
  while i < coupons.length 
  cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
  item_name_couponed = "#{coupons[i][:item]} W/COUPON"
  cart_item_with_coupon = find_item_by_name_in_collection(item_name_couponed, cart)
  if cart_item && cart_item[:count] >= coupons[i][:num]
    #checks if cart_item is in our cart AND if the cart items count is greater than or equal to the number of that item on our coupon. if those two things are true:
    if cart_item_with_coupon
      cart_item_with_coupon[:count] += coupons[i][:num]
      cart_item[:count] -= coupons[i][:num]
    else
      cart_item_with_coupon = {
        item: item_name_couponed,
        price: coupons[i][:cost] / coupons[i][:num],
        count: coupons[i][:num],
        clearance: cart_item[:clearance]
      }
      cart << cart_item_with_coupon
      cart_item[:count] -= coupons[i][:num]
    end 
  end 
  i += 1 
 end
 cart 
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0 
  while i < cart.length 
  if cart[i][:clearance]
    cart[i][:price] = (cart[i][:price] - (cart[i][:price] * 0.2)).round(2)
   end 
  i += 1 
  end 
  cart 
end

def checkout(cart, coupons)
  #consolidates cart 
  consolidated_cart = consolidate_cart(cart)
  #applies cooupons to the cart 
  coupouned_cart = apply_coupons(consolidated_cart, coupons)
  #takes coupouned cart and applies the clearance value 
  final_cart = apply_clearance(coupouned_cart)
  total = 0 
  i = 0 
  while i < final_cart.length
  total += final_cart[i][:price] * final_cart[i][:count]
  if total > 100 
    total -= (total * 0.10)
  end 
  i += 1 
end 
total
end
