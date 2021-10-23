defmodule MonochromeFilterNif do
  require Logger

  @moduledoc """
  Documentation for `MonochromeFilterNif`.
  """

  @on_load :load_nif

  def load_nif do
    nif_file = '#{Application.app_dir(:monochrome_filter, "priv/libnif")}'

    case :erlang.load_nif(nif_file, 0) do
      :ok -> :ok
      {:error, {:reload, _}} -> :ok
      {:error, reason} -> Logger.error("Failed to load NIF: #{inspect(reason)}")
    end
  end

  def monochrome32(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> monochrome32_sub()
  end

  def monochrome32(x) when is_number(x) do
    monochrome32(Nx.tensor([x]))
  end

  defp monochrome32_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: monochrome32_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def monochrome32_nif(_size, _x), do: raise("NIF monochrome32_nif/2 not implemented")

  def monochrome32i(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> monochrome32i_sub()
  end

  def monochrome32i(x) when is_number(x) do
    monochrome32i(Nx.tensor([x]))
  end

  defp monochrome32i_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: monochrome32i_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def monochrome32i_nif(_size, _x), do: raise("NIF monochrome32i_nif/2 not implemented")

  def monochrome32ip(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> monochrome32ip_sub()
  end

  def monochrome32ip(x) when is_number(x) do
    monochrome32ip(Nx.tensor([x]))
  end

  defp monochrome32ip_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: monochrome32ip_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def monochrome32ip_nif(_size, _x), do: raise("NIF monochrome32i_nif/2 not implemented")

  def monochrome16(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> monochrome16_sub()
  end

  def monochrome16(x) when is_number(x) do
    monochrome16(Nx.tensor([x]))
  end

  defp monochrome16_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: monochrome16_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def monochrome16_nif(_size, _x), do: raise("NIF monochrome16_nif/2 not implemented")

  def monochrome16i(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> monochrome16i_sub()
  end

  def monochrome16i(x) when is_number(x) do
    monochrome16i(Nx.tensor([x]))
  end

  defp monochrome16i_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: monochrome16i_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def monochrome16i_nif(_size, _x), do: raise("NIF monochrome16i_nif/2 not implemented")
end
