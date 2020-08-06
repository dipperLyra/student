defmodule Student.StudentManager do

  def create_new_user do
    student = %Student.Student{
      course_of_study: "Electronic Engineering",
      email: "michael@sample.com",
      first_name: "Michael",
      last_name: "Obi",
      password: "my_secret"
    }

    Student.Repo.insert(student)
  end

  def destroy_all_users do
    Student.Student |> Student.Repo.delete_all
  end

end
