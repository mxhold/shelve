defmodule Shelve.Tag do
  use Shelve.Web, :model

  schema "tags" do
    field :name, :string
    has_many :post_tags, Shelve.PostTag

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, max: 1_000)
  end

  def valid_attrs do
    %{name: "mytag"}
  end

  def invalid_attrs do
    %{name: ""}
  end
end
