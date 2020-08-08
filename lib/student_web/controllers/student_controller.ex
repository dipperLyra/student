defmodule StudentWeb.StudentController do
  use StudentWeb, :controller

  @moduledoc """
  Contains all common functions (create, read, update and delete) performed
  on the Student model
  """

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  @doc """
  Returns a list of all the students
  """
  def index(conn, _params) do
    results = Student.Student |> Student.Repo.all
    render(conn, "index.html", students: results)
  end

  @spec show(Plug.Conn.t(), any) :: Plug.Conn.t()
  @doc """
  Returns a single Student record
  """
  def show(conn, _params) do
    %{first_name: first_name, last_name: last_name, course_of_study: course_of_study} =
    Student.Repo.get(Student.Student, 1)

    render(conn, "show.html", student_details: [first_name, last_name, course_of_study])
  end

  @spec new(Plug.Conn.t(), nil | maybe_improper_list | map) :: Plug.Conn.t()
  @doc """
  Creates a Student record using the form provided on the view
  """
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

  @spec update(any, any) :: any
  @doc """
  Updates a Student record using the student_id provided
  """
  def update(_conn, student_id) do
    student = Student.Repo.get(Student.Student, student_id)
    Student.Repo.update(student)
  end

  @spec delete(any, any) :: any
  @doc """
  Deletes a Student record using the student_id provided
  """
  def delete(_conn, student_id) do
    student = Student.Repo.get(Student.Student, student_id)
    Student.Repo.delete(student)
  end

  def hash_pass do

  end

end
