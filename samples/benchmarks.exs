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
end

input = MonochromeFilter.init_pixel()
result = MonochromeFilter.monochrome_filter_32(input)
^result = MonochromeFilter.monochrome_filter_16(input)

benches =   %{
  "Nx 32" => fn -> MonochromeFilter.monochrome_filter_32(input) end,
  "Nx 16" => fn -> MonochromeFilter.monochrome_filter_16(input) end,
  "xla jit-cpu 32" => fn -> Mono.host32(input) end,
  "xla jit-cpu 16" => fn -> Mono.host16(input) end
}

benches =
  if System.get_env("EXLA_TARGET") == "cuda" do
    di = Nx.backend_transfer(input, {EXLA.DeviceBackend, client: :cuda})

    Map.merge(benches, %{
      "xla jit-gpu 32" => fn -> Mono.cuda32(di) end,
      "xla jit-gpu 16" => fn -> Mono.cuda16(di) end,
      "xla jit-gpu keep 32" => fn -> Mono.cuda_keep32(di) end,
      "xla jit-gpu keep 16" => fn -> Mono.cuda_keep16(di) end
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
