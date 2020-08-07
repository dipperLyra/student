defmodule StudentWeb.PageController do
  use StudentWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", csrf: Plug.CSRFProtection.get_csrf_token() )
  end
  
end
