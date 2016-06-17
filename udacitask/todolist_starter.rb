class TodoList
  attr_reader :title, :items
  
  def initialize(list_title)
    @title = list_title
	@items = Array.new
  end
end

class Item
  attr_reader :description, :completion_status
  
  def initialize(item_description)
    @description = item_description
    @completion_status = false
  end
end
