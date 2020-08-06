defmodule Student.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :course_of_study, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:first_name, :last_name, :email, :course_of_study, :password])
    |> validate_required([:first_name, :last_name, :email, :course_of_study, :password])
  end
end
