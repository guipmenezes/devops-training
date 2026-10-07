class Todo < ApplicationRecord
  after_create :record_creation

  private

  # Contador histórico: incrementa na criação e nunca decrementa,
  # então excluídas continuam contando.
  def record_creation
    AppStat.bump_todos_created!
  end
end
