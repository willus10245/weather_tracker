defmodule WeatherTracker.Repo.Migrations.AddHumidity do
  use Ecto.Migration

  def change do
    alter table(:weather_conditions) do
      add :humidity_rh, :decimal
    end
  end
end
