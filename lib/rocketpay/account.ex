defmodule Rocketpay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Rocketpay.User

  @primary_key {:id, :integer, autoincrement: true}
  @foreign_key_type :integer

  @required_params [:balance, :user_id]

  schema "tb_account" do
    field(:balance, :decimal)
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:tb_balance, :balance_must_be_positive_or_zero)
  end
end
