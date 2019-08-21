class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each{|key, value| self.send(("#{key}="), value)}
  end
end
