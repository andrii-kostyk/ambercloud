module Remote
  class ApiUser

  	def initialize(current_user = nil)
  	  @current_user = current_user
  	end

  	def self.authorize(name, password)
  	  user = User.find_by_name(name)
  	  return Response.perform(true, { token: user.token }) if user.present? && user.token.present?
  	  
  	  if user && user.authenticate(password)
  	    user.token = User.generate_token
  	  	if user.save
  	  	  Response.perform(true, { token: user.token })
  	  	else
  	  	  Response.something_went_wrong
  	  	end
  	  else
  	  	Response.perform(false, { message: "Wrong combination of data"})
  	  end
  	end

  	def logout
  	  @current_user.token = ""
	    if @current_user.save
  	    Response.perform(true, { message: "Success logging out" })
  	  else
  	    Response.something_went_wrong
  	  end
  	end

  end
end