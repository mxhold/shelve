defmodule Shelve.Post do
  use Shelve.Web, :model

  schema "posts" do
    field :url, :string
    field :title, :string
    has_many :tags, Shelve.Tag

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title])
    |> validate_required([:url, :title])
    |> validate_length(:url, max: 100_000)
    |> validate_length(:title, max: 1_000)
  end

  def valid_attrs do
    %{title: "mytitle", url: "http://example.com"}
  end

  def invalid_attrs do
    %{title: "", url: ""}
  end
end
