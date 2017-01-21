defmodule TDBackend.Router do
  use Trot.Router

  get "/", do: 200

  # Returns an empty body with a status code of 400
  get "/bad" do
    :bad_request
  end

  import_routes TDBackend.Router.ShooterApi
  import_routes Trot.NotFound
end
