defmodule ReproLineFill.Scene.Home do
  use Scenic.Scene
  require Logger

  alias Scenic.Graph

  import Scenic.Primitives
  # import Scenic.Components

  @note """
    This is a very simple starter application.

    If you want a more full-on example, please start from:

    mix scenic.new.example
  """

  @text_size 24

  # ============================================================================
  # setup

  # --------------------------------------------------------
  def init(scene, _param, _opts) do
    # get the width and height of the viewport. This is to demonstrate creating
    # a transparent full-screen rectangle to catch user input
    {width, height} = scene.viewport.size

    # show the version of scenic and the glfw driver
    scenic_ver = Application.spec(:scenic, :vsn) |> to_string()
    driver_ver = Application.spec(:scenic_driver_local, :vsn) |> to_string()

    info = "scenic: v#{scenic_ver}\nscenic_driver_local: v#{driver_ver}"

    graph = Graph.build(font: :roboto, font_size: @text_size, fill: :white)

    # If you uncomment the line below then the line will render
    # graph = Graph.build(font: :roboto, font_size: @text_size)

    graph =
      graph
      |> add_specs_to_graph([
        text_spec(info, translate: {20, 40}),
        text_spec(@note, translate: {20, 120}),
	# This only renders if there's no fill set on the graph
        line_spec({{0, 400}, {450, 400}}, stroke: {4, :red}),
        rect_spec({width, height}, fill: :transparent)
      ])

    scene = push_graph(scene, graph)

    {:ok, scene}
  end

  def handle_input(event, _context, scene) do
    Logger.info("Received event: #{inspect(event)}")
    {:noreply, scene}
  end
end
