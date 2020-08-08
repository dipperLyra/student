defmodule Student.Student do
  @moduledoc """
  This module defines the Student model schema and
  defines changeset properties for validation
  """
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

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:first_name, :last_name, :email, :course_of_study, :password])
    |> validate_required([:first_name, :last_name, :email, :course_of_study, :password])
  end
end
