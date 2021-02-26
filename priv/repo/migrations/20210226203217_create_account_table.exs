defmodule Rocketpay.Repo.Migrations.CreateAccountTable do
  use Ecto.Migration

  def change do
    create table :tb_account do
      add :balance, :decimal
      add :user_id, references(:tb_user, type: :int)

      timestamps()

    end

    create constraint(:tb_account, :balance_must_be_positive_or_zero, check: "balance >= 0")
  end
end
