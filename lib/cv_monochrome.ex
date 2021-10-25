defmodule CvMonochrome do
  require Logger

  @moduledoc """
  Documentation for `CvMonochrome`.
  """

  @on_load :load_nif

  def load_nif do
    nif_file = '#{Application.app_dir(:monochrome_filter, "priv/libcv")}'

    case :erlang.load_nif(nif_file, 0) do
      :ok -> :ok
      {:error, {:reload, _}} -> :ok
      {:error, reason} -> Logger.error("Failed to load NIF: #{inspect(reason)}")
    end
  end

  def cv_monochrome(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> cv_monochrome_sub()
  end

  def cv_monochrome(x) when is_number(x) do
    cv_monochrome(Nx.tensor([x]))
  end

  defp cv_monochrome_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: cv_monochrome_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def cv_monochrome_nif(_size, _x), do: raise("NIF cv_monochrome_nif/2 not implemented")

  def cv_monochrome_gpu(x) when is_struct(x, Nx.Tensor) do
    if Nx.type(x) == {:u, 8} do
      x
    else
      Nx.as_type(x, {:u, 8})
    end
    |> cv_monochrome_gpu_sub()
  end

  def cv_monochrome_gpu(x) when is_number(x) do
    cv_monochrome_gpu(Nx.tensor([x]))
  end

  defp cv_monochrome_gpu_sub(t) do
    %{
      t
      | data: %{
          t.data
          | state: cv_monochrome_gpu_nif(Nx.shape(t) |> elem(0), t.data.state)
        }
    }
  end

  def cv_monochrome_gpu_nif(_size, _x), do: raise("NIF cv_monochrome_gpu_nif/2 not implemented")
end
