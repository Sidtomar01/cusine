class Cart{
   String name;
   double cost;
 
   String name=req.getParameter("n");
   String cost=req.getParameter("c");

   HttpSession s=req.getSession();

   List<Cart> list= (List<Cart>) s.getAttribute("list");

   if(list==null){
     list =new ArrayList<>();
   }
   // Add the name & cost to List
   list.add(new Cart(name, cost));

   s.setAttribute("list",list);
   
   
   for(Cart cart : list){
	   out.println("Name "+ cart.getName());
	   out.println("Cost "+ cart.getCost());
	 }
}

