defmodule StudentWeb.HelloController do
  use StudentWeb, :controller

  def index(conn, _params) do
    #Student.StudentManager.create_new_user
    Student.StudentManager.destroy_all_users
    conn
  end



end
