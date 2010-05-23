SimpleNavigation::Configuration.run do |navigation|  
  logged_in = Proc.new { User.find_by_id(session[:user_id]) }

  navigation.items do |root|
    root.dom_class = 'root_menu'
    
    root.item :logout, "Logout", logout_path, :method => :delete, :if => logged_in 
  end
end