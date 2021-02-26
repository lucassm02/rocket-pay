defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table :tb_user do
      add :name, :string
      add :age, :int
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()
    end

    create unique_index(:tb_user, [:email])
    create unique_index(:tb_user, [:nickname])

  end
end
