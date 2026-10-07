require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "index mostra total de tarefas criadas na história" do
    AppStat.bump_todos_created!
    get todos_url

    assert_response :success
    assert_select ".history-count", text: /1 tarefa criada/
  end

  test "criar tarefa marca a página para soltar confetti" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { title: "Comemorar" } }
    end

    assert_redirected_to todos_url
    follow_redirect!
    assert_select "p.notice[data-confetti=true]", text: "Tarefa criada com sucesso."
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { completed: @todo.completed, title: @todo.title } }
    end

    assert_redirected_to todos_url
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { completed: @todo.completed, title: @todo.title } }
    assert_redirected_to todos_url
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
