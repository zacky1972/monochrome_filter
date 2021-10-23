defmodule MonochromeFilter do
  import Nx.Defn

  @moduledoc """
  Documentation for `MonochromeFilter`.
  """

  defn transpose_vector(vector) do
    Nx.reshape(vector, {Nx.size(vector), 1})
  end

  defn broadcast_vector(vector, shape_tensor) do
    vector
    |> transpose_vector()
    |> Nx.broadcast(shape_tensor)
  end

  defn monochrome_filter_32(pixel) do
    assert_shape_pattern pixel, {_, 3}

    mono = Nx.tensor([0.299, 0.587, 0.114], type: {:f, 32})
    pixel_m = Nx.dot(pixel, mono)

    broadcast_vector(pixel_m, pixel)
    |> Nx.round()
    |> Nx.as_type({:u, 8})
  end

  defn monochrome_filter_16(pixel) do
    assert_shape_pattern pixel, {_, 3}

    mono = Nx.tensor([0.299, 0.587, 0.114], type: {:f, 16})
    pixel_m = Nx.dot(pixel, mono)

    broadcast_vector(pixel_m, pixel)
    |> Nx.round()
    |> Nx.as_type({:u, 8})
  end

  defn init_pixel() do
    Nx.tensor([0x9f, 0x5a, 0xae], type: {:u, 8})
    |> broadcast_vector(Nx.iota({3, 65536}))
    |> Nx.transpose()
  end

  defn init_random_pixel() do
    Nx.random_uniform({65536, 3})
    |> Nx.multiply(255)
    |> Nx.round()
    |> Nx.as_type({:u, 8})
  end
end
