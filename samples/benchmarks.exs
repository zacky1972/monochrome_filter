Application.put_env(:exla, :clients,
  default: [platform: :host],
  cuda: [platform: :cuda]
)

defmodule Mono do
  import Nx.Defn

  @defn_compiler EXLA
  defn host32(n), do: MonochromeFilter.monochrome_filter_32(n)

  @defn_compiler EXLA
  defn host16(n), do: MonochromeFilter.monochrome_filter_16(n)

  @defn_compiler {EXLA, client: :cuda}
  defn cuda32(n), do: MonochromeFilter.monochrome_filter_32(n)

  @defn_compiler {EXLA, client: :cuda}
  defn cuda16(n), do: MonochromeFilter.monochrome_filter_16(n)

  @defn_compiler {EXLA, client: :cuda, run_options: [keep_on_device: true]}
  defn cuda_keep32(n), do: MonochromeFilter.monochrome_filter_32(n)

  @defn_compiler {EXLA, client: :cuda, run_options: [keep_on_device: true]}
  defn cuda_keep16(n), do: MonochromeFilter.monochrome_filter_16(n)

  defn sub_abs_max(a, b) do
    Nx.subtract(a, b)
    |> Nx.as_type({:s, 8})
    |> Nx.abs()
    |> Nx.reduce_max()
  end

  def assert_result(expected, actual, message) do
    if Nx.to_scalar(sub_abs_max(expected, actual))  > 1 do
      IO.puts "#{Nx.to_scalar(sub_abs_max(expected, actual))}: #{message}"
    end
  end
end

input = MonochromeFilter.init_random_pixel()
result = MonochromeFilter.monochrome_filter_32(input)
Mono.assert_result(result, MonochromeFilter.monochrome_filter_16(input), "MonochromeFilter.monochrome_filter_16")
Mono.assert_result(result, MonochromeFilterNif.monochrome32(input), "MonochromeFilterNif.monochrome32")
Mono.assert_result(result, MonochromeFilterNif.monochrome32i(input), "MonochromeFilterNif.monochrome32i")
Mono.assert_result(result, MonochromeFilterNif.monochrome32ip(input), "MonochromeFilterNif.monochrome32ip")
Mono.assert_result(result, MonochromeFilterNif.monochrome16(input), "MonochromeFilterNif.monochrome16")
Mono.assert_result(result, MonochromeFilterNif.monochrome16i(input), "MonochromeFilterNif.monochrome16i")
Mono.assert_result(result, CvMonochrome.cv_monochrome(input), "CvMonochrome.cv_monochrome")

benches =   %{
  "Nx 32" => fn -> MonochromeFilter.monochrome_filter_32(input) end,
  "Nx 16" => fn -> MonochromeFilter.monochrome_filter_16(input) end,
  "nif 32" => fn -> MonochromeFilterNif.monochrome32(input) end,
  "nif 32 intrinsics" => fn -> MonochromeFilterNif.monochrome32i(input) end,
  "nif 32 intrinsics with pipeline" => fn -> MonochromeFilterNif.monochrome32ip(input) end,
  "nif 16" => fn -> MonochromeFilterNif.monochrome16(input) end,
  "nif 16 intrinsics" => fn -> MonochromeFilterNif.monochrome16i(input) end,
  "xla jit-cpu 32" => fn -> Mono.host32(input) end,
  "xla jit-cpu 16" => fn -> Mono.host16(input) end,
  "openCV cpu" => fn -> CvMonochrome.cv_monochrome(input) end
}

benches =
  if System.get_env("EXLA_TARGET") == "cuda" do
    di = Nx.backend_transfer(input, {EXLA.DeviceBackend, client: :cuda})

    Mono.assert_result(result, CvMonochrome.cv_monochrome_gpu(input), "CvMonochrome.cv_monochrome_gpu")

    Map.merge(benches, %{
      "xla jit-gpu 32" => fn -> Mono.cuda32(di) end,
      "xla jit-gpu 16" => fn -> Mono.cuda16(di) end,
      "xla jit-gpu keep 32" => fn -> Mono.cuda_keep32(di) end,
      "xla jit-gpu keep 16" => fn -> Mono.cuda_keep16(di) end,
      "openCV gpu" => fn -> CvMonochrome.cv_monochrome_gpu(input) end
    })
  else
    benches
  end

Benchee.run(
  benches,
  time: 10,
  memory_time: 2
) \
|> then(fn _ -> :ok end)
