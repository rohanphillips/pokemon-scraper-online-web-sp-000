class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each{|key, value| self.send(("#{key}="), value)}
  end

  def save
  if self.id
    self.update
  else
    sql = <<-SQL
      INSERT INTO pokemon (id, name, type)
      VALUES (?, ?, ?)
    SQL
    DB[:conn].execute(sql, self.id, self.name, self.type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
end
