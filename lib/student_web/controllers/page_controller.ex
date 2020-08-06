defmodule StudentWeb.PageController do
  use StudentWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", csrf: Plug.CSRFProtection.get_csrf_token() )
  end

  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end
end
