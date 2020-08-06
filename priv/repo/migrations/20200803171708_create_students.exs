defmodule Student.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :course_of_study, :string
      add :password, :text

      timestamps()
    end

  end
end
