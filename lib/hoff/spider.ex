defmodule Hoff.Spider do
  require Logger
  alias HTTPoison.Response

  @headers [
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1"
  ]

  def crawl(), do: crawl("https://molendatabase.nl/nederland/molens.php")

  def crawl(url) do
    Logger.debug("Crawlling URL #{url}")

    with {:ok, %Response{status_code: 200, body: body}} <- HTTPoison.get(url, @headers),
         {:ok, html} <- Floki.parse_document(body) do
      Logger.debug("Finished crawlling!")
      {:ok, html}
    end
  end

  def get_cells(html) do
    html
    |> Floki.find("div.cell")
    |> Enum.map(&parse_cell_html/1)
  end

  defp parse_cell_html(cell_html) do
    %{
      name: Floki.find(cell_html, "div.molennaam a") |> Floki.text(),
      location: Floki.find(cell_html, "span.molenplaats") |> Floki.text(),
      summary: Floki.find(cell_html, "span.molendetails") |> Floki.text(),
      mill_detailt_url: Floki.find(cell_html, "div.molennaam a") |> Floki.attribute("href")
    }
  end
end


# {"div", [{"class", "cell"}],
#  [
#    {"div", [{"class", "molenfiche"}],
#     [
#       {"div", [{"class", "molenfoto"}],
#        [
#          {"a", [{"href", "molen.php?nummer=1"}],
#           [
#             {"img",
#              [
#                {"src", "maak280.php?filename=drenthe/1_1.png"},
#                {"alt", "Jantina Hellingmolen"},
#                {"title", "Jantina Hellingmolen"}
#              ], []}
#           ]}
#        ]},
#       {"div", [{"class", "molennaam"}],
#        [
#          {"h3", [],
#           [
#             {"a", [{"href", "molen.php?nummer=1"}], ["Jantina Hellingmolen"]},
#             {"br", [], []},
#             {"span", [{"class", "molenplaats"}],
#              ["Aalden, ", {"strong", [], ["Drenthe"]}]}
#           ]}
#        ]},
#       {"span", [{"class", "molendetails"}],
#        [
#          "\n\t\t\t               \n\t\t\t\t\t\t  \tType: Beltmolen",
#          {"br", [], []},
#          "\n\t\t\t                Functie: Korenmolen",
#          {"br", [], []},
#          "\n\t\t\t                Kenmerk: Achtkante molen",
#          {"br", [], []},
#          "\n\t\t\t                \n      \n\t\t\t                \t\t\t                \t\t\t\t                Laatste aanpassing: \t            \n\t\t\t\t            \t27-04-2020, Foto \t\t\t\t\t\t\t\t\t\t              "
#        ]},
#       {"a", [{"href", "molen.php?nummer=1"}], ["Bekijk alle details ▸"]}
#     ]},
#    {:comment, " einde molenfiche /"}
#  ]}




# molen.pictureCover = prefixURL + '/' + mill.find('img')['src']
#         molen.name = mill.find('div', class_='molennaam').find('a').text.strip()
#         molen.location = mill.find('span', class_='molenplaats').text.strip()
#         molen.summary = mill.find('span', class_='molendetails').text.strip()
#         millDetailURL = prefixURL + '/' + mill.find('div', class_='molennaam').find('a')['href']


[
  {
    "a",
    [
      {"href", "molen.php?nummer=1"}
    ],
    ["Jantina Hellingmolen"]
  }
]
