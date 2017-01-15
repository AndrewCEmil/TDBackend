defmodule TrotExample.Router.ShooterApi do
  use Trot.Router
  use Trot.Template

  get "/shoot" do
    {200, %{"success" => true}}
  end

  get "/get_messages" do
    {200, %{"messages" => [%{"type" => "test", "action" => "none"}]}}
  end

  post "/send_messages" do
    IO.puts "OMG"
    {:ok, data, _none} = Plug.Conn.read_body(conn)
    IO.puts data
    {:ok, data} = JSX.decode data
    IO.inspect data
  end
end
