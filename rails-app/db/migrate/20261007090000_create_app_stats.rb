class CreateAppStats < ActiveRecord::Migration[8.1]
  def change
    create_table :app_stats do |t|
      t.integer :todos_created_count, null: false, default: 0

      t.timestamps
    end

    # Backfill: tarefas já criadas antes do contador entram para a história.
    reversible do |dir|
      dir.up do
        execute <<~SQL
          INSERT INTO app_stats (todos_created_count, created_at, updated_at)
          SELECT COUNT(*), NOW(), NOW()
          FROM todos
        SQL
      end
    end
  end
end
