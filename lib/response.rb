module Response
  
  def self.perform type = true, data = {}
  	response = {}  
    response['success'] = type
    response.merge!(data.stringify_keys)
    response
  end

  def self.unauthorized
  	self.perform false, { message: 'unauthorized' }
  end

  def self.something_went_wrong
    self.perform false, { message: 'Something went wrong' }
  end

end