class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each{|key, value| self.send(("#{key}="), value)}
  end

  def save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
end
