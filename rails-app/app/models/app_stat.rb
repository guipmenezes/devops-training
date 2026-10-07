class AppStat < ApplicationRecord
  # Linha única (singleton) com estatísticas gerais do app.
  def self.record
    first_or_create!
  end

  def self.todos_created_count
    record.todos_created_count
  end

  def self.bump_todos_created!
    record.increment!(:todos_created_count)
  end
end
