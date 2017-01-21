defmodule TDBackend.Router.ShooterApi do
  use Trot.Router
  use Trot.Template

  get "/get_messages" do
    {200, %{"messages" => [%{"type" => "test", "action" => "none"}]}}
  end

  post "/send_messages" do
    IO.puts "OMG"
    {:ok, data, _none} = Plug.Conn.read_body(conn)
    IO.puts data
    {:ok, data} = JSX.decode data
    IO.inspect data
    handle_messages(data)
  end

  defp handle_messages data do
    data["messages"] |> Stream.map(fn message ->
      handle_message(message)
    end)
  end

  defp handle_message message do
    case message["type"] do
      "shoot" -> handle_shoot_message(message)
      "die" -> handle_die_message(message)
      "damage" -> handle_damage_message(message)
    end
  end

  defp handle_shoot_message message do
    IO.puts("shoot")
    IO.inspect(message)
  end

  defp handle_die_message message do
    IO.puts("die")
    IO.inspect(message)
  end

  defp handle_damage_message message do
    IO.puts("damage")
    IO.inspect(message)
  end
end
