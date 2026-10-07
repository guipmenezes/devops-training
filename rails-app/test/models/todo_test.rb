require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "criar tarefa incrementa o contador histórico" do
    assert_difference "AppStat.todos_created_count", 1 do
      Todo.create!(title: "Nova tarefa")
    end
  end

  test "excluir tarefa mantém o contador histórico" do
    todo = Todo.create!(title: "Temporária")

    assert_no_difference "AppStat.todos_created_count" do
      todo.destroy!
    end
  end
end
