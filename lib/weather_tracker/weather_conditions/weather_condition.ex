defmodule WeatherTracker.WeatherConditions.WeatherCondition do
  use Ecto.Schema
  import Ecto.Changeset

  @allowed_fields [
    :altitude_m,
    :humidity_rh,
    :pressure_pa,
    :temperature_c,
    :co2_eq_ppm,
    :tvoc_ppb,
    :light_lumens
  ]

  @derive {Jason.Encoder, only: @allowed_fields}
  @primary_key false
  schema "weather_conditions" do
    field :timestamp, :naive_datetime
    field :altitude_m, :decimal
    field :humidity_rh, :decimal
    field :pressure_pa, :decimal
    field :temperature_c, :decimal
    field :co2_eq_ppm, :decimal
    field :tvoc_ppb, :decimal
    field :light_lumens, :decimal
  end

  def create_changeset(%__MODULE__{} = weather_condition, attrs) do
    timestamp =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.truncate(:second)

    weather_condition
    |> cast(attrs, @allowed_fields)
    |> validate_required(@allowed_fields)
    |> put_change(:timestamp, timestamp)
  end
end
