defmodule TrotExample.Router.ShooterApi do
  use Trot.Router
  use Trot.Template

  get "/shoot" do
    {200, %{"success" => true}}
  end
end
