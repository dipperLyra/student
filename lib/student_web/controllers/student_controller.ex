defmodule StudentWeb.StudentController do
  use StudentWeb, :controller

  def index(conn, _params) do
    student = Student.Student |> Student.Repo.all
    render(conn, "index.html", students: student)
    conn
  end

  def new(conn, student) do
    student = %Student.Student{
      course_of_study: student["course_of_study"],
      email: student["email"],
      first_name: student["first_name"],
      last_name: student["last_name"],
      password: student["password"]
    }

    Student.Repo.insert(student)
    render(conn, "index.html")
  end

end
