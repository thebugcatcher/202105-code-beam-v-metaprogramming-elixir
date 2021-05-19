# defmodule Mix.Tasks.FinalMusic do
#   @moduledoc false
#
#   use MixMusic.DSL
#
#   sequence :intro do
#     note(:e, octet: 4, duration: 0.1)
#     note(:e, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:e, octet: 4, duration: 0.1, volume: 75)
#     note(:rest, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:e, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:g, octet: 4, duration: 0.2)
#     note(:rest, duration: 0.2)
#     note(:g, octet: 3, duration: 0.2)
#   end
#
#   sequence :break8 do
#     note(:rest, duration: 0.8)
#   end
#
#   sequence :break4 do
#     note(:rest, duration: 0.4)
#   end
#
#   sequence :second do
#     note(:c, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.4)
#     note(:g, octet: 3, duration: 0.1)
#     note(:rest, duration: 0.4)
#     note(:e, octet: 3, duration: 0.1)
#     note(:rest, duration: 0.4)
#     note(:a, octet: 3, duration: 0.1)
#     note(:rest, duration: 0.2)
#     note(:b, octet: 3, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:a, modifier: :sharp, octet: 3, duration: 0.1)
#     note(:a, octet: 3, duration: 0.1)
#     note(:rest, duration: 0.2)
#     note(:g, octet: 3, duration: 0.1)
#     note(:e, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:g, octet: 4, duration: 0.1)
#     note(:a, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:f, octet: 4, duration: 0.1)
#     note(:g, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:e, octet: 4, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:d, octet: 4, duration: 0.1)
#     note(:b, octet: 3, duration: 0.1)
#   end
#
#   sequence :third do
#     note(:g, octet: 4, duration: 0.1)
#     note(:f, modifier: :sharp, octet: 4, duration: 0.1)
#     note(:f, octet: 4, duration: 0.1)
#     note(:d, modifier: :sharp, octet: 4, duration: 0.1)
#     note(:e, octet: 4, duration: 0.2)
#     note(:rest, duration: 0.2)
#     note(:a, octet: 3, duration: 0.1)
#     note(:a, octet: 3, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:a, octet: 3, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:d, octet: 4, duration: 0.1)
#   end
#
#   sequence :fourth do
#     note(:g, octet: 4, duration: 0.1)
#     note(:f, modifier: :sharp, octet: 4, duration: 0.1)
#     note(:f, octet: 4, duration: 0.1)
#     note(:d, modifier: :sharp, octet: 4, duration: 0.1)
#     note(:e, octet: 4, duration: 0.2)
#     note(:rest, duration: 0.2)
#     note(:c, octet: 5, duration: 0.1)
#     note(:c, octet: 5, duration: 0.1)
#     note(:c, octet: 5, duration: 0.1)
#   end
#
#   sequence :fifth do
#     note(:d, modifier: :sharp, octet: 4, duration: 0.2)
#     note(:rest, duration: 0.1)
#     note(:d, octet: 4, duration: 0.2)
#     note(:rest, duration: 0.1)
#     note(:c, octet: 4, duration: 0.2)
#   end
#
#   sequence :sixth do
#     note(:c, octet: 4, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.4)
#     note(:d, octet: 4, duration: 0.1)
#   end
#
#   sequence :seventh do
#     note(:e, octet: 4, duration: 0.1)
#     note(:c, octet: 4, duration: 0.1)
#     note(:rest, duration: 0.2)
#     note(:a, octet: 3, duration: 0.1)
#     note(:g, octet: 3, duration: 0.1)
#   end
#
#   sequence :final do
#     embed_notes(:intro)
#     embed_notes(:break8)
#     embed_notes(:second)
#     embed_notes(:break4)
#     embed_notes(:second)
#     embed_notes(:break8)
#     embed_notes(:third)
#     embed_notes(:break4)
#     embed_notes(:fourth)
#     embed_notes(:break8)
#     embed_notes(:third)
#     embed_notes(:break4)
#     embed_notes(:fifth)
#     embed_notes(:break8)
#     embed_notes(:sixth)
#     embed_notes(:seventh)
#     embed_notes(:break4)
#     embed_notes(:sixth)
#     embed_notes(:break8)
#     embed_notes(:break4)
#     embed_notes(:sixth)
#     embed_notes(:seventh)
#     embed_notes(:break4)
#     embed_notes(:intro)
#   end
#
#   use Mix.Task
#
#   def run(_) do
#     __MODULE__.play(:final)
#   end
# end
