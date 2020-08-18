defmodule Hoff.Spider do
  use Crawly.Spider
  require Logger

  @base_url "https://molendatabase.nl"
  # base_url = "https://molendatabase.nl"

  @impl Crawly.Spider
  def base_url(), do: @base_url

  @impl Crawly.Spider
  def init() do
    Logger.debug("Starting Spider worker to look at URL #{@base_url}/nederland/molens.php")
    [start_urls: ["#{@base_url}/nederland/molens.php"]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    IO.inspect(response, label: "Response")
  end
end
