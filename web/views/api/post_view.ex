defmodule Shelve.API.PostView do
  use Shelve.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, Shelve.API.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, Shelve.API.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      url: post.url,
      title: post.title}
  end
end
