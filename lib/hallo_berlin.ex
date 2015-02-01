defmodule HalloBerlin do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hallo Berlin!")
  end
end
