defmodule TrotExample.Router.ShooterApi do
  use Trot.Router
  use Trot.Template

  get "/shoot" do
    {200, %{"success" => true}}
  end

  get "/get_messages" do
    {200, %{"messages" => [%{"type" => "test", "action" => "none"}]}}
  end
end
