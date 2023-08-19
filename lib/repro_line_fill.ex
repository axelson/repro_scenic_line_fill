defmodule ReproLineFill do
  @moduledoc """
  Starter application using the Scenic framework.
  """

  def start(_type, _args) do
    # load the viewport configuration from config
    main_viewport_config = Application.get_env(:repro_line_fill, :viewport)

    # start the application with the viewport
    children = [
      {Scenic, [main_viewport_config]},
      ReproLineFill.PubSub.Supervisor
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
