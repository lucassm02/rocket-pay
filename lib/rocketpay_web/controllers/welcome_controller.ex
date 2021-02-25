defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Salve deu certo, resultado: #{result}"})
  end

  defp handle_response({:error, %{message: reason}}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: "Deu ruim, motivo: #{reason}"})
  end
end
