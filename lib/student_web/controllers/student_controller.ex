defmodule StudentWeb.StudentController do
  use StudentWeb, :controller


  def index(conn, _params) do
    results = Student.Student |> Student.Repo.all
    render(conn, "index.html", students: results)
  end

  def show(conn, _params) do
    %{first_name: first_name, last_name: last_name, course_of_study: course_of_study} =
    Student.Repo.get(Student.Student, 1)

    render(conn, "show.html", student_details: [first_name, last_name, course_of_study])
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
    render(conn, "new.html")
  end




end
