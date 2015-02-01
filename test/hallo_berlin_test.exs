defmodule HalloBerlinTest do
  use ExUnit.Case
  use Plug.Test

  @opts HalloBerlin.init([])

  test "returns hallo berlin" do
    conn = conn(:get, "/")
    conn = HalloBerlin.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hallo Berlin!"
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
