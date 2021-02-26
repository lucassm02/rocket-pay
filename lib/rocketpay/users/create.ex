defmodule Rocketpay.User.Create do
  alias Ecto.Multi
  alias Rocketpay.{Repo, User, Account}

  def call(params) do
    Multi.new()
    |> Multi.insert(:create_user, User.changeset(params))
    |> Multi.run(:create_account, fn repo, %{create_user: user} ->
      insert_Account(repo, user)
    end)
    |> run_transaction()

    # params
    # |> User.changeset()
    # |> Repo.insert()
  end

  defp run_transaction(mult) do
    case Repo.transaction(mult) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{create_account: account}} -> {:ok}
    end
  end

  defp insert_Account(repo, user) do
    user.id
    |> account_changeset()
    |> repo.insert()
  end

  defp account_changeset(user_id) do
    Account.changeset(%{user_id: user_id, balance: "0.00"})
  end
end
