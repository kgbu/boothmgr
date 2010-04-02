class Admin
  attr_reader :roles

  def initialize
    @roles = []
  end

  def add_role(role)
    @roles << role 
  end
end
