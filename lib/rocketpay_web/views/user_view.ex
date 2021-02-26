defmodule RocketpayWeb.UserView do
  alias Rocketpay.User

  def render("create.json", %{user: %User{id: id, name: name, nickname: nickname}}) do
    %{
      message: "User created with success",
      payload: %{user: %{id: id, name: name, nickname: nickname}}
    }
  end
end
